package Validation;

import Model.Rating;
import ModelDAO.UserDAO;
import Model.User;
import ModelDAO.RatingDAO;
import java.util.ArrayList;
import java.util.List;

public class GenerateID {

    public String generateID(String entity) throws Exception {
        if (entity == "RT") {
            RatingDAO ratingDAO = new RatingDAO();
            if (ratingDAO.getAllRating().isEmpty()) {
                return entity + "000001";
            }
            List<Rating> listRating = ratingDAO.getAllRating();
            for (Rating rating : listRating) {
                String numID = rating.getRatingID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        } else {

            UserDAO userDAO = new UserDAO();
            if (userDAO.getAllUser().isEmpty()) {
                return entity + "000001";
            }

            ArrayList<User> listUser = userDAO.getAllUser();
            for (User user : listUser) {
                String numID = user.getUserID().substring(2);
                int num = Integer.parseInt(numID);
                System.out.println(num);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        }

        return null;
    }

    public boolean isDupplicatedID(String id, String entity) throws Exception {
        if (entity == "RT") {
            RatingDAO ratingDAO = new RatingDAO();
            List<Rating> listRating = ratingDAO.getAllRating();
            for (Rating rating : listRating) {
                if (rating.getRatingID().equals(id)) {
                    return true;
                }
            }
        } else {
            UserDAO userDAO = new UserDAO();
            ArrayList<User> listUser = userDAO.getAllUser();
            for (User user : listUser) {
                if (user.getUserID().equals(id)) {
                    return true;
                }
            }
        }
        return false;
    }

}
