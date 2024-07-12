<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
             <title>BookStore - Register</title>
        <link href="css/Gregister.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="box">
            <div class="container">
                <!--<form action="/BookStore/guest/login" method="post">-->
                <div class="top-header">
                    <header>Register</header>
                </div>
                <div class="input-field">
                    <input type="text" id="name" name="name" class="input" placeholder="Enter your name..." >
                    <i class="bx bx-user"></i>
                </div>
                <div class="input-field">
                    <input type="text" id="phone" name="phone" class="input" placeholder="Enter your phone...">
                    <i class='bx bx-phone'></i>
                </div>
                <div class="input-field">
                    <input type="text" id="email" name="email" class="input" placeholder="Enter your email..." >
                    <i class='bx bx-envelope'></i>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password" class="input" placeholder="Enter password..." >
                    <i class="bx bx-lock-alt"></i>
                </div>
                <div class="input-field">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="input" placeholder="Enter confirm password..." >
                    <i class="bx bx-lock-alt"></i>
                </div>
                <div class="input-field">
                    <input type="text" id="address" name="address" class="input" placeholder="Enter your address...">
                    <i class='bx bx-home' ></i>
                </div>
                <div class="input-field">
                    <input type="date" id="birthday" name="birthday" class="input" placeholder="Enter your birthday...">
                    <i class='bx bx-calendar-alt' ></i>
                </div>

                <div class="error-message" id="error-message" style="display: none; text-align: center;">
                    Please enter your phone and password!
                </div>
                <div class="error-message" style="text-align: center;">
                    <!-- <p>${error}</p> -->
                </div>

                <div class="input-field" >
                    <input type="button" class="submit" value="Register">
                </div>

                <!-- <div class="bottom">
                    <div class="left">
                        <input type="checkbox" id="check">
                        <label for="check"> Remember Me</label>
                    </div>
                    <div class="right">
                        <label><a href="#">Forgot password?</a></label>
                    </div>
                </div> -->
                <!--</form>-->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
            document.querySelector('.submit').addEventListener('click', function (event) {
                event.preventDefault();
                const name = document.getElementById('name').value;
                const phone = document.getElementById('phone').value;
                const email = document.getElementById('email').value;
                const password = document.getElementById('password').value;
                const address = document.getElementById('address').value;
                const confirmPassword = document.getElementById('confirmPassword').value;
                const birthday = document.getElementById('birthday').value;
                if (!phone || !password || !email || !confirmPassword || !name || !birthday || !address) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid information',
                        text: 'Please fill in the required information and confirm your password!'
                    });
                } else if (!isValidName(name)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid name',
                        text: 'It must be between 2 and 50 characters.'
                    });
                } else if (!isValidPhone(phone)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid phone number',
                        text: 'It should have 10 digits and the first number should be 0.'
                    });
                } else if (!isValidEmail(email)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid email',
                        text: 'It should follow the email format. (abc@domain.com)'
                    });
                } else if (!isValidPassword(password)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid password',
                        text: 'The password must be between 8 and 20 characters.'
                    });
                } else if (password !== confirmPassword) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid password',
                        text: 'Password and confirm password confirm do not match.'
                    });
                } else if (!isValidAddress(address)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid address',
                        text: 'It must be more than 50 characters.'
                    });
                } else if (!isValidDate(birthday)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid birthday',
                        text: 'Please enter a valid date of birth in yyyy/mm/dd format.'
                    });

                } else {

                    register();
                }


            });

            function register() {
                const name = document.getElementById('name').value;
                const phone = document.getElementById('phone').value;
                const password = document.getElementById('password').value;
                const address = document.getElementById('address').value;
                const confirmPassword = document.getElementById('confirmPassword').value;
                const birthday = document.getElementById('birthday').value;
                const email = document.getElementById('email').value;
                $.ajax({
                    url: "/guest/Gregister",
                    type: "post",
                    data: {
                        name: name,
                        phone: phone,
                        password: password,
                        address: address,
                        confirmPassword: confirmPassword,
                        birthday: birthday,
                        email:email
                    },
                    success: function (data) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Register successfully',
                            text: 'Click OK to redirect to Log in page',
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
                            icon: 'error',
                            text: xhr.responseText
                        });
                    }
                });
            }

            function isValidPhone(phone) {
                return /^[0-9]{10}$/.test(phone) && phone[0] === '0';
            }
            function isValidName(name) {
                return name.length >= 2 && name.length <= 50;
            }

            function isValidAddress(address) {
                return address.length >= 0 && address.length <= 50;
            }

            function isValidPassword(password) {
                return password.length >= 8 && password.length <= 20;
            }

            function isValidDate(birthday) {
                return birthday != null;
            }

            function isValidEmail(email) {
                const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

                return emailRegex.test(email);
            }
        </script>

    </body>

</html>