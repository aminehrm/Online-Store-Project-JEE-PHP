<%@page import="Bean.Pedido"%>
<%@page import="servlet.constantes"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    session = request.getSession();
    List<Pedido> pedidos = (List<Pedido>) session.getAttribute(constantes.SESSION_PEDIDOS_USUARIO);
%>

<div class="tam-1 panel">

    <h2 class="panel-title godzilla">Order List</h2>

    <div class=" panel-body">
        <table class="gridtable">
            <tr>
               
                <th>ID</th>
                
                <th>Orders</th>
                <th>Price</th>
                <th>SHIPPING ADDRESS</th>
                <th>Option</th>
            </tr>
<%          int i=0;
           for (Pedido pedido : pedidos)
           {i++;
%>
            <tr>
         
                <td><%=pedido.getId()%></td>
          
                <td>Order <%=i%></td>
                <td><%=pedido.getCantidad()%> €</td>
                <td><%=pedido.getDireccion_envio()%></td>
                <td>
                    <input type="image" src="img/details.png" alt="Editar" title="Details"  width="32" height="32" onclick="Cargar('datos_pedido.html?id=<%=pedido.getId()%>','wrap')">
                    
                </td>
            </tr>
<% 
           }
%>
            
        </table> 
    </div>   
</div>
