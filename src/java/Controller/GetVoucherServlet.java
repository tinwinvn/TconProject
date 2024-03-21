
package Controller;

import Model.User;
import Model.Voucher;
import ModelDAO.SendEmail;
import ModelDAO.UserDAO;
import ModelDAO.VoucherDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class GetVoucherServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetVoucherServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetVoucherServlet at " + request.getContextPath() + "</h1>");
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
        String parkID = request.getParameter("parkID");
        String voucherCode = request.getParameter("voucherCode");
        int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
        double voucherPrice = 0;
        try {
            VoucherDAO voucherDAO = new VoucherDAO();
                Voucher vch = voucherDAO.getVoucherBYVoucherCode(voucherCode);
                if(vch.getParkID().equals(parkID)){
                    voucherPrice = totalPrice - totalPrice * vch.getDiscountRate();
                    totalPrice = (int) voucherPrice;
                    voucherDAO.updateisUsedByVoucherCode(voucherCode);
                    request.setAttribute("totalPrice", totalPrice);
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(totalPrice);
                    response.sendRedirect("booking/cart.jsp?parkID=" + parkID);
                } else {
                    response.sendRedirect("booking/cart.jsp?parkID=" + parkID);
                }
        } catch (Exception ex) {
            Logger.getLogger(GetVoucherServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
