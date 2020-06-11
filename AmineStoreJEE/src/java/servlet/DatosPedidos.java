
package servlet;

import Bean.Pedido;
import Database.AccesoBD;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DatosPedidos extends HttpServlet {

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
        List<Pedido> pedidos = (List<Pedido>) session.getAttribute(constantes.SESSION_PEDIDOS_USUARIO);
        int idSolicitado = Integer.parseInt(request.getParameter("id"));
        
   
        String partes[] = request.getRequestURI().split("\\/");
        if ( partes[2].equals("datos_pedido.html") )
        {
            for ( Pedido pedido : pedidos )
                if (idSolicitado == pedido.getId() )
                    session.setAttribute(constantes.PEDIDO_INFO, pedido);
            
        }
        else if ( partes[2].equals("cancelar_pedido.html") )
        {
   
            AccesoBD bd = new AccesoBD();
            bd.cancelarPedido(idSolicitado);
           
            Pedido pedido = (Pedido) session.getAttribute(constantes.PEDIDO_INFO);
            pedido.setEstado(4);
            session.setAttribute(constantes.PEDIDO_INFO, pedido);
            
            
            
            
        }
        
        request.getRequestDispatcher("web/user/datos_pedido.jsp").forward(request, response);
        
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
