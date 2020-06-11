<?php

require_once('../Database/basedatos.php'); 
$db= conectar();

$id = mysqli_real_escape_string($db,$_GET['id']);
$sqlee = "UPDATE usuario SET activo = 0 WHERE id = $id" ;
mysqli_query($db,$sqlee);
header('Location: users.php');

?>