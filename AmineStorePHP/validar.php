<?php
        session_start();
        require_once('Database/basedatos.php'); 
        $db= conectar();
        if(isset($_POST["login"])){
            
            $myusername = mysqli_real_escape_string($db,$_POST['usuario']);
            $mypassword = mysqli_real_escape_string($db,$_POST['clave']); 
            
                if (!empty($_POST['usuario']) && !empty($_POST['clave'])) {
                    $sql = "SELECT id FROM administracion where email = '$myusername' and clave = '$mypassword' ";
                    $result = mysqli_query($db,$sql);
                    $count = mysqli_num_rows($result);
                    

                        if($count == 1) {
                           $correcto = true;
                        }else {
                           $correcto = false;
                           
                        }
                        
                        if ($correcto == true ) {
                           $row = mysqli_fetch_assoc($result);
                           $_SESSION['userid']=$row["id"];           
                           $_SESSION['error'] = 0;
                           $_SESSION["username"]=getNombrebyId($db,$userid); 
                           $_SESSION["email"]=getEmailbyId($db,$userid); 
                           header('Location: AdminPanel/index.php');
                        }else{
                            $_SESSION['error'] = 1;
                            header('Location: login.php');
                        } 

            }  
        }    
            


             
        

        
        
?>
        