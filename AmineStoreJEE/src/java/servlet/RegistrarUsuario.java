
package servlet;

import Bean.Usuario;
import Database.AccesoBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarUsuario extends HttpServlet {

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
            throws ServletException, IOException 
    {
        
        String uName = request.getParameter("name");

        if ( uName == null && request.getParameter("direccion")==null && request.getParameter("telefono")==null && request.getParameter("tarjeta")==null && request.getParameter("email")==null
                && request.getParameter("username")==null && request.getParameter("password")==null)
            request.getRequestDispatcher("web/user/registro.jsp").forward(request, response);
        else
        {
            
            String uDireccion = request.getParameter("direccion");
            int uTelf = Integer.parseInt(request.getParameter("telefono"));
            String uTarjeta = request.getParameter("tarjeta");
            String uEmail = request.getParameter("email");
            String uUser = request.getParameter("username");
            String uPasswd = request.getParameter("password");
            AccesoBD bd = new AccesoBD();
          
           if(bd.obtenerUsuarioExistoBD(uName,uEmail,uTarjeta)==null){
              Usuario usr = bd.addUsuarioBD(uName, uEmail, uDireccion, uTelf, uTarjeta, uUser, uPasswd);

            String pathAuth = "/login_usuario.html?";
                    pathAuth += "username=" + usr.getLogin();
                    pathAuth += "&password=" + usr.getPassword();
                request.getRequestDispatcher(pathAuth).forward(request, response); 
           }else{
               request.setAttribute("existo", true);
               request.getRequestDispatcher("web/user/registro.jsp").forward(request, response); 
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
