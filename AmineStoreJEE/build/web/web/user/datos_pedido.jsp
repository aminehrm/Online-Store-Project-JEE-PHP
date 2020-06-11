<%@page import="java.util.ArrayList"%>
<%@page import="Bean.Producto"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Usuario"%>
<%@page import="servlet.constantes"%>
<%@page import="Bean.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
    Usuario usr = (Usuario) session.getAttribute(constantes.USR_LOGUED);
    Pedido pedido = (Pedido) session.getAttribute(constantes.PEDIDO_INFO);
    
    String nombre = (pedido.getUid() == usr.getId()) ? usr.getNombre() : "ERROR" ;
 %> 
 
   <% String state="";

    if(pedido.getEstado()==1) {state="Pending"; }
    if(pedido.getEstado()==2){state="Delivered";}
    if(pedido.getEstado()==3){ state="Sent";}
    if(pedido.getEstado()==4){ state="Cancelled";}
    %>
     

<div class="tam-1 panel">
    
    <h2 class="panel-title godzilla">Order Informations</h2>
    
    <div class=" panel-body">
        <form action="#" method="POST">
            
            <div class="form-group">
                <label for="pedID">Product ID</label>
                <input type="text" id="pedID" class="form-control" value="<%=pedido.getId()%>" disabled />
            </div>
            
            <div class="form-group">
                <label for="pedNombreCliente">Name</label>
                <input type="text" id="pedNombreCliente" value="<%=nombre%>" class="form-control" disabled />
            </div>

            <div class="form-group">
                <label for="pedDirecionEnvio">Shipping Adress</label>
                <input type="text" id="pedDirecionEnvio" class="form-control" value="<%=pedido.getDireccion_envio()%>" disabled/>
            </div> 

        
            
            <div class="form-group">
                <label>Products</label>
                <table class="gridtable">
                    <tr>
                 
                        <th>ID</th>
                        <th id="left" >Article</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        
                    </tr>
<%
                    for (Producto producto : (ArrayList<Producto>) pedido.getProductos())
                    {
%>
                        <tr>
                            
                            <td><%=producto.getId()%></td>
                            <td id="left" ><%=producto.getNombre()%></td>
                            <td><%=producto.getCantidad()%></td>
                            <td><%=producto.getPrecio()%> €</td>
                            
                        </tr>
<%
                    } 
%>
                </table>
            </div>
            
            <div class="form-group">
                <label for="pedPrecio">Total Price(€)</label>
                <input type="text" id="pedPrecio" class="form-control"  value="<%=pedido.getCantidad()%>" disabled>
            </div>
            
            <div class="form-group">
                <label for="pedPrecio">State of order</label>
                <input type="text" id="pedPrecio" class="form-control"  value="<%=state%>" disabled>
            </div>
            
           
        </form>
            
        <%

        if (pedido.getEstado() == 3 || pedido.getEstado() == 1 )
        {
%>
            <form onsubmit="ProcesarForm(this,'cancelar_pedido.html','wrap'); return false;" method="POST">
                <div>
                    <input type="hidden" id="id" name="id" class="form-control" value="<%=pedido.getId()%>" disabled />
                    <input type="submit" class="btn btn-maxi" value="Cancel order">
                </div>
            </form>
<%
        }
%>

    </div>
</div>    
