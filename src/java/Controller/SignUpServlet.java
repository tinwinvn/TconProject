/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelDAO.SendEmail;
import ModelDAO.UserDAO;
import static Controller.SendEmailServlet.emailToExpirationTime;
import static Controller.SendEmailServlet.emailToOTP;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
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
 * @author Nguyen Nhu Loc
 */
public class SignUpServlet extends HttpServlet {

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
            out.println("<title>Servlet SignUpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUpServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String repass = request.getParameter("repassword");
        try {
            UserDAO am = new UserDAO();
            User a = am.getUserByEmail(email);
            System.out.println(a);
            if (checkUserExists(email)) {
                if (a != null) {
                    response.sendRedirect("error.jsp");

                } else if (!am.checkPassword(pass)) {
                    response.sendRedirect("test.jsp");
                } else {
                    String encodePass = am.toSHA256(pass);
                    String otp = generateOTP();
                    saveOTP(email, otp);
                    SendEmail sendEmail = new SendEmail();
                    sendEmail.send(email, otp);

                    HttpSession session = request.getSession();
                    LocalDateTime expirationTime = LocalDateTime.now().plusMinutes(2);
                    session.setAttribute("otpExpirationTime", expirationTime);

                    // Lưu mã OTP và thời điểm hết hạn vào Map
                    emailToOTP.put(email, otp);
                    emailToExpirationTime.put(email, expirationTime);

                    session.setAttribute("otp", otp);
                    if (pass.equals(repass)) {

                        response.sendRedirect("verifySignUp.jsp?email=" + email + "&password=" + encodePass);
                    } else {
                        response.sendRedirect("login.jsp");
                    }
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
