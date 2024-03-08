/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelDAO.SendEmail;
import ModelDAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class SendEmailServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static Map<String, String> emailToOTP = new HashMap<>();
    static Map<String, LocalDateTime> emailToExpirationTime = new HashMap<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SendEmailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendEmailServlet at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        System.out.println(email);
        try {
            UserDAO am = new UserDAO();
            User a = am.getUserByEmail(email);
            System.out.println(a);
            if (checkUserExists(email)) {
                if (a == null) {
                    response.sendRedirect("error.jsp");
                } else {
                    String otp = generateOTP();
                    saveOTP(email, otp);                   
                    SendEmail sendEmail = new SendEmail();
                    sendEmail.sendOTP(email, otp);
                    
                   HttpSession session = request.getSession();
                    LocalDateTime expirationTime = LocalDateTime.now().plusMinutes(2);
                    session.setAttribute("otpExpirationTime", expirationTime);

                    // Lưu mã OTP và thời điểm hết hạn vào Map
                    emailToOTP.put(email, otp);
                    emailToExpirationTime.put(email, expirationTime);

                    session.setAttribute("otp", otp);
                    response.sendRedirect("verify.jsp?userId=" + a.getUserID());
                }

            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(SendEmailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private boolean checkUserExists(String email) {
        return true;
    }

    private void saveOTP(String email, String otp) {

        emailToOTP.put(email, otp);

    }

    private String generateOTP() {
        Random random = new Random();
        return String.format("%04d", random.nextInt(10000));
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
