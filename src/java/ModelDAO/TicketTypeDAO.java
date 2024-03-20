/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.TicketType;
import Validation.GenerateID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TicketTypeDAO {

    private final ConnectDB db;

    public TicketTypeDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<TicketType> getAllTicketType() {
        List<TicketType> list = new ArrayList<>();
        String sql = "select * from TicketType";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TicketType tkt = mapResultSetToTicketType(rs);
                list.add(tkt);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public TicketType getTicketTypeByID(String TicketTypeID) throws SQLException {
        TicketType tt = new TicketType();
        String query = "SELECT * FROM TicketType where TicketTypeID = ?";
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
                    return mapResultSetToTicketType(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return tt;
    }

    public String getParkIDByTicketTypeID(String TicketTypeID) throws SQLException {
        TicketType tt = new TicketType();
        String query = "SELECT * FROM TicketType where TicketTypeID = ?";
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
                    tt = mapResultSetToTicketType(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return tt.getParkID();
    }

    public void addNewTicketType(String parkID, String gameID, String TypeName, String Description, int Price) throws SQLException, Exception {
        String query = "INSERT INTO TicketType VALUES (?, ?, ?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();
        String ticketTypeID = gn.generateID("TT");
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, ticketTypeID);
                statement.setString(2, parkID);
                statement.setString(3, gameID);
                statement.setNString(4, TypeName);
                statement.setNString(5, Description);
                statement.setInt(6, Price);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }

    public void updateTicketType(String parkID, String gameID, String typeName, String description, int price, String ticketTypeID) throws SQLException, Exception {
        String query = "  update TicketType "
                + "  set ParkID = ?,"
                + "	GameID = ?,"
                + "	TypeName = ?,"
                + "	Description = ?,"
                + "	price = ?"
                + "	where TicketTypeID = ?";
        Connection conn;
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, parkID);
                statement.setString(2, gameID);
                statement.setString(3, typeName);
                statement.setString(4, description);
                statement.setInt(5, price);
                statement.setString(6, ticketTypeID);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void deleteTicketTypeByTicketTypeID(String ticketTypeID) throws SQLException, Exception {
        String query = "delete from TicketType where TicketTypeID = ?";
        Connection conn;
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, ticketTypeID);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }

    private TicketType mapResultSetToTicketType(ResultSet resultSet) throws SQLException {
        TicketType tkt = new TicketType();
        tkt.setTicketTypeID(resultSet.getString("TicketTypeID"));
        tkt.setParkID(resultSet.getString("ParkID"));
        tkt.setGameID(resultSet.getString("GameID"));
        tkt.setTypeName(resultSet.getString("TypeName"));
        tkt.setDescription(resultSet.getString("Description"));
        tkt.setPrice(resultSet.getInt("Price"));
        return tkt;
    }
}
