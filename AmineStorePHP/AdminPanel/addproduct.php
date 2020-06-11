<?php


session_start();
if (isset($_SESSION['userid'])) {
$userid = $_SESSION['userid'];
require_once('../Database/basedatos.php'); 
$db= conectar();



   
if(isset($_GET["save"])){
    $name = mysqli_real_escape_string($db,$_GET['name']);
    $imageurl = mysqli_real_escape_string($db,$_GET['imageurl']);
    $description = mysqli_real_escape_string($db,$_GET['description']);
    $price = mysqli_real_escape_string($db,$_GET['price']);
    $stock = mysqli_real_escape_string($db,$_GET['stock']);
    $id = mysqli_real_escape_string($db,$_GET['id']);
    $categoria=mysqli_real_escape_string($db,$_GET['categoria']);
    $brnad=mysqli_real_escape_string($db,$_GET['brand']);
    
    
    
    if(!empty($name) && !empty($imageurl) && !empty($description) && !empty($price) && !empty($stock) && !empty($categoria) && !empty($brnad)){
       $sqlee = "INSERT INTO productos (nombre,descripcion,precio,existencias,marca,urlimagen,idcategoria) values('$name','$description',$price,$stock,'$brand','$imageurl',$categoria) " ;
        if(mysqli_query($db,$sqlee)){
            header('Location: products.php');
        }  
        else {
            header('Location: messagepage.php?id=11');
        } 
    }else{
        
        header('Location: messagepage.php?id=11');
    }
    
    
 
}

?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Add Product</title>
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
                       
                        <h1 class="mt-4">Products Informations</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.php">Dashboard</a></li>
                            <li class="breadcrumb-item active">Products</li>
                        </ol>
                   
                       
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>Add new Product</div>
                   
                       
                         <div class="card-body">
                                <div class="table-responsive">
                            <form action="" method="get">
                                <div class="form-group">
                                  <label>Name</label>
                                  <input type="text" class="form-control" name="name" required>
                                </div>
                                <div class="form-group">
                                  <label>Image url</label>
                                  <input type="text" class="form-control" name="imageurl"  required>
                                </div>
                                <div class="form-group">
                                  <label>Description</label>
                                  <input type="text" class="form-control" name="description"  required>
                                </div>
                                <div class="form-group">
                                  <label>Price €</label>
                                  <input type="number" class="form-control" name="price"  required>
                                </div>
                                <div class="form-group">
                                  <label>Stock</label>
                                  <input type="number" class="form-control" name="stock" required>
                                </div>
                                <div class="form-group">
                                  <label>Brand</label>
                                  <input type="text" class="form-control" name="brand" required>
                                </div>
                                <div class="form-group">
                                  <label>Categoria</label>
                                  <select name="categoria" class="form-control" >
                                    <option value="1">general</option>
                                    <option value="2">moviles</option>
                                    <option value="3">componentes</option>
                                  </select>
                                </div>
                               
                                <button type="submit" class="btn btn-primary" name="save">Add</button>
                            </form>
                        </div>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    </body>
</html>
<?php
}
else {
header('Location: ../login.php');
}
?>


