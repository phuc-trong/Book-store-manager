<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>BookStore - Forgot Password</title>
        <link href="css/Gregister.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="box">
            <div class="container">
                <div class="top-header">
                    <header>Forgot Password</header>
                </div>

                <div class="input-field">
                    <input type="text" id="email" name="email" class="input" placeholder="Enter your email..." required>
                    <i class='bx bx-envelope'></i>
                </div>
                <div class="error-message" id="error-message" style="display: none; text-align: center;">
                    Please enter your email!
                </div>
                <div class="error-message" style="text-align: center;">
                    <!-- <p>${error}</p> -->
                </div>

                <div class="input-field">
                    <input type="button" class="submit" value="Submit">
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            document.querySelector('.submit').addEventListener('click', function (event) {
                const email = document.getElementById('email').value;
                const errorMessage = document.getElementById('error-message');
                if (!email) {
                    errorMessage.innerHTML = 'Please enter all required information!';
                    errorMessage.style.display = 'block';
                    event.preventDefault();
                } else {
                    errorMessage.style.display = 'none';
                    sendEmail();
                }
            });

            function sendEmail() {
                const email = document.getElementById("email").value;

                $.ajax({
                    url: "/guest/GforgotPassword",
                    type: "post",
                    data: {
                        email: email
                    },
                    success: function (data) {
                        Swal.fire({
                            icon: 'success',
                            text: 'New password is sent. Click OK to redirect to login page',
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'OK',
                            cancelButtonColor: '#d33',
                            cancelButtonText: 'Cancel'
                        }).then((result) => {
                            if (result.value) {
                                window.location.href = "/guest/Glogin";
                            }
                        });
                    },
                    error: function (xhr) {
                        Swal.fire({
                            title: 'Error',
                            text: "The email is not existed",
                            icon: 'error'
                        });
                    }

                });
            }
        </script>

    </body>

</html>