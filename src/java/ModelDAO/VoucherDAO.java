/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class VoucherDAO {

    private final ConnectDB db;

    public VoucherDAO() throws Exception {
        db = new ConnectDB();
    }

    public Boolean checkVoucherCode(String code) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Voucher] where VoucherCode = ?";
        Connection conn;
        try {
            conn = db.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void createVoucher(String code, Integer discount, Boolean isUsed, String userID) {
        String sql = "INSERT INTO [dbo].[Voucher]\n"
                + "           ([VoucherID]\n"
                + "           ,[UserID]\n"
                + "           ,[VoucherCode]\n"
                + "           ,[DiscountRate]\n"
                + "           ,[isUsed])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        Connection conn;
        try {
            conn = db.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(2, userID);
            st.setString(1, code);
            st.setString(3, code);
            st.setInt(4, discount);
            st.setBoolean(5, isUsed);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
