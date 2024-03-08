/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class DetailsSupplierServlet extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DetailsSupplierServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailsSupplierServlet at " + request.getContextPath() + "</h1>");
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
        String businessOwner = request.getParameter("business-owner");
        String businessName = request.getParameter("business-name");
        String contactNumber = request.getParameter("contact-number");
        String address = request.getParameter("address");

        // Chuyển hướng đến trang detailsupplier.jsp và truyền các thông tin đã lấy
        request.setAttribute("businessOwner", businessOwner);
        request.setAttribute("businessName", businessName);
        request.setAttribute("contactNumber", contactNumber);
        request.setAttribute("address", address);
        request.getRequestDispatcher("supplier/detailsupplier.jsp").forward(request, response);
        response.sendRedirect("SupplierNotificationServlet");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
