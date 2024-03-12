package Validation;

import Model.AddFavourite;
import Model.Notification;
import Model.Order;
import Model.OrderDetail;
import Model.Rating;
import Model.TransactionHistory;
import ModelDAO.UserDAO;
import Model.User;
import ModelDAO.AddFavouriteDAO;
import ModelDAO.NotificationDAO;
import ModelDAO.OrderDAO;
import ModelDAO.OrderDetailDAO;
import ModelDAO.RatingDAO;
import ModelDAO.TransactionDAO;
import java.util.ArrayList;
import java.util.List;

public class GenerateID {

    public String generateID(String entity) throws Exception {
        if (entity == "OD") {
            OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
            if (orderdetailDAO.getAllOrderDetail().isEmpty()) {
                return entity + "000001";
            }
            List<OrderDetail> listOrderDetail = orderdetailDAO.getAllOrderDetail();
            for (OrderDetail orderdetail : listOrderDetail) {
                String numID = orderdetail.getOrderDetailID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        } else if (entity == "OR") {
            OrderDAO orderDAO = new OrderDAO();
            if (orderDAO.getAllOrder().isEmpty()) {
                return entity + "000001";
            }
            List<Order> listOrder = orderDAO.getAllOrder();
            for (Order order: listOrder) {
                String numID = order.getOrderID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        } else if (entity == "NT") {
            NotificationDAO notificationDAO = new NotificationDAO();
            if (notificationDAO.getAllNotification().isEmpty()) {
                return entity + "000001";
            }
            List<Notification> listNotification= notificationDAO.getAllNotification();
            for (Notification notification : listNotification) {
                String numID = notification.getNotificationID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        } else if (entity == "AF") {
            AddFavouriteDAO addfavouriteDAO = new AddFavouriteDAO();
            if (addfavouriteDAO.getAllAddFavourite().isEmpty()) {
                return entity + "000001";
            }
            List<AddFavourite> listAddFavourite= addfavouriteDAO.getAllAddFavourite();
            for (AddFavourite addfavourite : listAddFavourite) {
                String numID = addfavourite.getFavouriteID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        } else if (entity == "TS") {
            TransactionDAO transactionDAO = new TransactionDAO();
            if (transactionDAO.getAllTransaction().isEmpty()) {
                return entity + "000001";
            }
            List<TransactionHistory> listTransactionHistory = transactionDAO.getAllTransaction();
            for (TransactionHistory transactionHistory: listTransactionHistory) {
                String numID = transactionHistory.getTransactionID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        } else if (entity == "RT") {
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
        } else{

            UserDAO userDAO = new UserDAO();
            if (userDAO.getAllUser().isEmpty()) {
                return entity + "000001";
            }

            ArrayList<User> listUser = userDAO.getAllUser();
            for (User user : listUser) {
                String numID = user.getUserID().substring(2);
                int num = Integer.parseInt(numID);
                String nextID = entity + (String.format("%06d", num + 1));
                if (!isDupplicatedID(nextID, entity)) {
                    return nextID;
                }
            }
        }

        return null;
    }

    public boolean isDupplicatedID(String id, String entity) throws Exception {
        if (entity == "OD") {
            OrderDetailDAO orderdetailDAO = new OrderDetailDAO();
            List<OrderDetail> listOrderdetail = orderdetailDAO.getAllOrderDetail();
            for (OrderDetail orderdetail : listOrderdetail) {
                if (orderdetail.getOrderDetailID().equals(id)) {
                    return true;
                }
            }
        } else if (entity == "OR") {
            OrderDAO orderDAO = new OrderDAO();
            List<Order> listOrder = orderDAO.getAllOrder();
            for (Order order: listOrder) {
                if (order.getOrderID().equals(id)) {
                    return true;
                }
            }
        } else if (entity == "AF") {
            AddFavouriteDAO addfavouriteDAO = new AddFavouriteDAO();
            List<AddFavourite> listAddFavourite = addfavouriteDAO.getAllAddFavourite();
            for (AddFavourite addfavourite : listAddFavourite) {
                if (addfavourite.getFavouriteID().equals(id)) {
                    return true;
                }
            }
        } else if (entity == "NT") {
            NotificationDAO notificationDAO = new NotificationDAO();
            List<Notification> listNotification = notificationDAO.getAllNotification();
            for (Notification notification : listNotification) {
                if (notification.getNotificationID().equals(id)) {
                    return true;
                }
            }
        } else if (entity == "TS") {
            TransactionDAO transactionDAO = new TransactionDAO();
            List<TransactionHistory> listTransaction = transactionDAO.getAllTransaction();
            for (TransactionHistory transactionHistory : listTransaction) {
                if (transactionHistory.getTransactionID().equals(id)) {
                    return true;
                }
            }
        } else if (entity == "RT") {
            RatingDAO ratingDAO = new RatingDAO();
            List<Rating> listRating = ratingDAO.getAllRating();
            for (Rating rating : listRating) {
                if (rating.getRatingID().equals(id)) {
                    return true;
                }
            }
        } else{
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
