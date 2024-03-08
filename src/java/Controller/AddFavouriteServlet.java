/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.AddFavourite;
import ModelDAO.AddFavouriteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddFavouriteServlet extends HttpServlet {

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
            out.println("<title>Servlet AddFavouriteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddFavouriteServlet at " + request.getContextPath() + "</h1>");
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

        String userID = request.getParameter("userID");
        String favouriteItems = request.getParameter("favouriteItems");

        // Tạo một đối tượng AddFavouriteDAO
        try {
            AddFavouriteDAO addFavouriteDAO = new AddFavouriteDAO();

            // Lấy danh sách các mục yêu thích từ cơ sở dữ liệu
            List<AddFavourite> af = addFavouriteDAO.getAllAddFavourite();
            boolean isExist = false;
            // Kiểm tra xem mục yêu thích đã tồn tại trong danh sách hay chưa
            for (AddFavourite item : af) {
                if (item.getUserID().equals(userID) && item.getFavouriteItems().equals(favouriteItems)) {
                    isExist = true;
                    break;
                }
            }
            if (isExist) {
                out.println("fail");
            } else {
                // Nếu mục yêu thích chưa tồn tại, thêm vào cơ sở dữ liệu và gửi "sus" về cho client
                addFavouriteDAO.addNewFavourite(userID, favouriteItems);
                out.println("sus");
            }
            response.setStatus(200);
        } catch (Exception ex) {
            // Xử lý lỗi
            response.setStatus(500);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
