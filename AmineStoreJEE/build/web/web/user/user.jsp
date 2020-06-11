
<%@page import="servlet.constantes"%>
<%@page import="Bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    session = request.getSession();
    Usuario u = (Usuario) session.getAttribute(constantes.USR_LOGUED);
    String error = (String) request.getAttribute("ERROR");
    String txt_error = (error != null) ? "" : error;
    
    String name = u.getNombre();
    String direccion = u.getDireccion();
    String telefono  = String.valueOf(u.getTelefono());
    String tarjeta = u.getTarjeta();
    String user = u.getLogin();
    String email = u.getEmail();
%>

<div class="panel-full">
    <div class="tam-1 panel">
        
        <h3 class="panel-title godzilla">Update account details</h3>
        
        <div class="panel-body">
            
            <form method="POST" onsubmit="ProcesarForm(this,'datos_personales.html?action=1','wrap'); return false;">
                <div class="form-group">
                    <label for="login_name">Full name</label>
                    <input id="login_name"  class="form-control" type="text" name="name"  value="<%=name%>" maxlength="100" placeholder="Nombre Completo" disabled>
                </div>

                <div class="form-group">
                    <label for="login_direccion">Shipping adress</label>
                    <input id="login_direccion"  class="form-control" type="text" name="direccion"  value="<%=direccion%>" maxlength="100" placeholder="Direccion de envio" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email"  class="form-control" type="email" name="email"  value="<%=email%>" maxlength="100" placeholder="Correo electronico" disabled>
                </div>

                <div class="form-group">
                    <label for="login_telefono">Phone number</label>
                    <input id="login_telefono"  class="form-control" type="number" name="telefono"   value="<%=telefono%>" pattern="[1-9][0-9]{8}" placeholder="XXX XXX XXX o XXXXXXXXX" required>
                </div>

                <div class="form-group">
                    <label for="tarjeta-credito">Credit card</label>
                    <input id="tarjeta-credito"  class="form-control" type="number" name="tarjeta"  value="<%=tarjeta%>" pattern="[0-9]{16}" placeholder="XXX XXX XXX o XXXXXXXXX" >
                </div>

            
                <div class="form-group">
                    <label for="login_username">Nickname</label>
                    <input id="login_username"  class="form-control" type="text" name="username" value="<%=user%>" maxlength="20" placeholder="Usuario de acceso" disabled>
                </div>
                <br><br> <p>Change Password</p> <br>
                <div class="form-group">
                    <label for="login_password">New Password</label>
                    <input id="login_password" type="password" name="password" class="form-control" placeholder="Password" maxlength="10">
                </div>

                <div class="form-group">
                    <label for="login_password_repeat">Repeat password</label>
                    <input id="login_password_repeat" type="password" name="password_repeat"  class="form-control" placeholder="Repeat Password" maxlength="10">
                </div>

                <input type="submit" class="btn btn-maxi" value="Modify">
            </form>
            
            
            
       
                
        </div>
                
    </div> 
</div>
