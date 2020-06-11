<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Amine Store</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/StoreStyle.css" > 
        <!-- JS -->
        <script type="text/javascript" src="js/libCapas.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        
        
    </head>
    <body>
        <div class="container">
           
            <%@include file="/web/PageParts/header.jsp" %>

            <div id="wrap">
                <div>
                    <div class="tam-1">
                        <h3 class="godzilla center">Control Panel</h3>
                    </div>

                    <div class="flex tam-1">
                        <div class="tam-3 panel fullimg-tam3">
                            <a href="#" onclick="Cargar('datos_personales.html?action=0', 'wrap');" title="user link" >
                                <div class="panel-body">
                                    <img src="img/user.png" alt="user img" />
                                </div>
                            </a>
                            <div class="panel-title center">Edit User</div>
                        </div>

                        <div class="tam-3 panel fullimg-tam3">
                            <a href="#" onclick="Cargar('pedidos_usuario.html', 'wrap');" title="delivery link" >
                                <div class="panel-body">
                                    <img src="img/orders.png" alt="delivery img" />
                                </div>
                            </a>
                            <div class="panel-title center">Orders</div>
                        </div>

                        <div class="tam-3 panel fullimg-tam3">
                            <a href="logout.html" title="logout link" >
                                <div class="panel-body">
                                    <img src="img/logout.png" alt="logout img" />
                                </div>
                            </a>
                            <div class="panel-title center">Logout</div>
                        </div>
                
                    </div>
                </div>
            </div>
            
            <%@include file="/web/PageParts/footer.jsp" %>
            
        </div>
    </body>
</html>