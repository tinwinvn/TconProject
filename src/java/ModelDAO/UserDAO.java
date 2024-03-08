package ModelDAO;

import DAO.ConnectDB;
import Model.User;
import Validation.GenerateID;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserDAO {
    
    private final Pattern patternPassword = Pattern.compile("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[`~#?!@$%^&*-]).{8,32}$");
    private final ConnectDB db;

    public UserDAO() throws Exception {
        db = new ConnectDB();
    }

    public User login(String email, String pass) {
        String query = "select * from Users where Email = ? and Password = ?";
        Connection conn;
        PreparedStatement statement;
        ResultSet rs;
        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, pass);
            rs = statement.executeQuery();
            while (rs.next()) {
                return mapResultSetToUser(rs);
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<User> getAllUser() throws Exception {
        ArrayList<User> output = new ArrayList<>();
        String query = "SELECT * FROM Users";
        Connection conn = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.createStatement();
            rs = statement.executeQuery(query);

            while (rs.next()) {
                User u = mapResultSetToUser(rs);
                output.add(u);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return output;
    }

    public User getUserById(String id) throws SQLException, UnsupportedEncodingException {
        User u = new User();
        String query = "SELECT * FROM Users where UserID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, id);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToUser(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return u;
    }
    
    public User getUserByOrderId(String id) throws SQLException, UnsupportedEncodingException {
        User u = new User();
        String query = "SELECT * FROM Orders where OrderID = ?";
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, id);
            rs = statement.executeQuery();
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToUser(resultSet);
                }
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            db.close(conn, statement, rs);
        }
        return u;
    }

    public void updateUser(String name, String phone, String dob, String id) throws SQLException, UnsupportedEncodingException {
        String query = "UPDATE Users "
                + "SET FullName = ?, "
                + "Phone = ?, "
                + "Dob = ? "
                + "WHERE UserID = ?";
        User u = getUserById(id);
        Connection conn;
        PreparedStatement statement;
        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            if (name == null) {
                statement.setString(1, u.getFullName());
            } else {
                statement.setString(1, name);
            }
            if (phone == null) {
                statement.setString(2, u.getPhone());
            } else {
                statement.setString(2, phone);
            }
            if (dob == null) {
                statement.setDate(3, u.getDob());
            } else {
                statement.setDate(3, Date.valueOf(dob));
            }
            statement.setString(5, id);
            statement.execute();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            throw ex;
        }
    }

    public boolean newUser(String name, String phone, String email) throws Exception {
        String sql = "Insert into Users values(?,?,?,?)";
        try {
            Connection con = db.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            GenerateID g = new GenerateID();
            pstmt.setString(1, name);
            pstmt.setString(2, phone);
            pstmt.setString(3, email);
            pstmt.setBoolean(4, false);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public void updatePassword(String newpassword, String id) {
        String query = "UPDATE Users SET password = ? WHERE UserID = ?";
        Connection conn;
        PreparedStatement statement;
        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, newpassword);
            statement.setString(2, id);
            statement.execute();
            statement.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUserByEmail(String email) throws SQLException {
        String query = "SELECT * FROM Users WHERE Email = ?";

        Connection conn = null;
        PreparedStatement statement = null;

        try {
            conn = db.getConnection();
            statement = conn.prepareStatement(query);
            statement.setString(1, email);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapResultSetToUser(resultSet);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions
            e.printStackTrace();
        } finally {
            db.close(conn, statement, null);
        }
        return null;

    }

    public void addNewUser( String email, String password) throws Exception {
        String query = "INSERT INTO Users (UserID, Email, Password, Role, isActive) VALUES (?, ?, ?, ?, ?)";
        System.out.println(password);
        GenerateID gen = new GenerateID();
        String id = gen.generateID("US");
        Connection conn;
        try {

            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, id);
                statement.setString(2, email);
                statement.setString(3, password);
                statement.setInt(4, 3);
                statement.setBoolean(5, true);
                statement.execute();
            }            
            conn.close();
        } catch (SQLException e) {
        }
    }
    
        public void UpdatePointByUserID( String userID) throws Exception {
        String query = "update Users set Point = ? where UserID = ?";
        Connection conn;
        User user = getUserById(userID);
        int point = user.getPoint();
        int newPoint = ++point;
        try {
            conn = db.getConnection();
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, newPoint);
                statement.setString(2, userID);
                statement.execute();
            }            
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public User getUserByToken(String token) throws Exception{
        User u = null;
        for (User user : getAllUser()){
            if (getToken(user.getUserID(), user.getRole()).equals(token)){
                u = user;
            }
        }
        return u;
    }

    private User mapResultSetToUser(ResultSet resultSet) throws SQLException {
        User user = new User();
        user.setUserID(resultSet.getString("UserID"));
        user.setRole(resultSet.getInt("Role"));
        user.setEmail(resultSet.getString("Email"));       
        user.setPassword(resultSet.getString("Password"));
        user.setFullName(resultSet.getString("FullName"));
        user.setPhone(resultSet.getString("Phone"));
        user.setDob(resultSet.getDate("Dob"));
        user.setImage(resultSet.getString("Image"));
        user.setPoint(resultSet.getInt("Point"));
        user.setIsActive(resultSet.getBoolean("isActive"));
        return user;
    }
    
    public boolean checkPassword (String password){
        Matcher matcher = patternPassword.matcher(password);
        return matcher.matches();
    }
    
    public String toSHA256(String password){
        String salt = "aqwebcoiwentjghw1u3323hsuwetf";
        password += salt;
        try {
            // Create SHA-1 message digest
            MessageDigest sha1Digest = MessageDigest.getInstance("SHA-256");
            byte[] sha256Hash = sha1Digest.digest(password.getBytes());

            // Encode SHA-1 hash with Base64
            String base64Encoded = Base64.getEncoder().encodeToString(sha256Hash);

            return base64Encoded;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public String toSHA256token(String token){
        try {
            // Create SHA-1 message digest
            MessageDigest sha1Digest = MessageDigest.getInstance("SHA-256");
            byte[] sha256Hash = sha1Digest.digest(token.getBytes());

            // Encode SHA-1 hash with Base64
            String base64Encoded = Base64.getEncoder().encodeToString(sha256Hash);

            return base64Encoded;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public String getToken(String userID, int role){
        String roleS = String.valueOf(role);
        String token = userID + roleS;
        String encodeToken = toSHA256token(token);
        return encodeToken;
    }   
   
}
