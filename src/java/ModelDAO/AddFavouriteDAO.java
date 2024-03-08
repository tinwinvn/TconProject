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
    
    public AddFavourite getAddfavouriteByID(String userID) throws SQLException{
        AddFavourite af = new AddFavourite();
        String query = "SELECT * FROM Addfavourite where UserID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, userID);
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
    
    public boolean isFavouriteItemExists(String userID, String favouriteItems) throws SQLException {
        boolean isExists = false;
        String query = "SELECT * FROM Addfavourite WHERE UserID = ? AND FavouriteItems = ?";
        Connection conn = null;
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, favouriteItems);
            
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // Nếu resultSet có dữ liệu, tức là đã tồn tại một bản ghi có favouriteItems tương tự cho userID
                    isExists = true;
                }
            }
        }
        
        return isExists;
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
    
    public void deleteFavourite(String favouriteID) throws SQLException, Exception {
        String query = "DELETE FROM Addfavourite WHERE FavouriteID = ?";
        Connection conn;
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, favouriteID);           
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
