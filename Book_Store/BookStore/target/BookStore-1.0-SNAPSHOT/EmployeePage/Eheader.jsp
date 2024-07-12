<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link rel="stylesheet" href="/EmployeePage/css/Eheader.css">
        <title>Book Store</title>
        <style>
            body {
                background-image: url('/img/book-shop-classic-vintage.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }

            /* Thiết lập mặc định cho các liên kết */
            #main-menu a {
                color: white;
                background-color: transparent;
                padding: 10px;
                text-decoration: none;
                display: inline-block;
            }

            .highlight-red {
                background-color: red !important;
                color: white !important;
            }

            .search-bar {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 5px;
            }

            .search-bar .input-group {
                display: flex;
                border: 1px solid #ccc;
                border-radius: 25px;
                overflow: hidden;
                background-color: #f8f9fa;
            }

            .search-bar .input-group .input-group-text {
                background-color: #fff;
                border: none;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .search-bar .input-group input {
                border: none;
                outline: none;
                padding: 10px;
                flex-grow: 1;
            }

            .search-bar .input-group button {
                background-color: #007bff;
                border: none;
                color: white;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .search-bar .input-group button:hover {
                background-color: #0056b3;
            }

            header .inner-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            nav {
                margin-left: auto;
            }
        </style>
    </head>

    <body>
        <div id="wrapper">
            <header>
                <div class="inner-header container-fluid" style="max-width: 1700px">
                    <img style="width: 120px; border-radius: 50%" src="/img/logoCM.png" alt="Logo Book Store">
                    <%
                        boolean OrderList = Boolean.parseBoolean(request.getParameter("isOrderList"));
                        pageContext.setAttribute("OrderList", OrderList);
                    %>
                    <c:choose>
                        <c:when test="${OrderList}">

                        </c:when>
                        <c:otherwise>
                            <div style="width: 46em;" class="mx-5"></div>
                        </c:otherwise>
                    </c:choose>
                    <nav>
                        <ul id="main-menu">
                            <li>
                                <c:choose>
                                    <c:when test="${sessionScope.phone != null}">
                                        <a href="/employee/EorderList" class="menu-link">Order List</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/employee/Elogin" class="menu-link">Order List</a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li>
                                <a href="/employee/Edelivery" class="menu-link">Delivery</a>
                            </li>

                            <li>
                                <a href="/employee/EnewOrderList" class="menu-link">New Order</a>
                            </li>
                            <%
                                String name = request.getSession().getAttribute("phone") + "";
                                if (name.equals("") || name.equals("null")) {
                            %>
                            <li>
                                <a href="" class="menu-link">My Account</a>
                                <ul class="sub-menu">
                                    <li><a style="color: black" href="/employee/Elogin">Login</a></li>
                                </ul>
                            </li>
                            <% } else { %>
                            <li>
                                <a href="" class="menu-link">Hello, ${sessionScope.fullname}</a>
                                <ul class="sub-menu">
                                    <li><a style="color: black" href="/employee/EupdateProfile">Profile</a></li>
                                    <li><a style="color: black" href="/employee/EchangePassword">Change Password</a></li>
                                    <li><a style="color: black" href="/employee/Elogout">Logout <ion-icon style="display: inline-block; vertical-align: middle; margin-left: 2px; font-size: 24px;" name="log-out-outline"></ion-icon></a></li>
                                </ul>
                            </li>
                            <% }%>
                        </ul>
                    </nav>
                </div>
            </header>
        </div>

        <!-- End of Main Content -->
    </body>
    <script src="index.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script>
        $(document).ready(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop()) {
                    $('header').addClass('sticky');
                } else {
                    $('header').removeClass('sticky');
                }
            });

            // Highlight the menu link when clicked
            $('#main-menu a').click(function () {
                $('#main-menu a').removeClass('highlight-red'); // Remove class from all links
                $(this).addClass('highlight-red'); // Add class to the clicked link
            });
        });
    </script>

</html>
