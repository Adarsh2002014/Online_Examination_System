import java.sql.*;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import helpers.examindb;
import javax.servlet.http.HttpSession;
public class user_login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String sql = "Select * from user where uname='"+username+"'";
            examindb db = new examindb();
            int loginStatus = db.login(sql,password);
            db.ReleaseConnection();
            out.println(loginStatus);
            if(loginStatus == 1){
                out.println("login success");
                if(db.usertype == 1){
                    response.sendRedirect("faculty/createGroup.jsp");
                }else if(db.usertype == 2){
                    response.sendRedirect("student/home.jsp");
                }   
                HttpSession session = request.getSession();
                session.setAttribute("uid",db.userid);
                session.setAttribute("username",db.username);
                session.setAttribute("usertype",db.usertype);
                session.setAttribute("gid",db.gid);
            }else{
                out.println("login unsuccess");
                response.sendRedirect("invalidCredentials.jsp");
            }
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
        processRequest(request, response);
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
