package Controller;

import ModelDAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Cookie arr[] = request.getCookies();
        UserDAO userAlgorithm;
        try {
            userAlgorithm = new UserDAO();
            String username = null;
            String password = null;
            String status = null;
            User u = null;
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("userC")) {
                        username = o.getValue();
                    }
                    if (o.getName().equals("passC")) {
                        password = o.getValue();
                    }
                    if (o.getName().equals("statusC")){
                        status = o.getValue();
                    }
                }
                if (status.equals("login")){
                    String encodePass = userAlgorithm.toSHA256(password);
                    u = userAlgorithm.login(username, encodePass);                 
                }                   
            }
            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("acc", u);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");
            UserDAO userAlgorithm = new UserDAO();
            String encodePass = userAlgorithm.toSHA256(password);
            User u = userAlgorithm.login(username, encodePass);
            if (u == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("acc", u);
                session.setAttribute("pass", password);
                String token = userAlgorithm.getToken(u.getUserID(), u.getRole());
                
                Cookie user = new Cookie("userC", username);
                Cookie pass = new Cookie("passC", password);
                Cookie rem = new Cookie("remC", remember);
                Cookie status = new Cookie("statusC", "login");
                Cookie tokenC = new Cookie("token", token);
                if (remember != null) {
                    user.setMaxAge(60 * 60 * 24 * 365);
                    pass.setMaxAge(60 * 60 * 24 * 365);
                    rem.setMaxAge(60 * 60 * 24 * 365);
                    status.setMaxAge(60 * 60 * 24 * 365);
                    tokenC.setMaxAge(60 * 60 * 24 * 365);
                } else {
                    user.setMaxAge(0);
                    pass.setMaxAge(0);
                    rem.setMaxAge(0);
                    status.setMaxAge(0);
                    tokenC.setMaxAge(0);
                }
                response.addCookie(user);
                response.addCookie(pass);
                response.addCookie(rem);
                response.addCookie(status);
                response.addCookie(tokenC);
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
