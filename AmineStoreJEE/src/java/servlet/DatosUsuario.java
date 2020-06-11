
package servlet;

import com.sun.org.apache.bcel.internal.generic.AALOAD;
import Bean.Usuario;
import Database.AccesoBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DatosUsuario extends HttpServlet {

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
        HttpSession session = request.getSession();
        Usuario usr = null;
        
        // 1
        if ( (usr = (Usuario) session.getAttribute(constantes.USR_LOGUED)) == null )
            response.sendRedirect("login_usuario.html");
        else
        {
           
            int action = Integer.parseInt(request.getParameter("action"));
            
            switch(action)
            {
                case 0:
                    request.getRequestDispatcher("web/user/user.jsp").forward(request, response);
                case 1:
                 
                    String txt_error = "";
                    Boolean error = false;
                    
                    Usuario usrUpdate = new Usuario();
                    usrUpdate.setId(usr.getId());
                    usrUpdate.setNombre(request.getParameter("name"));
                    usrUpdate.setDireccion(request.getParameter("direccion"));
                    usrUpdate.setEmail(request.getParameter("email"));
                    usrUpdate.setTarjeta(request.getParameter("tarjeta"));
                    usrUpdate.setTelefono(Integer.parseInt(request.getParameter("telefono")));
                    usrUpdate.setLogin(usr.getLogin());
                    usrUpdate.setActivo(1);
                    
                    String uPasswd = request.getParameter("password");
                    String uPasswdRep = request.getParameter("password_repeat");
                    
                    if ( uPasswd == null || uPasswd.equals(""))
                        usrUpdate.setPassword(usr.getPassword());
                    else
                        
                        if ( uPasswd.equals(uPasswdRep) )
                            usrUpdate.setPassword(uPasswd);
                        else
                        {
                          
                            txt_error = "Error";
                            usrUpdate = null;
                            error = true;
                        }
                    
                  
                    if ( !usr.equals(usrUpdate) && !error )
                    {

                        session.setAttribute(constantes.USR_LOGUED, usrUpdate);
                        
                        AccesoBD bd = new AccesoBD();
                        bd.actualizarUsuario(usrUpdate);
                       
                        txt_error = "Your data has been updated.";
                    }
                    
                    
                    request.setAttribute("ERROR", txt_error);
                    request.getRequestDispatcher("web/user/datos_done.jsp").forward(request, response);
                    

                    break;
                case 2:
                   
                    request.getRequestDispatcher("web/user/datos_personales.jsp").forward(request, response);
                    break;
                case 3:
                  
                    
                    break;
                default:
                    response.sendRedirect("index.html");
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
