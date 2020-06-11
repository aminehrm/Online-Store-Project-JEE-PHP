<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Boolean fallo = (Boolean)request.getAttribute("FALLIDO");
    Boolean falloactivo = (Boolean)request.getAttribute("FALLIDOACTIVO");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="grid">
            <form accion="login_usuario.html" method="POST" class="form">
                <div class="form_row">
                    
                    <input id="login_username" class="form_input" type="text" name="username"  placeholder="Username" required>
                </div>
                <div class="form_row">
                    
                    <input id="login_password" type="password" name="password" class="form_input" placeholder="Password" required>
                </div>
                <div class="form_row">
                    <input type="submit" value="Login">
                </div>
                <div id="sub-registro">
                    <a href="registrar_usuario.html" style="font-size:17px;">Creat new account</a>
                </div>
            </form>
        </div>
<%
        if ( fallo != null ) {
%>
            <div id="inco">
                    Password or Username incorrect
            </div>
<%
        }
        
%>

<%
        if ( falloactivo != null ) {
%>
            <div id="inco">
                    This account is disabled from the administration
            </div>
<%
        }
        
%>
       
    </body>
</html>