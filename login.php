<?php

include 'configure.php';
session_start();





if (isset($_POST['submit'])) {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $pass = mysqli_real_escape_string($conn, $_POST['password']);

    $select_users = mysqli_query($conn, "SELECT * FROM `users` WHERE email = '$email' AND password = '$pass'") or die('query failed');

    if (mysqli_num_rows($select_users) > 0) {
       $row= mysqli_fetch_assoc($select_users);

       if($row['User_type'] == 'admin'){

        $_SESSION['admin_name']= $row['Name'] ;
        $_SESSION['admin_email']= $row['Email'] ;
        $_SESSION['admin_id']= $row['ID'] ;
        header('location: admin_page.php');

       }elseif($row['User_type'] == 'user'){

        $_SESSION['user_name']= $row['Name'] ;
        $_SESSION['user_email']= $row['Email'] ;
        $_SESSION['user_id']= $row['ID'] ;
        header('location:home.php');

       }
    } else {
        $message[] = 'Incorrect email or password!';
    }

}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!--font awesome css-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    <!--custome Css-->
    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <?php
    if (isset($message)) {
        foreach ($message as $message) {
            echo '<div class="message">
                <span>' . $message . '</span>
                <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
                </div>
                ';
        }
    }
    ?>

    <div class="form-container">
        <form action="" method="post">
            <h3>Login now</h3>
            <input type="email" name="email" placeholder="Enter your Email" required class="box">
            <input type="password" name="password" placeholder="Enter your password" required class="box">
            <input type="submit" name="submit" value="login now" class="btn">
            <p>Don't have an account! <a href="register.php">Register now</a></p>


        </form>


    </div>






</body>

</html>