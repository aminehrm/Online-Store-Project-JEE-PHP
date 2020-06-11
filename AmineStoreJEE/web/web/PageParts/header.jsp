<%@page import="Bean.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>

<%
    HttpSession sessionsa = request.getSession();
    Usuario usr = (Usuario) sessionsa.getAttribute("USR_LOGUED");
    String usr_name;
    if(usr != null)
        usr_name=usr.getNombre();
    else
        usr_name="Login";
        
   
%>

<div class="top-nav">
    <div class="box-logo"><a href="index.html"><img src="img/Logo.png" alt="Logo"></a></div>
    <nav>
        <ul class="nav">
            <li id="navelm"><a href="index.html">Home</a></li>
            <li id="navelm"><a href="#" onclick="Cargar('general.html','wrap')">Categories</a></li>
            <li id="navelm"><a href="#" onclick="Cargar('cesta.html','wrap')">Cart</a></li>
            <li id="navelm"><a href="#" onclick="Cargar('web/contacto.jsp','wrap')">Contact us</a></li>
            <li id="navelm"><a href="#" onclick="Cargar('web/empresa.html','wrap')">About us</a></li>
            <li id="navelm"><a href="login_usuario.html"><%=usr_name%></a></li>
            
        </ul>
    </nav>
</div>
