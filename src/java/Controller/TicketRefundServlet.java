/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Order;
import Model.OrderDetail;
import Model.Ticket;
import ModelDAO.NotificationDAO;
import ModelDAO.OrderDAO;
import ModelDAO.OrderDetailDAO;
import ModelDAO.ParkDAO;
import ModelDAO.TicketDAO;
import ModelDAO.TicketTypeDAO;
import ModelDAO.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
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
        String ticketCode = request.getParameter("ticketCode");
        String senderID = request.getParameter("senderID");
        System.out.println(ticketCode);
        System.out.println(senderID);
        try {
            NotificationDAO notificationDAO = new NotificationDAO();
            TicketDAO ticketDAO = new TicketDAO();
            Ticket ticket = new Ticket();
            List<String> ticketID = ticketDAO.getTicketIDbyTicketCode(ticketCode);
            System.out.println(ticketID);
            TicketTypeDAO ticketTypeDAO = new TicketTypeDAO();
            ParkDAO parkDAO = new ParkDAO();
            Date currentDate = new Date(System.currentTimeMillis());
            List<String> ticketTypeIDs = ticketDAO.getTicketTypeIDsByTicketCode(ticketCode);
            System.out.println(ticketTypeIDs);
            for (String ticketTypeID : ticketTypeIDs) {
                String parkID = ticketTypeDAO.getParkIDByTicketTypeID(ticketTypeID);
                System.out.println(parkID);
                String userID = parkDAO.getUserIDByParkID(parkID);
                System.out.println(userID);

                if (ticketID != null && ticket.getTicketStatus() == 0) {
                    System.out.println(senderID);
                    notificationDAO.addNewNotification(senderID, userID, "Yêu cầu hoàn trả vé", ticketCode, currentDate);
                    response.sendRedirect("payment/order_history.jsp?userID=" + senderID);
                }
            }
        } catch (Exception ex) {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
