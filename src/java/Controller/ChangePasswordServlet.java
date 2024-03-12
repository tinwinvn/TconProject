/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import ModelDAO.UserDAO;
import Model.User;
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
 * @author tbinh
 */
public class ChangePasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/plain");
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("confirmpassword");
        PrintWriter out = response.getWriter();
        String userId = request.getParameter("userId");
        System.out.println(userId);
        try {
            UserDAO ua = new UserDAO();
            User u = ua.getUserById(userId);
            String oldPasswordSHA = ua.toSHA256(oldPassword);
            System.out.println(oldPasswordSHA);
            System.out.println(u.getPassword());
            if(oldPasswordSHA.equals(u.getPassword()) && newPassword.equals(confirmPassword)){
                ua.updatePassword(newPassword, userId);
                response.getWriter().write("success");
                //request.getRequestDispatcher("profile.jsp?uId=" + userId ).forward(request, response);
            }else {
                out.println("fail");
                //request.getRequestDispatcher("profile.jsp?uId=" + userId ).forward(request, response);
            }
        }catch(Exception ex){
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            out.println("error");
        }
        //request.getRequestDispatcher("profile.jsp?uId=" + userId ).forward(request, response);
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
