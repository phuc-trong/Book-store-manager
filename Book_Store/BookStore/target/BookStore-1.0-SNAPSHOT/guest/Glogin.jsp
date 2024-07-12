<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
              <title>BookStore - Login</title>
        <link href="css/Glogin.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="box">
            
            <div class="container">
                <div class="top-header">
                    <!-- <span>Have an account?</span> -->
                    <header>Login</header>
                </div>

                <div class="input-field">
                    <input type="text" id="username" name="phone" class="input" placeholder="Enter your phone...">
                    <i style="color:black" class="bx bx-user"></i>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password" class="input" placeholder="Enter password...">
                    <i style="color:black" class="bx bx-lock-alt"></i>
                </div>
                <div class="input-field">
                    <input type="button" class="submit" onclick="validateForm()" value="Login">
                </div>

                <div class="bottom">
                    <div class="left">
                        <!--                            <input type="checkbox" id="check">
                                                    <label for="check"> Remember Me</label>-->
                    </div>
                    <div class="right">
                        <label><a href="/guest/GforgotPassword">Forgot password?</a></label>
                    </div>
                </div>
                <div class="register">
                    <p>If you don't have account, <a href="register">click here</a></p>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                        function validateForm(){
                            const username = document.getElementById('username').value;
                            const password = document.getElementById('password').value;
                            if (!username || !password) {
                                Swal.fire({
                                    title: 'Error',
                                    text: "You have input phone and password",
                                    icon: 'warning'
                                });
                            } else {
                                checkUser();
                            }
                        }
                        function checkUser() {
                            const username = document.getElementById('username').value;
                            const password = document.getElementById('password').value;
                            $.ajax({
                                url: "/guest/Glogin",
                                type: "post",
                                data: {
                                    phone: username,
                                    password: password
                                },
                                success: function (data) {
                                    // Kiểm tra xem có thông báo lỗi hay không

                                    window.location = "/customer/Chome";

                                },
                                error: function (xhr) {
                                        Swal.fire({
                                            title: 'Error',
                                            text: xhr.responseText,
                                            icon: 'error'
                                        });
                                    }
                                
                            });
                        }


        </script>
    </body>

</html>
