/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.AddFavourite;
import Validation.GenerateID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AddFavouriteDAO {
    private final ConnectDB db;
    
    public AddFavouriteDAO() throws Exception {
        db = new ConnectDB();
    }
            
    public List<AddFavourite> getAllAddFavourite(){
        List<AddFavourite> list = new ArrayList<>();
        String sql = "select * from Addfavourite";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AddFavourite af = mapResultSetToAddFavourite(rs);
                list.add(af);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public AddFavourite getAddfavouriteByID(String TicketTypeID) throws SQLException{
        AddFavourite af = new AddFavourite();
        String query = "SELECT * FROM Addfavourite where UserID = ?";
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
                    return mapResultSetToAddFavourite(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return af;
    }
    
    public void addNewFavourite(String userID, String favouriteItems) throws SQLException, Exception {
        String query = "INSERT INTO Addfavourite VALUES (?, ?, ?)";
        Connection conn;
        GenerateID gn = new GenerateID();
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, gn.generateID("AF"));
                statement.setString(2, userID);
                statement.setString(3, favouriteItems);              
                statement.execute();
            }
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    private AddFavourite mapResultSetToAddFavourite(ResultSet resultSet) throws SQLException {
        AddFavourite af = new AddFavourite();
        af.setFavouriteID(resultSet.getString("FavouriteID"));
        af.setUserID(resultSet.getString("UserID"));
        af.setFavouriteItems(resultSet.getString("FavouriteItems"));
        return af;
    }
}
