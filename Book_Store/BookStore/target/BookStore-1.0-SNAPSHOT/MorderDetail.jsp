<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/orderDetail.css">
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
                        Order Details
                        <div class="order-id">
                            Order ID: ${orderId}
                        </div>
                        <c:choose>
                            <c:when test="${invoiceInfo.ord_status eq 'Cancelled' || invoiceInfo.ord_status eq 'Rejected'}">
                                <div style="color: #C21010;"" class="status">
                                    ${invoiceInfo.ord_status}
                                </div>
                            </c:when>
                            <c:when test="${invoiceInfo.ord_status eq 'Waiting' || invoiceInfo.ord_status eq 'Preparing'}">
                                <div style="color: #0397d1;"" class="status">
                                    ${invoiceInfo.ord_status}
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div style="color: #1ec708;"" class="status">
                                    ${invoiceInfo.ord_status}
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Orders Book Information Table -->
                <div class="orders-table">
                    <h2 class="order-list" >Order Book Information</h2>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2" style="background-color: green;">Book</th>
                                <th style="background-color: green;">Unit Price</th>
                                <th style="background-color: green;">Quantity</th>
                                <th style="background-color: green;">Total Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${requestScope.listOrderDetail}">
                                <tr>
                                    <td class="book-info">
                                        <img src="${o.img}" alt="">
                                    </td>
                                    <td> <a style="color: #000" href="MbookDetails?bid=${o.book_id}">${o.name_book}</a></td>
                                    <td>${o.unit_price}$</td>
                                    <td>${o.quantity}</td>
                                    <td>${o.total_price}$</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" var="abc" value="${totalOrder}"/>
                    <div class="total-order">Total Order: ${abc}$</div>
                </div>
                <!-- End of Book Order Information Orders -->
                <ul class="other-info">
                    <li>
                        <div class="header-info">
                            <h2 class="customer-info">Customer</h2>
                            <a href="McustomerDetails?bid=${cusInfo.phone}">View Detail</a>
                        </div>
                        <hr>
                        <span>
                            <p><span class="bold-numbers">Name: </span>${cusInfo.name}</p>
                            <p><span class="bold-numbers">Phone: </span>${cusInfo.phone}</p>
                            <p><span class="bold-numbers">Address: </span>${cusInfo.address}</p>
                        </span>
                    </li>
                    <li>
                        <h2 class="customer-info">Invoice Information</h2>
                        <hr>
                        <span>
                            <p><span class="bold-numbers">Order Taker: </span>${invoiceInfo.emp_name}  </p>
                            <p><span class="bold-numbers">Order Type: </span>${invoiceInfo.ord_type}  </p>
                            <p><span class="bold-numbers">Payment Methods: </span>${invoiceInfo.ord_pay}  </p>
                            <p><span class="bold-numbers">Date Order: </span>${invoiceInfo.ord_date}  </p> 
                            <p><span class="bold-numbers">Note: </span>${invoiceInfo.ord_note} </p>
                        </span>
                    </li>
                </ul>

            </main>
            <!-- End of Main Content -->



        </div>
    </body>


</html>