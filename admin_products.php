<?php

include 'configure.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if (!isset($admin_id)) {
    header('location:login.php');
};

if (isset($_POST['add_product'])) {
    $name = mysqli_real_escape_string($conn, $_POST['name']);
    $price = $_POST['price'];
    $image = $_FILES['image']['name'];
    $image_size = $_FILES['image']['size'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = 'books/'.$image;

    $select__product_name = mysqli_query($conn,"SELECT name FROM `products` WHERE name='$name'") or die('query failed');

    if(mysqli_num_rows($select__product_name) >0) {
        $message[] = 'Product namd already added !';
    } else {
        $add_product_query = mysqli_query($conn,"INSERT INTO `products` (name,price,image) VALUES ('$name','$price', '$image') ") or die('query failed');

        if($add_product_query) {
            if($image_size > 2000000){
                $message[] = 'Image size is too large !';
            }else{
                move_uploaded_file($image_tmp_name, $image_folder);
                $message[] = 'Product added successfully !';
            }
        } else {
            $message[] = 'Product could not be added !';
        }
    }
}

if (isset($_GET['delete'])) {
    $delete_id = $_GET['delete'];
    $delete_image_query = mysqli_query($conn,"SELECT image FROM `products` WHERE id = '$delete_id'") or die('query failed');
    $fetch_delete_image = mysqli_fetch_assoc($delete_image_query);
    unlink('books/'.$fetch_delete_image['image']);
    mysqli_query($conn,"DELETE FROM `products` WHERE id = '$delete_id'") or die('query failed');
    header('location:admin_products.php');
}

if(isset($_POST['update_product'])) {
    $update_p_id = $_POST ['update_p_id'];
    $update_name = $_POST ['update_name'];
    $update_price = $_POST ['update_price'];

    mysqli_query($conn,"UPDATE `products` SET name = '$update_name', price = '$update_price' WHERE id = '$update_p_id'") or die('query failed');

    $update_image = $_FILES['update_image']['name'];
    $update_image_tmp_name = $_FILES['update_image']['tmp_name'];
    $update_image_size = $_FILES['update_image']['size'];
    $update_folder = 'books/'.$update_image;
    $update_old_image = $_POST  ['update_old_image'];



    if(!empty($update_image)){
        if($update_image_size > 2000000){
            $message[] = 'Image file size is too large !';
         }else{
        mysqli_query($conn,"UPDATE `products` SET image = '$update_image' WHERE id = '$update_p_id'") or die('query failed');
        move_uploaded_file($update_image_tmp_name,$update_folder);
        unlink('books/'.$update_old_image);
        }
    }

    header('location:admin_products.php');

}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>

    <!--font awesome css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <!--custom admin css file link-->
    <link rel="stylesheet" href="css/admin_style.css">

</head>

<body>
    <?php
    include 'admin_header.php';
    ?>
    <!--Product ADD section Starts-->
<section class="add-products">
        <h1 class="title">Shop Products</h1>



    <form action="" method="post" enctype="multipart/form-data">
    <h3>Add Product</h3>
    <input type="text" name="name" class="box" placeholder="Enter Product name" required>
    <input type="number" min="0" name="price" class="box" placeholder="Enter Product price" required>
    <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box" required>
    <input type="submit" value="add product" name="add_product" class="btn" >

    </form>
    

</section>


    <!--Product CRUD section Ends-->  

<!------- Show products -------->

<section class="show-products">


    <div class="box-container">
        <?php
            $select_products = mysqli_query($conn,"SELECT * FROM`products`") or die('query failed');
            if(mysqli_num_rows($select_products) > 0) {
                while($fetch_products = mysqli_fetch_assoc($select_products)) {
        ?>
        <div class="box">
            <img src="books/<?php  echo $fetch_products['image']; ?>" alt="">
            <div class="name"><?php  echo $fetch_products['name']; ?></div>
            <div class="price">₹<?php  echo $fetch_products['price']; ?>/-</div>
            <a href="admin_products.php?update=<?php  echo $fetch_products['id']; ?>" class="option-btn">Update</a>
            <a href="admin_products.php?delete=<?php  echo $fetch_products['id']; ?>" class="delete-btn" onclick="return confirm('Delete this product?');">Delete</a>
        </div>
        <?php
            }
            }else{
                echo'<p class="empty">No Product added yet ! </p>';
            }
        ?>
    </div>
</section>


<!--- Edit Prodcts Starts----->
<section class="edit-product-form">

            <?php
                if(isset($_GET['update'])) {
                    $update_id = $_GET['update'];
                    $update_query = mysqli_query($conn,"SELECT * FROM `products` WHERE id = '$update_id'") or die('query failed');
                    if(mysqli_num_rows($update_query) > 0) {
                        while($fetch_update = mysqli_fetch_assoc($update_query)) {
            ?>
            <form action="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="update_p_id" value="<?php echo $fetch_update['id']; ?>">
                <input type="hidden" name="update_old_image" value="<?php echo $fetch_update['image']; ?>">
                <img src="books/<?php echo $fetch_update['image']; ?>" alt="">
                <input type="text" name="update_name" value="<?php echo $fetch_update['name']; ?>" class="box" required placeholder="Enter Product name">
                <input type="number" name="update_price" value="<?php echo $fetch_update['price']; ?>" min="0" class="box" required placeholder="Enter Product price">
                <input type="file" class="box" name="update_image" accept="image/jpg, image/jpeg, image/png">
                <input type="submit" value="update" name="update_product" class="btn">
                <input type="reset" value="cancel" id="close-update"  class="option-btn">
            </form>

            <?php
                        } 
                    }  
                    }else{
                        echo '<script>document.querySelector(".edit-product-form").style.display = "none";</script>';
                    }

            ?>



</section>



<!--- Edit Prodcts Ends----->








    <!---custome admin js file link---->
    <script src="js/admin_script.js"></script>

</body>

</html>