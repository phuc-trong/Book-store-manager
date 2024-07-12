<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/orderManagement.css">
        <title>BookStore managers</title>

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
                        Order Management
                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Book Management Table -->
                <div class="orders-table">
                    <div class="search-main">
                        <h2 class="order-list">Order List</h2>
                        <select class="select-box" id="filterSelect">
                            <option value="orderId" selected>Order ID</option>
                            <option value="phone">Phone</option>
                            <option value="paymentMethods">Payment Methods</option>
                            <option value="dateOrder">Date Order</option>
                        </select>
                        <div class="search-container">

                            <input type="text" class="search-box" id="searchInput" placeholder="Search...">
                        </div>
                    </div>
                    <div id="tableContainer">
                        <table>
                            <thead>
                                <tr>
                                    <th data-filter="orderId" onclick="sortTable(0)" style="background-color: green;">Order ID</th>
                                    <th data-filter="status" onclick="sortTable(1)" style="background-color: green;">Status</th>
                                    <th data-filter="dateOrder" onclick="sortTable(2)" style="background-color: green;">Date Order</th>
                                    <th data-filter="phone" onclick="sortTable(3)" style="background-color: green;">Phone Customer</th>
                                    <th data-filter="paymentMethods" onclick="sortTable(4)" style="background-color: green;">Payment Methods</th>
                                    <th data-filter="total" onclick="sortTable(5)" style="background-color: green;">Total</th>
                                    <th data-filter="details" style="background-color: green;">Details</th>

                                </tr>
                            </thead>

                            <tbody id="itemList">
                                <c:forEach var="m" items="${requestScope.listOrderM}">
                                    <tr>
                                        <td>${m.ord_id}</td>
                                        <c:choose>
                                            <c:when test="${m.ord_status eq 'Cancelled' || m.ord_status eq 'Rejected'}">
                                                <td style="color: #C21010;">${m.ord_status}</td>
                                            </c:when>
                                            <c:when test="${m.ord_status eq 'Waiting' || m.ord_status eq 'Preparing'}">
                                                <td style="color: #0397d1;">${m.ord_status}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="color: #1ec708;">${m.ord_status}</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${m.ord_date}</td>
                                        <td>${m.cus_phone}</td>
                                        <td>${m.ord_pay}</td>
                                        <td>${m.ord_total}$</td>
                                        <td class="view-link"><a href="MorderDetails?bid=${m.ord_id}" class="view">View</a></td>
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

            </main>
            <!-- End of Main Content -->
        </div>
    </body>
    <script src="javascript/orderManagement.js" type="text/javascript"></script>
</html>