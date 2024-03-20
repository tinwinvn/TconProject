/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import ModelDAO.GameDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author admin
 */
public class AddNewGameServlet extends HttpServlet {

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
            out.println("<title>Servlet AddNewGameServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewGameServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            // Khởi tạo DiskFileItemFactory
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // Khởi tạo ServletFileUpload với DiskFt.println(");ileItemFactory
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                // Tạo RequestContext từ HttpServletRequest

                // Phân tích yêu cầu và lấy danh sách các mục tải lên
                List<FileItem> items = upload.parseRequest(request);
                System.out.println(items);
                Iterator<FileItem> iter = items.iterator();
                // Lặp qua các mục tải lên
                HashMap<String, String> fields = new HashMap<>();
                String gameName = null;
                String description = null;
                String filename = null;
                String parkID = null;
                while (iter.hasNext()) {
                    FileItem item = iter.next();

                    if (item.isFormField()) {
                        if (item.getFieldName().equals("gameName")) {
                            gameName = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("description")) {
                            description = item.getString("UTF-8");
                        }
                        if (item.getFieldName().equals("parkID")) {
                            parkID = item.getString("UTF-8" );
                        }
                    } else {
                        filename = item.getName();
                        System.out.println("filename: " + filename);

                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            Path path = Paths.get(filename);
                            String storepath = servletContext.getRealPath("/games/");
                            String trimmedRealPath = storepath.replace("\\build\\", "\\");
                            File uploadFile = new File(trimmedRealPath + "/" + path.getFileName());
                            if (!uploadFile.exists()) {
                                item.write(uploadFile);
                            }
                        }
                    }
                }
                if (gameName != null && filename != null && description != null && parkID != null) {
                    GameDAO gameDAO = new GameDAO();
                    gameDAO.addNewGame(parkID, gameName, description, "games/" + filename);
                    response.sendRedirect("admin/game_management.jsp");
                } else {
                    System.out.println("loi");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Upload failed: " + e.getMessage());
            }
        } else {
            response.getWriter().println("No file uploaded");
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
