/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelDAO.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class UpdateTicketServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateTicketServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateTicketServlet at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String qrContent = request.getParameter("content");
        String message;
        try {
            TicketDAO ticketDAO = new TicketDAO();
            if (ticketDAO.getTicketStatusByTicketCode(qrContent) == 0){  
                ticketDAO.updateTicketStatusBYTicketCode( 1,qrContent);
                out.print("sus");
            }
            else {
                out.print("used");
            }
        } catch (Exception ex) {
            Logger.getLogger(UpdateTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
