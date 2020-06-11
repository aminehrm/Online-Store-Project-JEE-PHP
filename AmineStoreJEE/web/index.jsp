<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Amine Store</title>
        <meta name="description" content=" A Website for the practice 2">
        <meta name="author" content="Amine Hrimech">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/StoreStyle.css" > 
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script type="text/javascript" src="js/libCapas.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        
        
    </head>
    <body onload="Cargar('portada.html','wrap')">
        
        <div class="container">
            
            <%@include file="/web/PageParts/header.jsp" %>
         
            <div id="wrap"> </div>
            
            <%@include file="/web/PageParts/footer.jsp" %>
            
        </div>
    </body>
</html>
