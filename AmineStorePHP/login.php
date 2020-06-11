<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Amine Store</title>       
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="Style/login.css">
    </head>
    <body>
        
        <div class="wrapper fadeInDown">
            <div id="formContent">

              <div class="fadeIn first">
                  <img src="Image/store.png" id="icon" alt="User Icon" />
              </div>

              <form action="validar.php" method="post">
                    <input type="email" id="login" class="fadeIn second" name="usuario" placeholder="Email" required>
                    <input type="password" id="password" class="fadeIn third" name="clave" placeholder="Password" required>
                <input type="submit" class="fadeIn fourth" name="login" value="Log In">
              </form>
                <p id="error">
                <?php
                session_start();
                if(isset($_SESSION['error'])){
                    if($_SESSION['error']==1){
                        echo "Your Email or Password is invalid";
                        $_SESSION['error']=0;
                    }
                }
                ?>
                </p>

            </div>
        </div>

    </body>
</html>



