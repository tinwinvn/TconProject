/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Game;
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
    
    public List<Game> getAllGame(){
        List<Game> list = new ArrayList<>();
        String sql = "select * from Game";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
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
    
    public Game getGameByParkID(String TicketTypeID) throws SQLException{
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
