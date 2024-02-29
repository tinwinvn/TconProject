/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.ParkDetail;
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
public class ParkDetailDAO {

    private final ConnectDB db;

    public ParkDetailDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<ParkDetail> getAllParkDetail() {
        List<ParkDetail> list = new ArrayList<>();
        String sql = "select * from ParkDetail";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ParkDetail pd = mapResultSetToParkDetail(rs);
                list.add(pd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    private ParkDetail mapResultSetToParkDetail(ResultSet resultSet) throws SQLException {
        ParkDetail pd = new ParkDetail();
        pd.setParkDetailID(resultSet.getString("ParkDetailID"));
        pd.setParkID(resultSet.getString("ParkID"));
        pd.setImage1(resultSet.getString("Image1"));
        pd.setImage2(resultSet.getString("Image2"));
        pd.setImage3(resultSet.getString("Image3"));
        pd.setImage_bg(resultSet.getString("Image_bg"));
        pd.setOpenrationTime(resultSet.getString("OpenrationTime"));
        return pd;
    }
}
