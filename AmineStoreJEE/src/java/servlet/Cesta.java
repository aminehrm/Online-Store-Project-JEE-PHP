package servlet;

import Bean.Producto;
import Database.AccesoBD;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Cesta extends HttpServlet {

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
        
        Producto p = new Producto();
      
        AccesoBD bd = new AccesoBD();
        
        

          
        
        String pID = request.getParameter("prodID");

        
        if ( pID != null )
        {
            
            HttpSession sesion = request.getSession(true); 
            ServletContext context = request.getServletContext();
            p = bd.obtenerProductoBD(Integer.parseInt(pID));
            int prodCant = Integer.parseInt(request.getParameter("prodCant"));


             
    
             List<Producto> carrito = (List<Producto>) context.getAttribute("CARRITO"); 

           
             if (carrito == null)
             {
                 carrito = new ArrayList();
                 sesion.setAttribute("CARRITO", carrito);
                 context.setAttribute("CARRITO", carrito);
             }

    
             int i=0;
             while (i<carrito.size() && carrito.get(i).getId()!=p.getId())
             {
                 i++; 
             }

             if (i<carrito.size())
             {
                 AccesoBD modelo = new AccesoBD();

                 Producto pBD = modelo.obtenerProductoBD(p.getId());

                 int existencias  = pBD.getCantidad(); 

                 int actual = carrito.get(i).getCantidad();

                 if (actual<existencias)
                 {
                     carrito.get(i).setCantidad(actual+prodCant);
                 }
                 p.setCantidad(carrito.get(i).getCantidad()); 
             } 
             else 
             {
                 if(prodCant>p.getCantidad()){
                 p.setCantidad(p.getCantidad());
                 carrito.add(p); 
                 request.setAttribute("cantidad", true);
                 }else{
                 p.setCantidad(prodCant);
                 carrito.add(p);   
                 }
                 
             }

           
             request.setAttribute("PRODUCTO",p);
             
        }

        request.getRequestDispatcher("web/cesta.jsp").forward(request, response);
        

        
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
