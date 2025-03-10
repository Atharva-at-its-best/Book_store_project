<?php

include 'configure.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if (!isset($admin_id)) {
    header('location:login.php');
}

if(isset($_GET['delete'])) {
    $delete_id = $_GET['delete'];
    mysqli_query($conn,"DELETE FROM `users` WHERE id = '$delete_id'") or die('query failed');
    header('location:admin_users.php');
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>

    <!--font awesome css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <!--custom admin css file link-->
    <link rel="stylesheet" href="css/admin_style.css">

</head>

<body>
    <?php
    include 'admin_header.php';
    ?>


    <section class="users">

    <h1 class="title">User Accounts</h1>



        <div class="box-container">
            <?php
                $select_users = mysqli_query($conn,"SELECT * FROM `users`") or die('query failed');
                while($fetch_users = mysqli_fetch_assoc($select_users)) {
            ?>
            <div class="box">
                <p> Username : <span><?php echo $fetch_users['Name']; ?></span></p>
                <p> Email : <span><?php echo $fetch_users['Email']; ?></span></p>
                <p> User type : <span style="color:<?php if($fetch_users['User_type'] == 'admin'){echo 'var(--orange)'; } ?>"><?php echo $fetch_users['User_type']; ?></span></p>
                <a href="admin_users.php?delete=<?php echo $fetch_users['ID']; ?>" 
                onclick="return confirm('Delete this User?'); "
                class="delete-btn">Delete User</a>

            </div>
            <?php
                };
            ?>


        </div>


    </section>










    <!---custome admin js file link---->
    <script src="js/admin_script.js"></script>

</body>

</html>