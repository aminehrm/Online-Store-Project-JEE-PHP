<?php

require_once('../Database/basedatos.php'); 
$db= conectar();

$id = mysqli_real_escape_string($db,$_GET['id']);
$sqlee = "UPDATE pedidos SET estado_pedido = 3 WHERE id = $id" ;
mysqli_query($db,$sqlee);
header('Location: orders.php');

?>