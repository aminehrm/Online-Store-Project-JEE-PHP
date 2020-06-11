<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Producto"%>

<%
    List<Producto> productos = (List<Producto>)request.getAttribute("LISTA-PRODUCTOS");
%>
<div class="panel-full">
<%
    for (Producto producto : productos ) 
    {
            int id = producto.getId();
            String nombre = producto.getNombre();
            float precio = producto.getPrecio();
            String url = producto.getUrlimagen();
%>
            <div class="tam-4 descuentos">
                <a href="#" title="" onclick="Cargar('producto.html?id=<%=id%>', 'wrap')">
                    <img src=<%=url%> alt=""><%=nombre%>
                </a>
                <label class="descuentos-producto-precio"><%=precio%> €</label>
            </div>
<%
     
    }
%> 
</div>