
<%@page import="Bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    HttpSession sessionsa = request.getSession();
    Usuario usr = (Usuario) sessionsa.getAttribute("USR_LOGUED");
    
    String direccion = usr.getDireccion();
    String telefono = String.valueOf(usr.getTelefono());
    String tarjeta = usr.getTarjeta();
%>

<div class="tam-1 panel">
    <h3 class="panel-title godzilla">Order data</h3>
    
    <div class=" panel-body">
        <form method="POST"  onsubmit="ProcesarForm(this,'formalizar_compra.html?ok=26','wrap'); return false;">
            
            <div class="form-group">
                <label for="direccion">Shipping address</label>
                <input type="text" id="direccion" class="form-control" name="direccion"  value="<%=direccion%>" maxlength="100" required >
            </div>
            <div class="form-group">
                <label for="telefono">Phone Number</label>
                <input id="telefono"  class="form-control" type="text" name="telefono"   value="<%=telefono%>" pattern="[1-9][0-9]{8}" placeholder="XXX XXX XXX " required>
            </div>

          
            <div class="form-group">
                <label for="tarjeta-credito">Credit card</label>
                <input id="tarjeta-credito"  class="form-control" type="text" name="tarjeta"  value="<%=tarjeta%>" pattern="[0-9]{16}" placeholder="XXX XXX XXX" required>
            </div>
            <input type="submit" class="btn btn-maxi" value="Submit">
        </form>
        
    </div>
</div>