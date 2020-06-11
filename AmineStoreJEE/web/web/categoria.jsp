<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Bean.Producto"%>
<%@page import="Bean.Categoria"%>

<%
    List<Categoria> categorias = (List<Categoria>)request.getAttribute("LISTA-CATEGORIAS");
    List<Producto> productos = (List<Producto>)request.getAttribute("LISTA-PRODUCTOS");
    int categoria = (Integer)request.getAttribute("CATEGORIA_SOLICITADA");
%>


<div class="panel-full flex">
    <div class="tam-4">
        <ul class="nav-categoria">
<%
            for (Categoria cat : categorias)
            {
                String catNombre = cat.getNombre();
%>
                <li><a href="#" onclick="Cargar('<%=catNombre%>.html','wrap')"><%=catNombre%></a></li>
<%
            }
%> 
        </ul>
    </div>
    <div class="tam-9 panel">
<%
        for (Producto producto : productos ) 
        {

            if ( producto.getIdcategoria() == categoria || categoria == 1)
            {
                int id = producto.getId();
                String nombre = producto.getNombre();
                float precio = producto.getPrecio();
                String url = producto.getUrlimagen();
%>
                <div class="tam-4 descuentos">
                    <a href="#" title="" onclick="Cargar('producto.html?id=<%=id%>', 'wrap')">
                        <img src=<%=url%>  alt=""> <%=nombre%>
                    </a>
                    <label class="descuentos-producto-precio"><%=precio%> €</label>
                </div>
<%
            }
        }
%> 
    </div>
</div>