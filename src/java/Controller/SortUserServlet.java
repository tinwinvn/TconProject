/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.User;
import ModelDAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tbinh
 */
public class SortUserServlet extends HttpServlet {

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
            out.println("<title>Servlet SortUserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SortUserServlet at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String sortBy = request.getParameter("sortBy");
            List<User> sortedUsers = new ArrayList<>();
            UserDAO uDAO = new UserDAO();
            boolean sortPerformed = false; // Mặc định không có sắp xếp được thực hiện

            if (sortBy != null) {
                switch (sortBy) {
                    case "1":
                        sortPerformed = false;
                        break;
                    case "2":
                        sortedUsers = uDAO.sortByName();
                        sortPerformed = true; // Sắp xếp theo tên (A-Z) được thực hiện
                        break;
                    case "3":
                        sortedUsers = uDAO.sortByNameDecs();
                        sortPerformed = true; // Sắp xếp theo tên (Z-A) được thực hiện
                        break;
                    default:
                        break;
                }
            }

            // Đặt thuộc tính sortPerformed cho request
            request.getSession().setAttribute("sortPerformed", sortPerformed);

            // Đặt thuộc tính listafterSort nếu có kết quả sắp xếp
            if (sortPerformed) {
                request.getSession().setAttribute("listafterSort", sortedUsers);
            }

            response.sendRedirect(request.getContextPath() + "/admin/listuser.jsp");
        } catch (Exception e) {
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
