<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <title>BookStore Manager</title>
        <style>
            body {
                margin: 0;
                font-family: 'Poppins', sans-serif;
            }

            aside {
                width: 100%;
                background-color: #333;
                color: #fff;
                text-align: center;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
            }

            .sidebar {
                width: 100%;
                Height: 145px;
                background-color: #000000;
                padding: 5px 0;
            }

            .logo-side {
                display: inline-block;
                color: #ecf0f1;
                font-size: 24px;
                margin-right: 50px;
                text-align: left;
            }

            .side-menu {
                display: inline-block;
                list-style: none;
                padding: 0;
                margin: 0;
                text-align: left;
            }

            .side-menu li {
                display: inline-block;
                position: relative;
            }

            .side-menu a {
                color: #ffffff;
                display: inline-block;
                padding: 10px 20px;
                transition: 0.3s;
                font-size: 18px;
                text-decoration: none;
            }

            .side-menu a:hover {
                background-color: #C21010;
                color: #ecf0f1;
                border-bottom: 4px solid #C21010;
            }

            .side-menu .sub-menu {
                display: none;
                position: absolute;
                background-color: #000000;
                list-style: none;
                padding: 0;
                margin: 0;
                top: 100%;
                left: 0;
                width: 200px;
                z-index: 1000;
            }

            .side-menu li:hover .sub-menu {
                display: block;
            }

            .sub-menu li {
                display: block;
            }

            .sub-menu a {
                display: block;
                padding: 10px;
                text-align: left;
            }

            .sub-menu a:hover {
                background-color: #C21010;
                color: #ecf0f1;
                border-left: 4px solid #C21010;
            }

            .logout {
                color: #ffffff;
                padding: 10px 20px;
                transition: 0.3s;
                font-size: 18px;
                text-decoration: none;
                display: inline-block;
                margin-right: 20px; /* Adjust the right margin as needed */
            }

            .side-menu li.active a {
                background-color: #C21010;
                color: #ecf0f1;
                border-bottom: 4px solid #C21010;
            }

            .content {
                padding-top: 100px; /* height of the fixed sidebar */
            }
        </style>
    </head>
    <body>
        <aside>
            <div class="sidebar">
                <a href="Manalytics" class="logo-side">
                    <div class="logo-name">
                        <div class="Campus">BookStore</div>
                        <div class="Munchines">Manager</div>
                    </div>
                </a>
                <ul class="side-menu">
                    <li id="Manalytics"><a href="Manalytics"><i class='bx bx-home-heart'></i> Analytics</a></li>
                    <li id="MorderManagement"><a href="MorderManagement"><i class='bx bx-store'></i> Order</a></li>
                    <li id="MlistMenu">
                        <a href="MlistMenu"><i class='bx bx-notepad'></i> Menu</a>
                        <ul class="sub-menu">
                            <li><a href="MlistMenu">List Menu</a></li>
                            <li><a href="MaddBook">Add Book</a></li>
                        </ul>
                    </li>
                    <li id="MemployeeManagement">
                        <a href="MemployeeManagement"><i class='bx bx-group'></i> Employee</a>
                        <ul class="sub-menu">
                            <li><a href="MemployeeManagement">List Employee</a></li>
                            <li><a href="McreateAccount">Create Account</a></li>
                        </ul>
                    </li>
                    <li id="McustomerManagement"><a href="McustomerManagement"><i class='bx bxs-user-badge'></i> Customer</a></li>
                    
                    <li id="Mlogout"><a href="Mlogout" class="logout"><i class='bx bx-exit'></i> Logout</a></li>
                </ul>
            </div>
        </aside>
        <div class="content">
            <!-- Your page content goes here -->
        </div>
        <script>
            // JavaScript to add active class to current link in sidebar
            document.addEventListener("DOMContentLoaded", function () {
                var currentLocation = window.location.href;

                // Loop through each link in the sidebar
                var menuItems = document.querySelectorAll('.side-menu a');
                menuItems.forEach(function (item) {
                    // Check if the link's href matches the current page URL
                    if (item.href === currentLocation) {
                        // Add 'active' class to the parent <li> element
                        item.parentNode.classList.add('active');
                    }
                });
            });

        </script>
    </body>
</html>
