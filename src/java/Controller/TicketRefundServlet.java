/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Order;
import Model.OrderDetail;
import ModelDAO.NotificationDAO;
import ModelDAO.OrderDAO;
import ModelDAO.OrderDetailDAO;
import ModelDAO.ParkDAO;
import ModelDAO.TicketTypeDAO;
import ModelDAO.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class TicketRefundServlet extends HttpServlet {

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
            out.println("<title>Servlet TicketRefundServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketRefundServlet at " + request.getContextPath() + "</h1>");
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
        String transactionCode = request.getParameter("transactionCode");
        String senderID = request.getParameter("senderID");
        try{
            NotificationDAO notificationDAO = new NotificationDAO();
            TransactionDAO transactionDAO= new TransactionDAO();
            TicketTypeDAO ticketTypeDAO = new TicketTypeDAO();
            ParkDAO parkDAO = new ParkDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            OrderDAO orderDAO = new OrderDAO();      
            Date currentDate = new Date(System.currentTimeMillis());
            String orderID = transactionDAO.getOrderIDbyTransactionCode(transactionCode);
            Order order = orderDAO.getOrderbyOrderID(orderID);
            OrderDetail orderDetail = orderDetailDAO.getOrderDetailByOrderID(orderID);           
            String parkID = ticketTypeDAO.getParkIDByTicketTypeID(orderDetail.getTicketTypeID()); 
            String userID = parkDAO.getUserIDByParkID(parkID);
            if (order.getOrderStatus() == 1){
                notificationDAO.addNewNotification(senderID, userID, "Yêu cầu hoàn trả vé",transactionCode, currentDate);
                response.sendRedirect("payment/payment_history.jsp?userID=" + senderID);
            } else if (order.getOrderStatus() == 2){
                response.sendRedirect("payment/payment_history.jsp?userID=" + senderID);
            }
            
        } catch (Exception ex){
            
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
