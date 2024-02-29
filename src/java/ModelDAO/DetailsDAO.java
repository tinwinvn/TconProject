/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Details;
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
public class DetailsDAO {

    private final ConnectDB db;

    public DetailsDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<Details> getAllDetails() {
        List<Details> list = new ArrayList<>();
        String sql = "select * from Details";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Details c = new Details(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image1"),
                        rs.getString("image2"),
                        rs.getString("image3"),
                        rs.getString("image_bg"),
                        rs.getString("address"),
                        rs.getString("time"),
                        rs.getString("price"),
                        rs.getString("email"),
                        rs.getString("place_id"));
                list.add(c);
                System.out.println(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
