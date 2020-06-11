<?php

function conectar()
{
$localhost = "localhost";
$dbname = "aminestore";
$user = "root";
$pass = "";
 $bbdd = mysqli_connect($localhost,$user,$pass,$dbname);
 if (mysqli_connect_error()) {
     header('Location: ./databaseerror.html');
    exit();
 }
 return $bbdd;
}
function desconectar($bbdd)
{
 mysqli_close($bbdd);
}

function getNombrebyId($db,$id){
    $sqle = "SELECT nombre FROM administracion where id = ".$id ;
    $result = mysqli_query($db,$sqle);
    $row = mysqli_fetch_assoc($result);
    return $row["nombre"];
}
function getEmailbyId($db,$id){
    $sqle = "SELECT email FROM administracion where id = ".$id ;
    $result = mysqli_query($db,$sqle);
    $row = mysqli_fetch_assoc($result);
    return $row["email"];
}

function getTotalProducts($db){
    $sqle = "SELECT count(*) as total FROM productos";
    $result = mysqli_query($db,$sqle);
    $row = mysqli_fetch_assoc($result);
    return $row["total"];
}

function getTotalUsers($db){
    $sqlee = "SELECT count(*) as total FROM usuario";
    $result = mysqli_query($db,$sqlee);
    $row = mysqli_fetch_assoc($result);
    return $row["total"];
}

function getTotalOrders($db){
    $sqlee = "SELECT sum(cantidad) as total FROM pedido_producto";
    $result = mysqli_query($db,$sqlee);
    $row = mysqli_fetch_assoc($result);
    return $row["total"];
}

function getTotalProfit($db){
    $sqlee = "SELECT sum(precio) as total FROM pedido_producto";
    $result = mysqli_query($db,$sqlee);
    $row = mysqli_fetch_assoc($result);
    return $row["total"];
}

function desactiveUser($db,$id){
    $sqlee = "UPDATE usuario SET activo = 0 WHERE `id = $id ";
    $result = mysqli_query($db,$sqlee);
    
}
function activeUser($db,$id){
    $sqlee = "UPDATE usuario SET activo = 1 WHERE `id = $id ";
    $result = mysqli_query($db,$sqlee);
    
}






?>