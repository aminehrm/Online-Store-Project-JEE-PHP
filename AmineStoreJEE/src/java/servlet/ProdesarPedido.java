
package servlet;

import Bean.Estado_Pedido;
import Bean.Pedido;
import Bean.Producto;
import Bean.Usuario;
import Database.AccesoBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ProdesarPedido extends HttpServlet {

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
        Boolean validacion = ( Integer.parseInt(request.getParameter("ok")) == 26 );
        Boolean validacion2 = ( Integer.parseInt(request.getParameter("ok")) == 1 );
        Boolean validacion3 = ( Integer.parseInt(request.getParameter("ok")) == 2 );
        
       
        HttpSession session = request.getSession();
    
        Usuario usr = (Usuario) session.getAttribute(constantes.USR_LOGUED);
        
        if (validacion2) 
        {
                ServletContext context = request.getServletContext();
                ArrayList<Producto> productos = (ArrayList<Producto>) context.getAttribute("CARRITO");
                String nombre=request.getParameter("nombre");

               for (Iterator<Producto> iterator = productos.iterator(); iterator.hasNext(); ) {
                Producto value = iterator.next();
                if (value.getNombre().equals(nombre)) {
                    iterator.remove();
                }
                }

                context.setAttribute("CARRITO", productos);
                request.getRequestDispatcher("web/cesta.jsp").forward(request, response);
                
              
        }
        
        if (validacion3) 
        {
                Producto p = new Producto();
                AccesoBD bd = new AccesoBD();
                ServletContext context = request.getServletContext();
                ArrayList<Producto> productos = (ArrayList<Producto>) context.getAttribute("CARRITO");
                String nombre=request.getParameter("nombre");
                String nombrecan=request.getParameter("nombreCantidad");
                 
                 String pIDe=request.getParameter("id");
                 int pID=Integer.parseInt(pIDe);
                 String nombrecane=request.getParameter("nombreCantidad");
                 int te=Integer.parseInt(nombrecane);
                 p = bd.obtenerProductoBD(pID);
                 if(te>p.getCantidad()){
                    for (Iterator<Producto> iterator = productos.iterator(); iterator.hasNext(); ) {
                        Producto value = iterator.next();
                        if (value.getNombre().equals(nombre)) {
                            value.setCantidad(p.getCantidad());
                        }
                     }
                    request.setAttribute("cantidad", true);
                 }else{
                      for (Iterator<Producto> iterator = productos.iterator(); iterator.hasNext(); ) {
                        Producto value = iterator.next();
                        if (value.getNombre().equals(nombre)) {
                            value.setCantidad(te);
                        }
                     }
                     
                 }
                context.setAttribute("CARRITO", productos);
                request.getRequestDispatcher("web/cesta.jsp").forward(request, response);
            
        }
                    
        
        if ( usr == null ){
          response.sendRedirect("/AmineStore/web/necesitologin.jsp");

                     
        }
           
           
           

        else
        {

            
            

            if (!validacion) 
            {
                validacion = true;
                
                request.getRequestDispatcher("/web/order/formalizar_pedido.jsp").forward(request, response);
            }
            else 
            {
                ServletContext context = request.getServletContext();
                Pedido delivery = new Pedido();
                ArrayList<Producto> productos = (ArrayList<Producto>) context.getAttribute("CARRITO");
               
                Float total = 0f;
                for (Producto prod : productos)
                    total += (prod.getPrecio() * prod.getCantidad());
                
                delivery.setDireccion_envio(request.getParameter("direccion"));
                delivery.setTarjeta(request.getParameter("tarjeta"));
                delivery.setTelefono(Integer.parseInt(request.getParameter("telefono")));
                delivery.setUid(usr.getId());
                delivery.setProductos(productos);
                delivery.setEstado(0);
                delivery.setCantidad(total);
                
                
                AccesoBD bd = new AccesoBD();
                List<Estado_Pedido> estado_pedido = bd.obtenerEstadosPedidosBD();
             
                session.setAttribute(constantes.SESSION_PEDIDO, delivery);
                request.setAttribute("LISTA-ESTADOS-PEDIDOS",estado_pedido);
                request.getRequestDispatcher("/web/order/resguardo.jsp").forward(request, response);
                
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
