/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Voucher;
import Validation.GenerateID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class VoucherDAO {
    private final ConnectDB db;
    
    public VoucherDAO() throws Exception {
        db = new ConnectDB();
    }
    
    public List<Voucher> getAllVoucher(){
        List<Voucher> list = new ArrayList<>();
        String sql = "select * from Voucher";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Voucher vch = mapResultSetToVoucher(rs);
                list.add(vch);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Voucher getVoucherBYVoucherCode(String voucherCode) throws SQLException{
        Voucher vch = new Voucher();
        String query = "SELECT * FROM Voucher where voucherCode = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, voucherCode);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    vch = mapResultSetToVoucher(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return vch;
    }
    
    public String getVoucherCodeBYParkID(String parkID) throws SQLException{
        Voucher vch = new Voucher();
        String query = "SELECT VoucherCode FROM Voucher where ParkID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, parkID);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    vch = mapResultSetToVoucher(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return vch.getVoucherCode();
    }
    
    public void updateisUsedByVoucherCode(String voucherCode) {
        String query = "UPDATE Voucher SET isUsed = ? WHERE VoucherCode = ?";
        Connection conn;
        PreparedStatement statement;
        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setBoolean(1, true);
            statement.setString(2, voucherCode);
            statement.execute();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    public void addNewVoucher(String parkID, String voucherCode, double discountRate) throws SQLException, Exception {
        String query = "INSERT INTO Voucher VALUES (?, ?, ?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gn.generateID("VH"));
                statement.setString(2, parkID);
                statement.setString(3, voucherCode);
                statement.setDouble(4, discountRate);
                statement.setBoolean(5, false);
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    private Voucher mapResultSetToVoucher(ResultSet resultSet) throws SQLException {
        Voucher vch = new Voucher();
        vch.setVoucherID(resultSet.getString("VoucherID"));
        vch.setParkID(resultSet.getString("ParkID"));
        vch.setVoucherCode(resultSet.getString("VoucherCode"));
        vch.setDiscountRate(resultSet.getDouble("DiscountRate"));
        vch.setIsUsed(resultSet.getBoolean("isUsed"));
        return vch;
    }
    
    public String randomVoucherCode(int len){
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    } 
}
