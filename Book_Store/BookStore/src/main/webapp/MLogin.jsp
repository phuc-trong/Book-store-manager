<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <title>BookStore Manager</title>
    <style>
        .eye-icon {
            position: absolute;
            right: -25px;
            top: 55%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 24px; /* Increased size for better click area */
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
        </div>
    </header>
    <div class="box">
        <span class="borderLine"></span>
        <form action="Mlogin" method="post">
            <h2>SIGN IN</h2>
            <div class="inputBox">
                <input type="text" name="username" required="required">
                <span>Username</span>
                <i></i>
            </div>
            <div class="inputBox">
                <input type="password" name="password" id="password" required="required">
                <span>Password</span>
                <i></i>
                <ion-icon name="eye-off-outline" class="eye-icon" id="togglePassword"></ion-icon>
            </div>
            <p class="text-danger" style="margin-top: 20px; color: #c21010">${mess}</p>
            <div style="text-align: center; margin-top: 20px">
                <input type="submit" value="Login">
            </div>
        </form>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const togglePasseword = document.getElementById('togglePassword');
            const password = document.getElementById('password');

            togglePassword.addEventListener('click', function () {
                // Toggle the type attribute
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                // Toggle the eye icon
                this.name = this.name === 'eye-off-outline' ? 'eye-outline' : 'eye-off-outline';
            });
        });
    </script>
</body>
</html>
