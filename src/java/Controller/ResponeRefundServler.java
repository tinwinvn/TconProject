/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelDAO.NotificationDAO;
import ModelDAO.TransactionDAO;
import ModelDAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ResponeRefundServler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResponeRefundServler</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResponeRefundServler at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String senderID = request.getParameter("senderID");
        String receiverID = request.getParameter("receiverID");
        String accept = request.getParameter("accept");
        String denied = request.getParameter("denied");
        String transactionCode = request.getParameter("transactionCode");
        Date currentDate = new Date(System.currentTimeMillis());
        String notificationID = request.getParameter("notificationID");
        boolean isConfirm = true;
        System.out.println(notificationID);
        try {
            UserDAO udao = new UserDAO();
             NotificationDAO notiDAO = new NotificationDAO();
             TransactionDAO tdao = new TransactionDAO();
            if (accept != null) {
                String transactionID = tdao.getTransactionIDbyTransactionCode(transactionCode);
                tdao.updateTransactionStatus(transactionID, 2);
                notiDAO.addNewNotification(senderID, receiverID, "Respone Request", "Your request is accepted \nPlease waiting for refund", currentDate);
                udao.UpdatePointByUserID(receiverID);
                notiDAO.updateNotification(isConfirm, notificationID);
            } else if (denied != null){
                String transactionID = tdao.getTransactionIDbyTransactionCode(transactionCode);
                tdao.updateTransactionStatus(transactionID, 4);
                notiDAO.addNewNotification(senderID, receiverID, "Respone Request", "Your request is denied because your request is invalid \nPlease check your request again", currentDate);
                
                notiDAO.updateNotification(isConfirm, notificationID);
            }
            response.sendRedirect("booking/notification_list.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ResponeRefundServler.class.getName()).log(Level.SEVERE, null, ex);
        }      
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
