<%@page import="servlet.constantes"%>
<%@page import="Bean.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Producto pc = (Producto)request.getAttribute("PRODUCTO");
    Boolean cantidad = (Boolean)request.getAttribute("cantidad");
    
%>
<h3 class="panel-title godzilla center">My Items</h3>

<div class="carrito">
    <div class="carrito-table">
        <%
        if ( cantidad != null ) {
%>
            <div id="qual">
                    The quantity requested is more than we have in our store
            </div><br>
<%
        }
        
%>
        <table class="gridtable">
            <tr>
               
                <th id="left" >Item</th>
                <th>Price €</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
<%          ServletContext context = request.getServletContext();
            List<Producto> carrito = (List<Producto>)context.getAttribute("CARRITO");
            float precioTotal = 0f;
            
            for (int i=0;carrito!=null && i<carrito.size();i++)
            {
                Producto p = carrito.get(i);
                float totalProducto = p.getPrecio() * p.getCantidad();
                precioTotal += totalProducto;
                String item = "item" + i;
%>
            <tr>
                
                <td id="left" ><%=p.getNombre()%></td>
                <td><%=p.getPrecio()%></td>
                <!--<td><%//=p.getCantidad()%></td>-->
                
                <td>
                    <div class="carrito-resumen3">
                    <form method="POST" onsubmit="ProcesarForm(this,'formalizar_compra.html?ok=2','wrap'); return false;">
                        <input type="text" name="nombre" value="<%=p.getNombre()%>" hidden>
                        <input type="text" name="id" value="<%=p.getId()%>" hidden>
                        <input type="number" name="nombreCantidad" value="<%=p.getCantidad()%>" >
                       <input type="submit" value="Modify">
                    </form>
                    </div>
                </td>  
                    
                    
                <td><%=totalProducto%> €</td>   
                <td>
                    <div class="carrito-resumen2">
                    <form method="POST" onsubmit="ProcesarForm(this,'formalizar_compra.html?ok=1','wrap'); return false;">
                        <input type="text" name="nombre" value="<%=p.getNombre()%>" hidden>
                       <div><input type="submit" value="Delete"></div>
                    </form>
                    </div>
                </td>    
        
            </tr>
<%
            }
%>
            
        </table>

   
       

 
    </div>

 <%     
        Usuario usr = (Usuario) session.getAttribute(constantes.USR_LOGUED);
        
        if ( usr == null ){
           
           
        }
%>
    <div class="carrito-resumen">
        <form method="POST" onsubmit="ProcesarForm(this,'formalizar_compra.html?ok=0','wrap'); return false;">
            <div><label>Total Price:<span><%=precioTotal%> €</span><label></div>
            <div><input type="submit" value="Make an Order"></div>
        </form>
    </div>
            
    
</div>
