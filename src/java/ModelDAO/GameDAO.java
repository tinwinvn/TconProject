/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Game;
import Validation.GenerateID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class GameDAO {

    private final ConnectDB db;

    public GameDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<Game> getAllGame() {
        List<Game> list = new ArrayList<>();
        String sql = "select * from Game";
        Connection conn;
        try {
            conn = db.getConnection();
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Game gm = mapResultSetToGame(rs);
                list.add(gm);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Game getGameByParkID(String TicketTypeID) throws SQLException {
        Game gm = new Game();
        String query = "SELECT * FROM Game where ParkID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, TicketTypeID);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToGame(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return gm;
    }

    public void addNewGame(String parkID, String gameName, String description, String image) throws SQLException, Exception {
        String query = "INSERT INTO Game VALUES (?, ?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();
        String gameID = gn.generateID("GA");
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gameID);
                statement.setString(2, parkID);
                statement.setString(3, gameName);
                statement.setString(4, description);
                statement.setString(5, image);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public String getImageByID(String gameID) {
        String img = null;
        String query = "Select Image from Game where GameID = ?";
        Connection conn;
        try {
            conn = db.getConnection();
            PreparedStatement st;
            st = conn.prepareStatement(query);
            st.setString(1, gameID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                img = rs.getString("Image");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return img;
    }

    public void updateNewGame(String gameID, String gameName, String description, String image) throws SQLException, Exception {
        String query = "update Game "
                + "Set GameName = ?,"
                + "	GameDescription = ?,"
                + "	Image = ?"
                + "	where GameID = ?";
        Connection conn;
        String img = getImageByID(gameID);
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gameName);
                statement.setString(2, description);
                if (image != null){
                    statement.setString(3, image);
                }else {
                    statement.setString(3, img);
                }
                statement.setString(4, gameID);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void deleteGameByID(String gameID) throws SQLException, Exception {
        String query = "delete from Game where GameID = ?";
        Connection conn;
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gameID);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }

    public String getGameNameByParkID(String ParkID) throws SQLException{
        Game gm = new Game();
        String query = "SELECT * FROM Game where ParkID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, ParkID);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    gm = mapResultSetToGame(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return gm.getGameName();
    }
    
    private Game mapResultSetToGame(ResultSet resultSet) throws SQLException {
        Game gm = new Game();
        gm.setGameID(resultSet.getString("GameID"));
        gm.setParkID(resultSet.getString("ParkID"));
        gm.setGameName(resultSet.getString("GameName"));
        gm.setGameDescription(resultSet.getString("GameDescription"));
        gm.setImage(resultSet.getString("Image"));
        return gm;
    }
}
