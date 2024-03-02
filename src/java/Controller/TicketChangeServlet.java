/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.OrderDetail;
import ModelDAO.NotificationDAO;
import ModelDAO.OrderDetailDAO;
import ModelDAO.ParkDAO;
import ModelDAO.TicketTypeDAO;
import ModelDAO.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class TicketChangeServlet extends HttpServlet {

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
            out.println("<title>Servlet TicketChangeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TicketChangeServlet at " + request.getContextPath() + "</h1>");
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
        try{
            TransactionDAO tdao = new TransactionDAO();
            NotificationDAO ndao = new NotificationDAO();
            OrderDetailDAO detailDAO = new OrderDetailDAO();
            TicketTypeDAO ticketTypeDAO = new TicketTypeDAO();
            
            String orderID = tdao.getOrderIDbyTransactionCode(transactionCode);
            OrderDetail orderDetail = detailDAO.getOrderDetailByOrderID(orderID);
            String parkID = ticketTypeDAO.getParkIDByTicketTypeID(orderDetail.getTicketTypeID());
            
            response.sendRedirect("CartServlet?orderID=" + orderID + "&parkID=" + parkID + "&transactionCode=" +transactionCode);
        }catch (Exception ex){
            Logger.getLogger(TicketChangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }             
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
