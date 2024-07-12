

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <title>BookStore - Profile</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/Cprofile.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="Cheader.jsp"%>
        <div class="banner" style="margin-top:160px"></div>
        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Customer Profile
            </h4>
            <div class="card overflow-hidden">

                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action active" data-toggle="list"
                               href="#account-general">Info</a>
                            <a class="list-group-item list-group-item-action" data-toggle="list"
                               href="#account-change-password">Change password</a>

                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <form class="tab-pane fade active show" id="account-general">

                                <hr class="border-light m-0">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label class="form-label">Name</label>
                                        <input type="text" id="name" class="form-control mb-1" value="${customer.name}" name="name" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="text" class="form-control" value="${customer.phone}" disabled>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Email</label>
                                        <input type="text" id="email" class="form-control" value="${customer.email}" name="email" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Birthday</label>
                                        <input type="date" id="birthday" class="form-control" value="${customer.birthday}" name="birth" required>
                                    </div>

                                    <div class="form-group">
                                        <label class="form-label">Address</label>
                                        <input type="text" id="address" class="form-control" value="${customer.address}" name="address" required>
                                    </div>
                                    <strong class="text-success" style="color: green !important">${messU}</strong>
                                </div>
                                <div class="text-left mt-3">
                                    <button  id="SaveChangeBtn" class="btn btn-primary">Save changes</button>

                                </div>
                            </form>
                            <form  class="tab-pane fade" id="account-change-password">

                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Current password</label>
                                        <input type="password" id="password" class="form-control" name="currentPass" required="">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">New password</label>
                                        <input type="password" id="password1" class="form-control" name="newPass"
                                               oninput="checkPasswords()" required="">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Repeat new password</label>
                                        <input type="password" id="password2" class="form-control" name="repeatPass"
                                               oninput="checkPasswords()">
                                    </div>
                                </div>
                                <div class="text-left mt-3">
                                    <button type="submit" id="savePassBtn" class="btn btn-primary" >Save
                                        changes</button>

                                </div>

                            </form>



                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="Cfooter.jsp"%>
        <!--<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>-->
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript"></script>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
            document.getElementById('SaveChangeBtn').addEventListener('click', function (event) {
                event.preventDefault();
                const name = document.getElementById('name').value;
                const address = document.getElementById('address').value;
                const birthday = document.getElementById('birthday').value;
                const email = document.getElementById('email').value;
                if (!name || !address || !birthday || !email) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid information',
                        text: 'Please fill in the required information!'
                    });
                } else if (!isValidName(name)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid name',
                        text: 'It must be between 2 and 50 characters.'
                    });
                } else if (!isValidAddress(address)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid address',
                        text: 'It must be between 1 to 50 characters'
                    });
                } else if (!isValidEmail(email)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid email',
                        text: 'It must be between 1 to 50 characters'
                    });
                } else {
                    saveChange();
                }
            });

            function saveChange() {
                const name = document.getElementById('name').value;
                const address = document.getElementById('address').value;
                const birthday = document.getElementById('birthday').value;
                const email = document.getElementById('email').value;
                var same = "true";
                if (email == '${customer.email}') {
                    same = "true";
                } else {
                    same = "false";
                }
                $.ajax({
                    url: "/customer/CupdateProfile",
                    type: "post",
                    data: {
                        name: name, address: address, birthday: birthday, email: email, same: same
                    },
                    success: function (data) {
                        Swal.fire({
                            icon: 'success',
                            text: 'Update successfully'
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

            document.getElementById('savePassBtn').addEventListener('click', function (event) {
                event.preventDefault();
                const password1 = document.getElementById('password1').value;

                if (!password1) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid information',
                        text: 'Please fill in the required information!'
                    });
                } else if (!isValidPassword(password1)) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Invalid password',
                        text: 'It must be between 8 and 20 characters.'
                    });
                } else {
                    savePassword();
                }
            });

            function savePassword() {
                const currentPass = document.getElementById('password').value;
                const newPass = document.getElementById('password1').value;
                $.ajax({
                    url: "/customer/CchangePassword",
                    type: "post",
                    data: {
                        currentPass: currentPass,
                        newPass: newPass
                    },
                    success: function (data) {
                        Swal.fire({
                            icon: 'success',
                            text: 'Update successfully'
                        });
                    },
                    error: function (xhr) {
                        Swal.fire({
                            icon: 'error',
                            text: 'Current Password is not correct'
                        });
                    }
                });
            }

            function isValidName(name) {
                return name.length >= 2 && name.length <= 50;
            }

            function isValidAddress(address) {
                return address.length >= 1 && address.length <= 50;
            }

            function isValidPassword(password1) {
                return password1.length >= 8 && password1.length <= 20;
            }

            function isValidEmail(email) {
                return email.length >= 1 && email.length <= 50;
            }



            function checkPasswords() {
                var password1 = document.getElementById("password1").value;
                var password2 = document.getElementById("password2").value;
                var message = document.getElementById("message");

                if (password1 === password2) {
                    message.innerHTML = "Passwords match!";
                    message.style.color = "green";
                } else {
                    message.innerHTML = "Passwords do not match. Please try again.";
                    message.style.color = "red";
                }
            }



        </script>
    </body>
</html>
