package Validation;

import ModelDAO.UserDAO;
import Model.User;
import java.util.ArrayList;


public class GenerateID {
    public String generateID(String entity) throws Exception{
        UserDAO userDAO = new UserDAO();
        if(userDAO.getAllUser().isEmpty()){
            return entity + "000001";
        }
            
        ArrayList<User> listUser = userDAO.getAllUser();
        for(User user : listUser){
            String numID = user.getUserID().substring(2);
            int num = Integer.parseInt(numID);
            String nextID = entity + (String.format("%06d", num + 1));
            if(!isDupplicatedID(nextID)){
                return nextID;
            }
        }
        return null;
    }
    
    public boolean isDupplicatedID(String id) throws Exception{
        UserDAO userDAO = new UserDAO();
        ArrayList<User> listUser = userDAO.getAllUser();
        for( User user : listUser){
            if(user.getUserID().equals(id)) return true;
        }
        return false;
    }
    
}
