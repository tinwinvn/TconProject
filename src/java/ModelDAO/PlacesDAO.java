/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Places;
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
public class PlacesDAO {

    private final ConnectDB db;

    public PlacesDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<Places> getAllPlaces() {
        List<Places> list = new ArrayList<>();
        String sql = "select * from Places";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Places c = new Places(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("price"),
                        rs.getString("image"));
                list.add(c);
                System.out.println(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
