/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.OrderDetail;
import ModelDAO.OrderDAO;
import ModelDAO.OrderDetailDAO;
import ModelDAO.SendEmail;
import ModelDAO.TicketDAO;
import ModelDAO.TransactionDAO;
import ModelDAO.UserDAO;
import Validation.GenerateID;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class PaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
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
        String experationDate = request.getParameter("experationDate");
        String totalPrice = request.getParameter("totalPrice");
        String parkID = request.getParameter("parkID");
        String orderID = request.getParameter("orderID");
        String action = request.getParameter("action");
        String userID = request.getParameter("userID");
        String email = request.getParameter("email");
        int pointprice = Integer.parseInt(request.getParameter("pointprice"));
        int point = Integer.parseInt(request.getParameter("point"));
        if(action.equals("money")){
           HttpSession session = request.getSession();
           session.setAttribute("experationDate", experationDate);
           response.sendRedirect("payment/payment_vnPay.jsp?price="+totalPrice+"&orderID="+orderID+ "&parkID="+parkID); 
        } else if(action.equals("point")){
            try {
                UserDAO userDAO = new UserDAO();
                userDAO.PayPointByUserID(point - pointprice, userID);
                HttpSession session = request.getSession();
                OrderDetail odt = new OrderDetail();   
                Map<String, OrderDetail> cart = (Map<String, OrderDetail>) session.getAttribute("cart");
                Set<String> keys = cart.keySet();
                OrderDAO orderDAO = new OrderDAO();
                TransactionDAO tdao = new TransactionDAO();
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                TicketDAO ticketDAO = new TicketDAO();
                SendEmail sendEmail = new SendEmail();
                Date now = new Date();
                Timestamp timestampFromDate = new Timestamp(now.getTime());
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                String formatDate = dateFormat.format(timestampFromDate);
                GenerateID generateID = new GenerateID();
                String gorderID = generateID.generateID("OR");
                orderDAO.addNewOrder(gorderID, userID, null, formatDate, email);
                for (String key : keys) {
                    orderDetailDAO.addNewOrderDetail(gorderID, key, cart.get(key).getQuantity());
                    for (int i = 1; i <= cart.get(key).getQuantity(); i++){                    
                        ticketDAO.addNewTicket(key, gorderID, 0, experationDate);
                    }
                }             
                sendEmail.sendQR(email, "Your tickets: ", gorderID);
                response.sendRedirect("booking/cart.jsp?parkID="+parkID);
            } catch (Exception ex) {
                Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }   
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
