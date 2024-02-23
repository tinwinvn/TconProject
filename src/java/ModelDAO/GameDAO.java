/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelDAO;

import DAO.ConnectDB;
import Model.Game;
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
public class GameDAO {

    private final ConnectDB db;

    public GameDAO() throws Exception {
        db = new ConnectDB();
    }

    public List<Game> getAllGame() {
        List<Game> list = new ArrayList<>();
        String sql = "select * from Game";
        Connection conn;
        try {
            conn = db.getConnection();
            System.out.println(conn);
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Game pk = mapResultSetToGame(rs);
                System.out.println(pk.getImage());
                list.add(pk);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
     private Game mapResultSetToGame(ResultSet resultSet) throws SQLException {
        Game pk = new Game();
        pk.setGameID(resultSet.getString("GameID"));
        pk.setParkID(resultSet.getString("ParkID"));
        pk.setGameName(resultSet.getString("GameName"));
        pk.setGameDescription(resultSet.getString("GameDescription"));
        pk.setImage(resultSet.getString("Image"));
        return pk;
    }

   
}
