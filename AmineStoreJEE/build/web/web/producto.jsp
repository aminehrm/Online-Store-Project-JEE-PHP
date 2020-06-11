<%@page import="Bean.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Producto producto = (Producto)request.getAttribute("INFO-PRODUCTO");
    
        int id = producto.getId();
        String nombre = producto.getNombre();
        float precio = producto.getPrecio();
        String url = producto.getUrlimagen();
        String marca = producto.getMarca();
        String descripcion = producto.getDescripcion();

%>

<div class="panel-full">
    <div class="flex">
        <div class="producto-img"><img src="<%=url%>" alt=""></div>
        <div class="producto-info">
            
            <div class="form-group">
                 <label id="prodNombre"><%=nombre%></label>
            </div>
            <div class="form-group">
                <label id="prodPrecio"><%=precio%> €</label>
            </div>
            <div class="form-group">
                <label id="prodMarca"><%=marca%></label>
            </div>
            <form method="POST" onsubmit="ProcesarForm(this,'cesta.html','wrap'); return false;">
                <div class="form-group">
                    <input type="text" name="prodCant" id="prodCant" class="form-control" 
                           placeholder="Quantity" pattern="[1-9][0-9]*" required>
                </div>
                <div>
                    <input type="text" name="prodID" id="prodID" value="<%=id%>" hidden>
                </div>
                <div class="form-group">
                    
                    <input type="submit" class="btn btn-maxi" value="Add to cart">
                </div>
            </form>
        </div>
    </div>
    <div class="producto-caracteristicas">
        <%=descripcion%>
    </div>
</div>
