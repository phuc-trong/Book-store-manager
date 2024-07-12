<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/EmployeePage/css/EenterEmailChangePass.css"/>
        <style>
            body {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100vh;
                margin: 0;
                background-image: url('../img/book-shop-classic-vintage.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
            .main-content {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-grow: 1;
            }
            .container {
                width: 30%;
                background-color: #ffffff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .form-header {
                color: black;
                font-weight: bold;
                font-size: 24px;
                text-align: center;
                margin-bottom: 20px;
            }
            .input-field {
                position: relative;
                margin-bottom: 20px;
            }
            .input-field input {
                width: 100%;
                padding: 10px 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                font-size: 16px;
            }
            .input-field input::placeholder {
                color: #999;
            }
            .error-message {
                text-align: center;
                margin-bottom: 20px;
                color: red;
            }
            .submit {
                width: 100%;
                padding: 10px;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                color: white;
                font-size: 16px;
                font-weight: bold;
                cursor: pointer;
            }
            .submit:hover {
                background-color: #0056b3;
            }
            footer {
                background-color: #333;
                color: white;
                padding: 10px 0;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@include file="/EmployeePage/Eheader.jsp" %>
        <div class="main-content">
            <div class="container" style="max-width: 400px;">
                <form action="/employee" method="post">
                    <div class="form-header">Forgot Password</div>
                    <div class="input-field">
                        <input type="email" id="email" name="email" required>
                        <i class='bx bx-envelope'></i>
                    </div>
                    <div class="error-message" id="error-message" style="display: none;">
                        Please enter your email!
                    </div>
                    <div class="error-message">
                        <p>${error}</p>
                    </div>
                    <div class="input-field">
                        <button type="submit" class="submit" value="forgotPass" name="btnForgot"><b>Reset Password</b></button>
                    </div>
                </form>
            </div>
        </div>

        <%@include file="/EmployeePage/Efooter.jsp" %>
        <script>
            document.querySelector('form').addEventListener('submit', function (event) {
                const email = document.getElementById('email').value;
                const errorMessage = document.getElementById('error-message');
                if (!email) {
                    errorMessage.innerHTML = 'Please enter all required information!';
                    errorMessage.style.display = 'block';
                    event.preventDefault();
                } else {
                    errorMessage.style.display = 'none';
                }
                response.sendRedirect("/Elogin");
            });
        </script>
    </body>
</html>
