<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="/EmployeePage/css/Elogin.css" rel="stylesheet" type="text/css"/>
    </head>

    <body onload="loadRememberedUser()">
        <header><%@include file="/EmployeePage/Eheader.jsp" %></header>
        <div class="container" style="height: 100vh; display: flex; align-items: center; justify-content: center;">
            <div class="card" style=" background-color: rgba(0, 0, 0, 0.5); padding: 20px; border-radius: 10px; color: #fff;">
                <h4 class="title" style="text-align: center; margin-bottom: 20px; color: yellow; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);">Log In!</h4>

                <!-- Thêm phần kiểm tra và hiển thị thông báo -->
                <%
                    String message = request.getParameter("message");
                    if ("success".equals(message)) {
                %>
                <div style="color: green; text-align: center; margin-bottom: 20px;">
                    Bạn đã đăng ký thành công
                </div>
                <%
                    }
                %>

                <form action="/employee" method="post" onsubmit="return validateForm()">
                    <div class="field" style="margin-bottom: 15px;">                       
                        <input autocomplete="off" id="logemail" placeholder="Phone number" class="input-field" name="phone" type="text" style="padding-left: 40px; width: 100%; padding: 10px; border-radius: 5px; border: none;">
                    </div>
                    <div class="field" style="margin-bottom: 15px;">                      
                        <input autocomplete="off" id="logpass" placeholder="Password" class="input-field" name="password" type="password" style="padding-left: 40px; width: 100%; padding: 10px; border-radius: 5px; border: none;">
                    </div>

                    <div class="d-flex justify-content-between align-items-center w-100" style="margin-bottom: 15px;">
                        <div><input name="checkRememberMe" type="checkbox" class="me-1"><span style="color: white; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5)">Remember Me</span></div>
                        <div><a href="/employee/EforgotPass" class="btn-link" style="color: gray; text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5); margin: 25px">Forgot your password?</a></div>
                    </div>
                    <%
                        String invalid = "";
                        try {
                            invalid = request.getAttribute("loginError") + "";
                        } catch (Exception e) {
                        }
                        if (invalid != "" && !invalid.equals("null")) {
                    %>
                    <div><span style="color: red;">The phone or password is incorrect!</span></div>

                    <%
                        }
                    %>

                    <%
                        String successMessage = (String) request.getAttribute("success");
                        if (successMessage != null) {
                    %>
                    <div class="alert alert-success">
                        <%= successMessage%>
                    </div>
                    <%
                        }
                    %>

                    <div class="btnLogin my-4" style="text-align: center">
                        <button style="color: black" name="btnLogin" type="submit" value="login" class="px-5 py-2">Login</button>
                    </div>
                </form>  
            </div>
        </div>
        <footer>
            <%@include file="/EmployeePage/Efooter.jsp" %>
        </footer>
        <script>
            function setCookie(name, value, days) {
                var expires = "";
                if (days) {
                    var date = new Date();
                    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
                    expires = "; expires=" + date.toUTCString();
                }
                document.cookie = name + "=" + (value || "") + expires + "; path=/";
            }

            function getCookie(name) {
                var nameEQ = name + "=";
                var ca = document.cookie.split(';');
                for (var i = 0; i < ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ')
                        c = c.substring(1, c.length);
                    if (c.indexOf(nameEQ) == 0)
                        return c.substring(nameEQ.length, c.length);
                }
                return null;
            }

            function eraseCookie(name) {
                document.cookie = name + '=; Max-Age=-99999999;';
            }

            function loadRememberedUser() {
                var rememberedPhone = getCookie("rememberedPhone");
                var rememberedPassword = getCookie("rememberedPassword");
                if (rememberedPhone) {
                    document.getElementById('logemail').value = rememberedPhone;
                    document.getElementById('logpass').value = rememberedPassword;
                    document.getElementsByName('checkRememberMe')[0].checked = true;
                }
            }

            function validateForm() {
                var phone = document.getElementsByName('phone')[0].value;
                var password = document.getElementsByName('password')[0].value;
                var rememberMe = document.getElementsByName('checkRememberMe')[0].checked;

                var phoneRegex = /^0\d{9}$/; // Regular expression for phone number starting with 0 and having 10 digits

                if (phone === "") {
                    alert("Phone number must be filled out");
                    return false;
                }

                if (!phone.match(phoneRegex)) {
                    alert("Invalid phone number. Phone number should start with 0 and be 10 digits long.");
                    return false;
                }

                if (password === "") {
                    alert("Password must be filled out");
                    return false;
                }

                if (rememberMe) {
                    setCookie("rememberedPhone", phone, 7); // Store for 7 days
                    setCookie("rememberedPassword", password, 7); // Store for 7 days
                } else {
                    eraseCookie("rememberedPhone");
                    eraseCookie("rememberedPassword");
                }

                return true;
            }
        </script>
    </body>
</html>
