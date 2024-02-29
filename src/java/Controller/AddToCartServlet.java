/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Order;
import Model.OrderDetail;
import Model.TicketType;
import ModelDAO.OrderDAO;
import ModelDAO.OrderDetailDAO;
import Validation.GenerateID;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String transactionCode = request.getParameter("transactionCode");
        String ticketTypeID = request.getParameter("ticketTypeID"); // Loại vé
        String parkID = request.getParameter("parkID");
        String orderID = request.getParameter("orderID");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int price = Integer.parseInt(request.getParameter("price"));
        HttpSession session = request.getSession();

        Map<String, OrderDetail> cart = (Map<String, OrderDetail>) session.getAttribute("cart");
        System.out.println(cart);
        GenerateID gn = new GenerateID();
        OrderDetail odt = new OrderDetail();
        try {
            OrderDetailDAO otd = new OrderDetailDAO();
            if (cart.containsKey(ticketTypeID)) {
                otd.updateOrderDetail(cart.get(ticketTypeID).getOrderDetailID(), cart.get(ticketTypeID).getQuantity() + quantity);
            } else {
                odt = new OrderDetail(gn.generateID("OD"), null, ticketTypeID, quantity);
                otd.addNewOrderDetail(orderID, ticketTypeID, quantity);
            }
        } catch (Exception ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Kiểm tra nếu vé đã được thêm vào giỏ hàng trước đó, tăng số lượng
        if (cart.containsKey(ticketTypeID)) {
            OrderDetail existingOrderDetail = cart.get(ticketTypeID);
            int oldQuantity = existingOrderDetail.getQuantity();
            existingOrderDetail.setQuantity(oldQuantity + quantity);
        } else {
            cart.put(ticketTypeID, odt);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("booking/ticketType_list.jsp?parkID=" + parkID + "&orderID=" + orderID);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
