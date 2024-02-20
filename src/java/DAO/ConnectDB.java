
package DAO;

import static DAO.DatabaseInfor.driverName;
import static DAO.DatabaseInfor.pass;
import static DAO.DatabaseInfor.url;
import static DAO.DatabaseInfor.user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ConnectDB implements DatabaseInfor{
    public ConnectDB() {
    }
    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(driverName);
            conn = DriverManager.getConnection(url, user, pass);
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void close(Connection conn, PreparedStatement ps, ResultSet rs) throws java.sql.SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }

        if (ps != null && !ps.isClosed()) {
            ps.close();
        }

        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
        public void close(Connection conn, Statement ps, ResultSet rs) throws java.sql.SQLException {
        if (rs != null && !rs.isClosed()) {
            rs.close();
        }

        if (ps != null && !ps.isClosed()) {
            ps.close();
        }

        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }

}
