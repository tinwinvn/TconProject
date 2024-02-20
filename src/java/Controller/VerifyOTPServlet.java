/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelDAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
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
public class VerifyOTPServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyOTPServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyOTPServlet at " + request.getContextPath() + "</h1>");
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
        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String userOTP = request.getParameter("otp");
        String saveOTP = (String) request.getSession().getAttribute("otp");
        System.out.println(userOTP);
        LocalDateTime expirationTime = (LocalDateTime) request.getSession().getAttribute("otpExpirationTime");
        if (isOTPValid(saveOTP, expirationTime) && saveOTP.equals(userOTP)) {
            if (userId != null) {

                response.sendRedirect("resetpassword.jsp?userId=" + userId);
            } else {
                try {
                    UserDAO u = new UserDAO();
                    System.out.println(u);
                    u.addNewUser(email, pass);
                    response.sendRedirect("login.jsp");
                } catch (Exception ex) {
                    Logger.getLogger(VerifyOTPServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    private boolean verifyOTP(String email, String userOTP) {
        String saveOTP = SendEmailServlet.emailToOTP.get(email);
        return userOTP.equals(saveOTP);

    }

    private boolean isOTPValid(String saveOTP, LocalDateTime expirationTime) {
        if (saveOTP != null && expirationTime != null) {
            LocalDateTime currentTime = LocalDateTime.now();
            return currentTime.isBefore(expirationTime);
        }
        return false;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
