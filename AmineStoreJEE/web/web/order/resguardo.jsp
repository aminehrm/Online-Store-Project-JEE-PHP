
<%@page import="servlet.constantes"%>
<%@page import="Bean.Estado_Pedido"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Producto"%>
<%@page import="Bean.Usuario"%>
<%@page import="Bean.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    session = request.getSession();
    Usuario u = (Usuario) session.getAttribute(constantes.USR_LOGUED);
    Pedido p = (Pedido) session.getAttribute(constantes.SESSION_PEDIDO);
    List<Producto> productos = (List<Producto>) p.getProductos();
    List<Estado_Pedido> estados = (List<Estado_Pedido>) request.getAttribute("LISTA-ESTADOS-PEDIDOS");
%>

<div class="tam-1 panel">
    
    <h2 class="panel-title godzilla">Order Edition</h2>
    <div class=" panel-body">
        <!--<form method="POST" onsubmit="ProcesarForm(this,'tramitar_pedido.html','wrap'); return false;">-->
        <form>    
            <div class="form-group">
                <label for="pedNombreCliente">Name</label>
                <input type="text" id="pedNombreCliente" value="<%=u.getNombre()%>" class="form-control" disabled />
            </div>

            <div class="form-group">
                <label for="pedDirecionEnvio">shipping address</label>
                <input type="text" id="pedDirecionEnvio" class="form-control" value="<%=p.getDireccion_envio()%>" disabled />
            </div> 
            
            <div class="form-group">
                <label for="pedTarjeta">Credit card</label>
                <input type="text" id="pedTarjeta" class="form-control" value="<%=p.getTarjeta()%>" disabled />
            </div> 

            <div class="form-group">
                <label for="pedTelefono">Phone Number</label>
                <input type="text" id="pedTelefono" class="form-control" value="<%=p.getTelefono()%>" disabled />
            </div> 
            
            <div class="form-group">
                <label for="pedEstado">Order status</label>
                <input type="text" id="pedEstado" class="form-control" value="<%=estados.get(p.getEstado()).getNombre()%>" disabled />
            </div> 
            
            
            <div class="form-group">
                <label>Order Products</label>
                <table class="gridtable">
                    <tr>
                        
                        <th>ID</th>
                        <th id="left" >Item</th>
                        <th>Quantity</th>
                        <th>Price</th>
                    </tr>
<%
                    for (Producto product : productos)
                    {
%>
                    <tr>
                       
                        <td><%=product.getId()%></td>
                        <td id="left" ><%=product.getNombre()%></td>
                        <td><%=product.getCantidad()%></td>
                        <td><%=product.getPrecio()*product.getCantidad()%> €</td>
                    </tr>
<%
                    }
%>
                </table>
            </div>
                
            <div class="form-group">
                <label for="pedPrecio">Total Price (€)</label>
                <input type="text" id="pedPrecio" class="form-control"  value="<%=p.getCantidad()%>" disabled>
            </div>
        </form>
            
        <div >
            <form method="POST" onsubmit="ProcesarForm(this,'tramitar_pedido.html?ok=26','wrap'); return false;">
                <input type="submit" class="btn btn-maxi" name="confirmar" value="Confirm Order">
            </form>
            <form method="POST" onsubmit="ProcesarForm(this,'tramitar_pedido.html?ok=0','wrap'); return false;">
                <input type="submit" class="btn btn-maxi" name="cancelar" value="Cancel Order">  
            </form>
        </div>
            
    </div>
</div>    