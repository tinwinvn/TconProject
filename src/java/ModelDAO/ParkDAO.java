/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Park;
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
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Park pk = mapResultSetToPark(rs);
                System.out.println(pk.getImage());
                list.add(pk);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
     private Park mapResultSetToPark(ResultSet resultSet) throws SQLException {
        Park pk = new Park();
        pk.setParkID(resultSet.getString("ParkID"));
        pk.setUserID(resultSet.getString("UserID"));
        pk.setParkName(resultSet.getString("ParkName"));
        pk.setAddress(resultSet.getString("Address"));
        pk.setImage(resultSet.getString("Image"));
        return pk;
    }
}
