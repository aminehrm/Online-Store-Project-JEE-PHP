
<%@page import="servlet.constantes"%>
<%@page import="Bean.Pedido"%>
<%@page import="Bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    //Boolean validacion = (Boolean) request.getAttribute("VALIDACION");
    String statut = "Your Profil has been successfully updated";
   /* if (!validacion){
        statut = "Error -404 Failed to update your profil";
    }else{
        ServletContext context = request.getServletContext();
        context.setAttribute("CARRITO", null);
    }*/
%>

    <div class="tam-1 panel2">
        <h2 class="panel-title godzilla center"><%=statut%></h2>
        <p class="center"><a href="index.html" title="index page">Back to the main page</a></p>
    </div>
    
    
    
    