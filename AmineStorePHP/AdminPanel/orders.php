<?php session_start();
if (isset($_SESSION['userid'])) {

$userid = $_SESSION['userid'];

require_once('../Database/basedatos.php'); 
$db= conectar();

$filternum=0;
$date_v="=";
$id_v=0;
if(isset($_GET["filter"])){
    
    if(isset($_GET["user"]) && !empty($_GET["user"])){
        $filternum=1;
        $id_v=$_GET["user"];
    }
    else if(isset($_GET["product"]) && !empty($_GET["product"])){
        $filternum=2;
        $id_v=$_GET["product"];
        
    }
    else if(isset($_GET["date"]) && !empty($_GET["date"])){
        $filternum=3;
        $id_v=$_GET["date"];
        if(isset($_GET["filtermethod"])){
            if($_GET["filtermethod"] == 2)
                $date_v="<=";
            else if($_GET["filtermethod"] == 3)
                $date_v=">=";
            else
                $date_v="=";
           
        }
          
    }
}



?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        
        <title>Admin Panel</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">


        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="index.php">Amine Store</a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button

            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                
            </form>

            <ul class="navbar-nav d-md-inline-block form-inline ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="profil.php"><?php echo $_SESSION['username']; ?></a>
                   
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.php">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Panel</div>
                            <a class="nav-link" href="index.php"
                                ><div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard</a
                            >
                            
                        
                            <a class="nav-link" href="users.php"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Users</a>
                             <a class="nav-link" href="products.php"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Products</a>
                             <a class="nav-link" href="orders.php"
                                ><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Orders</a>
                        </div>
                    </div>
                   
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                       
                        <h1 class="mt-4">Orders Informations</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
                            <li class="breadcrumb-item active">Orders</li>
                        </ol>
                        
                        
                   
                       
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>Orders table</div>
                            <?php
                            if($filternum>0){?>
                                <button  class="btn btn-primary" name="add" onClick="document.location.href='orders.php'">Cancel Filter</button>
                            <?php } ?>
                             
                            
                            
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                 <th>Order</th>
                                                <th>Date</th>
                                                <th>User</th>
                                                <th>Products</th>
                                                <th>Amount</th>
                                                <th>Statut</th>
                                                <th>Action</th>
                                               
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                 <th>Order</th>
                                                <th>Date</th>
                                                <th>User</th>
                                                <th>Products</th>
                                                <th>Amount</th>
                                                <th>Statut</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <?php 
                                       
                                        if($filternum==0){
                                            $sqle = "SELECT p.id as id ,p.fech as fech , p.uid as uid , p.cantidad as cantidad , ep.nombre as nombre FROM pedidos p,estado_pedido ep  where p.estado_pedido=ep.id";
                                        }else{
                                            if($filternum==1){
                                                $sqle = "SELECT p.id as id ,p.fech as fech , p.uid as uid , p.cantidad as cantidad , ep.nombre as nombre FROM pedidos p,estado_pedido ep  where p.estado_pedido=ep.id and p.uid=".$id_v;
                                            }else if($filternum==2){
                                                $sqle = "SELECT p.id as id ,p.fech as fech , p.uid as uid , p.cantidad as cantidad , ep.nombre as nombre FROM pedidos p,estado_pedido ep where p.estado_pedido=ep.id and p.id in(select id_pedido from pedido_producto where id_producto=".$id_v.")";
                                            }else{
                                                $sqle = "SELECT p.id as id ,p.fech as fech , p.uid as uid , p.cantidad as cantidad , ep.nombre as nombre FROM pedidos p,estado_pedido ep  where p.estado_pedido=ep.id and p.fech ".$date_v." '".$id_v."'";
                                                
                                            }
                                            
                                        }
                                  
                                     
                                        $result = mysqli_query($db,$sqle);
                                     
                                         
                                        while($row = mysqli_fetch_assoc($result)){
                                        ?>    
                                            <tr>
                                                <td><?php echo $row["id"]; ?> </td>
                                                 <td><?php echo $row["fech"]; ?> </td>
                                                  <td><?php echo $row["uid"]; ?> </td>
                                                   <td>
                                                   <?php
                                                   $sqlr = "SELECT distinct(id_producto) as idi from pedido_producto where id_pedido=".$row['id'];
                                                   $resulte = mysqli_query($db,$sqlr);
                                                   echo " [ ";
                                                   while($rowe = mysqli_fetch_assoc($resulte)){
                                                       echo $rowe["idi"];
                                                       echo " ";
                                                   }
                                                   echo "]";
                                                  
                                                   ?>
                                                   </td>
                                                   <td><?php echo $row["cantidad"]; ?> </td>
                                                <td><?php echo $row["nombre"]; ?> </td>              
                                                 <td>
                                                    <?php  if($row["nombre"]=="Pending"){$action="send.php?id=";}else if($row["nombre"]=="Sent"){$action="delivered.php?id=";} ?>
                                                    <center>
                                                    <a href="<?php echo $action."".$row["id"]; ?>">
                                                        <?php if($row["nombre"]=="Pending"){echo "Send";}else if($row["nombre"]=="Sent"){echo "Delivered";} ?>
                                                    </a>
                                                    </center>
                                                </td>
                                           
                                            
                                                
                                            </tr>
                                            
                                        <?php } ?>    
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            
                            <div class="card-body">                    
                                <form action="" method="get">
                                    <div class="form-group">
                                      <label>User</label>
                                      <input type="number" class="form-control" name="user" >
                                    </div>
                                    <div class="form-group">
                                      <label>Product</label>
                                      <input type="number" class="form-control" name="product" >
                                    </div>

                                     <div class="form-row">
                                        <div class="form-group col-md-10">
                                          <label for="inputCity">Date</label>
                                          <input type="date" class="form-control"  name="date">
                                        </div>
                                        <div class="form-group col-md-2">
                                          <label for="inputState">Filter</label>
                                          <select name="filtermethod" id="inputState" class="form-control">
                                            <option value="1">Equal</option>
                                            <option value="2">Less</option>
                                            <option value="3">Higher</option>
                                        </select>
                                        </div>

                                     </div>

                                    <button type="submit" class="btn btn-primary" name="filter">Filter</button>
                                </form>
                   
                        </div>
                        </div>
                        
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Amine Store</div>
                           
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        
        
  
        
        
    </body>
</html>
<?php
}
else {
header('Location: ../login.php');
}
?>


