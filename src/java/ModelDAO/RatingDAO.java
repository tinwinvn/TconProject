package ModelDAO;

import Validation.GenerateID;
import Model.Rating;
import DAO.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RatingDAO {
    private final ConnectDB db;
    
    public RatingDAO() throws Exception {
        db = new ConnectDB();
    }
    
    public ArrayList<Rating> getAllRating() throws Exception {
        ArrayList<Rating> output = new ArrayList<>();
        String query = "SELECT * FROM Rating";
        Connection conn = null;
        Statement ps = null;
        ResultSet rs = null;
        
        try {
            conn = db.getConnection();
            ps = conn.createStatement();
            rs = ps.executeQuery(query);
            
            while(rs.next()){
                String ratingId = rs.getString(1);
                String sendId = rs.getString(2);
                String receiveId = rs.getString(3);
                String ratingText = rs.getString(4);
                int ratingValue = rs.getInt(5);
                Rating r = new Rating(ratingId, sendId, receiveId, ratingText, ratingValue);
                output.add(r);
                
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, ps, rs);
        }
        return output;
    }
    
    public boolean newRating (String ratingText, String uId, int ratingValue, String rId) throws Exception {
        String sql = "INSERT INTO Rating VALUES(?,?,?,?,?)";
        try {
            Connection con = db.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            GenerateID gID = new GenerateID();
            String id = gID.generateID("RT");
            pstmt.setString(1, id);
            pstmt.setString(2, uId);
            pstmt.setString(3, rId);
            pstmt.setString(4, ratingText);
            pstmt.setInt(5, ratingValue);
            return pstmt.executeUpdate()>0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
    public void deleteRating (String rId) throws Exception {
        String sql = "DELETE FROM Rating WHERE RatingID = ?";
        try {
            Connection conn = db.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, rId);
            pstmt.executeUpdate();
        }catch(Exception e) {
            
        }
    }
    
    public void updateRating(String newRatingText, String rID) throws Exception {
        String sql = "UPDATE Rating SET RatingText = ? WHERE RatingID = ?";
        try {
            Connection conn = db.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newRatingText);
            pstmt.setString(2, rID);
            pstmt.executeUpdate();
        }catch(Exception e){
            
        }
    }
    
    
    
}