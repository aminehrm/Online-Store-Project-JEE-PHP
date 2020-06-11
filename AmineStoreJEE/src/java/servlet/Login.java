
package servlet;

import Bean.Usuario;
import Database.AccesoBD;
import static servlet.constantes.USR_LOGUED;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

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
        
        HttpSession sessionsa = request.getSession(false);
        Usuario usr = (Usuario) sessionsa.getAttribute("USR_LOGUED");
     
        
        if (usr != null)
            request.getRequestDispatcher("web/user/datos_personales.jsp").forward(request, response);
        else
        {
            String uUser = request.getParameter("username");
            String uPass = request.getParameter("password");
           

            if ( uUser == null && uPass == null ){
                
              
                 request.getRequestDispatcher("web/login.jsp").forward(request, response);
            }
               
            
            else
            {  
                 
                AccesoBD bd = new AccesoBD();
                Usuario user = bd.obtenerUsuarioBD(uUser);
                  

                if ( user != null && user.getPassword().equals(uPass) )
                {
                   if(user.getActivo()==1){
                    
                        HttpSession session =  request.getSession(true);
                        session.setAttribute(USR_LOGUED, user);


                        String partes[] = request.getRequestURI().split("\\/");
                        if ( partes[2].equals("login_usuario.html") )
                            request.getRequestDispatcher("web/user/datos_personales.jsp").forward(request, response);
                        else{
                           
                           request.getRequestDispatcher("web/user/formalizar_compra.jsp").forward(request, response);    
                        }
                            
                   
                   } else{               
                        request.setAttribute("FALLIDOACTIVO", true);
                        request.getRequestDispatcher("web/login.jsp").forward(request, response);
                    }
                    
                }
                else
                {
                 
                    request.setAttribute("FALLIDO", true);
                    request.getRequestDispatcher("web/login.jsp").forward(request, response);
                }
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
