<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

        <link rel="stylesheet" href="css/customerManagement.css">
        <title>BookStore manager</title>

    </head>

    <body>

        <div class="container-i">
            <!-- Sidebar -->

            <%@include file="Msidebar.jsp" %>

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <%
                    String username = (String) request.getSession().getAttribute("username");
                    if (username == null) {
                        response.sendRedirect("/Mlogin");
                    }
                %>
                <div class="header">
                    <div class="logo-tittle">
                 <img src="/img/logo.jpg" style="width: 120px;" alt=""/>
                    </div>

                    <div class="name-tittle">
                        Customer Management
                    </div>

                    <div class="user-info">

                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Customer Management Table -->
                <div class="customer-table">
                    <div class="search-main">
                        <h2 class="customer-list">Customer List</h2>
                        <select class="select-box" id="filterSelect">
                            <option value="name" selected>Name</option>

                            <option value="phone">Phone</option>
                            <option value="orders">Number Of Orders</option>

                        </select>
                        <div class="search-container">
                            <input type="text" class="search-box" id="searchInput" placeholder="Search...">
                        </div>
                    </div>
                    <div id="tableContainer">
                        <table>
                            <thead>
                                <tr>

                                    <th data-filter="name" onclick="sortTable(0)">Name</th>
                                    <th data-filter="phone" onclick="sortTable(1)">Phone</th>
                                    <th data-filter="orders" onclick="sortTable(2)">Number Of Orders</th>
                                    <th data-filter="totalSpent">Total Spending</th>

                                    <th data-filter="details">Details</th>
                                </tr>
                            </thead>
                            <tbody id="itemList">

                                <c:forEach var="m" items="${requestScope.listCusM}">
                                    <tr>
                                        <td>${m.name}</td>
                                        <td>${m.phone}</td>
                                        <td>${m.numberOrder}</td>
                                        <td>${m.totalSpending}$</td>
                                        <td><a class="view" href="McustomerDetails?bid=${m.phone}">View</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                        <div class="btn-pagination" id="pagination">
                            <button id="prevButton"><i class='bx bx-left-arrow-circle'></i></button>
                            <button id="nextButton"><i class='bx bx-right-arrow-circle'></i></button>

                        </div>
                    </div>
                </div>
                <!-- End of Book Management Orders -->
                <!-- Honor Customer -->
                <div class="other-info">
                    <div class="honor-customer-table">
                        <h2>Honor Customer</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Orders</th>
                                    <th>Total Spending</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="h" items="${requestScope.listCusH}">
                                    <tr>
                                        <td>${h.name}</td>
                                        <td>${h.numberOrder}</td>
                                        <td>${h.totalSpending}$</td>
                                        <td><a class="view" href="McustomerDetails?bid=${h.phone}">View</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="black-list-table">
                        <h2>Black List</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Orders</th>
                                    <th>Reject Orders</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="b" items="${requestScope.listCusB}">
                                    <c:choose>
                                        <c:when test="${b.cus_status eq 'Blocked'}">
                                            <tr>
                                                <td>${b.name} <ion-icon name="lock-closed-outline"></ion-icon></td>
                                        <td>${b.numberOrder}</td>
                                        <td>${b.cancel_count}</td>
                                        <td><a class="view" href="McustomerDetails?bid=${b.phone}">View</a></td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td>${b.name}</td>
                                            <td>${b.numberOrder}</td>
                                            <td>${b.cancel_count}</td>
                                            <td><a class="view" href="McustomerDetails?bid=${b.phone}">View</a></td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- End of Honor Customer -->
            </main>
            <!-- End of Main Content -->
        </div>
    </body>

    <script src="javascript/customerManagement.js"></script>

</html>