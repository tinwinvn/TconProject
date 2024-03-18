/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Park;
import Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nguyen Nhu Loc
 */
public class ParkDAO {

    private final ConnectDB db;

    public ParkDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<Park> getAllPark() {
        List<Park> list = new ArrayList<>();
        String sql = "select * from Park";
        Connection conn;
        try {
            conn = db.getConnection();
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Park pk = mapResultSetToPark(rs);
                list.add(pk);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public String getUserIDByParkID(String parkID) throws SQLException{
        String sql = "select * from Park where ParkID = ?";
        Park park = new Park();
        System.out.println(parkID);
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, parkID);
            rs = statement.executeQuery();
                if (rs.next()) {
                    park = mapResultSetToPark(rs);
                    System.out.println(park.getUserID());
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return park.getUserID();
    }
    
    public String getParkIDByUserID(String userID) throws SQLException {
        String sql = "SELECT * FROM Park WHERE UserID = ?";
        Park park = new Park();
        System.out.println(userID);
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, userID);
            rs = statement.executeQuery();
            if (rs.next()) {
                park = mapResultSetToPark(rs);
                System.out.println(park);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return park.getParkID();
    }

    
    public String getParkNameByParkID(String parkID) throws SQLException{
        String sql = "select * from Park where ParkID = ?";
        Park park = new Park();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, parkID);
            rs = statement.executeQuery();
                if (rs.next()) {
                    park = mapResultSetToPark(rs);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return park.getParkName();
    }
    
     private Park mapResultSetToPark(ResultSet resultSet) throws SQLException {
        Park pk = new Park();
        pk.setParkID(resultSet.getString("ParkID"));
        pk.setUserID(resultSet.getString("UserID"));
        pk.setParkName(resultSet.getString("ParkName"));
        pk.setAddress(resultSet.getString("Address"));
        pk.setImage(resultSet.getString("Image"));
        pk.setMapImage(resultSet.getString("MapImage"));
        pk.setOpenTime(resultSet.getTime("OpenTime"));
        pk.setCloseTime(resultSet.getTime("CloseTime"));
        return pk;
    }
}