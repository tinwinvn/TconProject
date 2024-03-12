/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import ModelDAO.UserDAO;
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
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;





/**
 *
 * @author tbinh
 */
public class UploadServlet extends HttpServlet {

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
            out.println("<title>Servlet UploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        // Kiểm tra xem request có chứa multipart/form-data không
        boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
        
        if (isMultipart) {
            // Khởi tạo DiskFileItemFactory
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // Khởi tạo ServletFileUpload với DiskFt.println(");ileItemFactory
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);
            System.out.println(upload);
            try {
                // Tạo RequestContext từ HttpServletRequest

                // Phân tích yêu cầu và lấy danh sách các mục tải lên
                List<FileItem> items = upload.parseRequest(request);
                System.out.println(items);
                Iterator<FileItem> iter = items.iterator();
                // Lặp qua các mục tải lên
                HashMap<String,String> fields = new HashMap<>();
                String userId = null;
                String filename = null;
                while (iter.hasNext()){
                    FileItem item = iter.next();
                    
                    
                    if (item.isFormField()) {
                        // Xử lý trường dữ liệu dạng form
                        if (item.getFieldName().equals("userId")) {
                            userId = item.getString(); // Gán giá trị cho userId nếu tên trường là "userId"
                            System.out.println("userId: " + userId);
                        }
                    }
                    else{
                        filename = item.getName();
                        System.out.println("filename: " + filename);
                        
                        if (filename == null || filename.equals("")){
                            break;
                        } else {
                            Path path = Paths.get(filename);
                            String storepath = servletContext.getRealPath("/uploads/");
                            String trimmedRealPath = storepath.replace("\\build\\", "\\");
                            System.out.println(trimmedRealPath);    
                            File uploadFile = new File(trimmedRealPath + "/" + path.getFileName());
                            item.write(uploadFile);
                            System.out.println(trimmedRealPath + "/" + path.getFileName());
                            
                        }
                    }
                }
                if (userId != null && filename != null) {
                    UserDAO uDAO = new UserDAO();
                    System.out.println(userId + filename);
                    uDAO.uploadAvatar(userId, filename);
                    response.sendRedirect("profile.jsp?userId=" + userId);
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
