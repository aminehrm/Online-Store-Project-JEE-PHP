
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String name = "";
    String direccion = "";
    String telefono  = "";
    String tarjeta = "";
    String user = "";
    String email = "";
    
    if ( (String)request.getAttribute("uName") != null )
    {
        name = (String) request.getAttribute("uName");
        direccion = (String) request.getAttribute("uDireccion");
        telefono = (String) request.getAttribute("uTelf");
        tarjeta = (String) request.getAttribute("uTarjeta");
        user = (String) request.getAttribute("uUser");
        email = (String) request.getAttribute("uEmail");
    }


    Boolean existo = (Boolean)request.getAttribute("existo");
    

%>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title>Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/SMain.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="panel-full">

            <div class="tam-1 panel">
                <form action="registrar_usuario.html" method="POST" >
                <h3 class="panel-title godzilla">Create New Account</h3>
                <%
                        if ( existo != null ) {
                %>
                            <center>
                                <p style="color:red;font-size:18px;">
                                    The information entered is already existed ! 
                                </p>
                            </center>
                <%
                        }

                %>

                <div class="panel-body">
                    <div class="form-group">
                        <label for="login_name">Full Name</label>
                        <input id="login_name"  class="form-control" type="text" name="name"  value="<%=name%>" maxlength="100"  required>
                    </div>

                    <div class="form-group">
                        <label for="login_direccion">Adress</label>
                        <input id="login_direccion"  class="form-control" type="text" name="direccion"  value="<%=direccion%>" maxlength="100"  required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input id="email"  class="form-control" type="email" name="email"  value="<%=email%>" maxlength="100"  required>
                    </div>

                    <div class="form-group">
                        <label for="login_telefono">Phone Number</label>
                        <input id="login_telefono"  class="form-control" type="number" name="telefono"   value="<%=telefono%>" pattern="[1-9][0-9]{8}"  required>
                    </div>

                    <div class="form-group">
                        <label for="tarjeta-credito">Credit card</label>
                        <input id="tarjeta-credito"  class="form-control" type="number" name="tarjeta"  value="<%=tarjeta%>" pattern="[0-9]{16}"  >
                    </div>

                  
                    <div class="form-group">
                        <label for="login_username">Nickname</label>
                        <input id="login_username"  class="form-control" type="text" name="username"   value="<%=user%>" maxlength="20" prequired>
                    </div>

                    <div class="form-group">
                        <label for="login_password">Password</label>
                        <input id="login_password" type="password" name="password" class="form-control"  maxlength="10" required>
                    </div>

              
                    <input type="submit" class="btn btn-maxi" value="Register">
                </div>
                 </form>
            </div>
           
        </div>
    </body>
</html>
