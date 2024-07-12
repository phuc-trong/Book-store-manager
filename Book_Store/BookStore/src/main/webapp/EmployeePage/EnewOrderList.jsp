<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="Edao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/EmployeePage/css/EnewOrderList.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            .btn-pagination button {
                font-size: 50px;
                width: 70px;
                border: none;
                color: black;
                background-color: white;
                cursor: pointer;
            }
            #pagination {
                text-align: center;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="/EmployeePage/Eheader.jsp" %>
        <div class="container-fluid" style="min-height: 100vh; padding-top: 241px;">
            <div class="d-flex justify-content-center">
                <div class="d-flex justify-content-center px-2 py-1 title my-3" style="color: white; background-color: #ff7c7c">New Order List</div>
            </div>
            <%
                String startDate = "";
                String endDate = "";
                try {
                    startDate = request.getAttribute("startDate") + "";
                    endDate = request.getAttribute("endDate") + "";
                } catch (Exception e) {
                }
            %>
            <div class="d-flex justify-content-end mb-2 mt-4" style="visibility: hidden">
                <form action="/employee" method="post">
                    <div>
                        <label for="">From: </label><input type="date" name="startDate" value="<%= startDate.equals("") ? "" : startDate%>">
                        <label for="">To: </label><input type="date" name="endDate" value="<%= endDate.equals("") ? "" : endDate%>">
                        <button class="mx-2" style="border: none;background: none" name="btnSearch" value="Search">
                            <i class="fa-solid fa-magnifying-glass nav_acc_glass" style="color: #FFB23E;"></i>
                        </button>
                    </div>
                </form>
            </div>

            <table class="table table-bordered" style="color: white; font-size: 25px;font-weight: normal">
                <thead>
                    <tr align="center">
                        <th scope="col" style="color: white; background-color: gray">Order ID</th>
                        <th scope="col" style="color: white; background-color: gray">Status</th>
                        <th scope="col" style="color: white; background-color: gray">Order Date</th>
                        <th scope="col" style="color: white; background-color: gray">Customer Name</th>
                        <th scope="col" style="color: white; background-color: gray">Phone</th>
                        <th scope="col" style="color: white; background-color: gray">Type</th>
                        <th scope="col" style="color: white; background-color: gray">Payment</th>
                        <th scope="col" style="color: white; background-color: gray">Total</th>
                        <th scope="col" style="color: white; background-color: gray">Detail</th>
                    </tr>
                </thead>
                <tbody id="itemList">
                    <%
                        OrderDAO ordDAO = new OrderDAO();
                        ResultSet rs = ordDAO.getNewOrder();
                        while (rs.next()) {
                    %>
                    <tr align="center">
                        <td><%= rs.getString("ord_id")%></td>
                        <td>
                            <%
                                String status = rs.getString("ord_status");
                                if (status.equals("Preparing")) {
                            %>
                            <div class="btn btn-primary" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Completed")) {
                            %>
                            <div class="btn btn-success" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Waiting")) {
                            %>
                            <div class="btn btn-warning" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Rejected")) {
                            %>
                            <div class="btn btn-secondary" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                            } else if (status.equals("Cancelled")) {
                            %>
                            <div class="btn btn-danger" style="font-weight: bold; font-size: 25px"><%= rs.getString("ord_status")%></div>
                            <%
                                }
                            %>
                        </td>
                        <td><%= rs.getString("ord_date")%></td>
                        <td><%= rs.getString("cus_name")%></td>
                        <td><%= rs.getString("cus_phone")%></td>
                        <td><%= rs.getString("ord_type")%></td>
                        <td><%= rs.getString("ord_pay")%></td>
                        <td><%= rs.getString("ord_total")%></td>
                        <td>
                            <a class="btn btn-outline-primary btnView" href="/orderDetail/<%= rs.getString("ord_id")%>" style="font-weight: bold; font-size: 25px; display: none">View</a>
                            <c:choose>
                                <c:when test="${sessionScope.phone!=null}">
                                    <a class="btn btn-outline-success btnTakeOrder" href="/employee/EtakeOrder/<%= rs.getString("ord_id")%>" style="font-weight: bold; font-size: 25px">Take Order</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="btn btn-outline-success btnTakeOrder" href="/employee/Elogin" style="font-weight: bold; font-size: 25px">Take Order</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>   
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="btn-pagination" id="pagination">
                <button id="prevButton">
                    <i class='bx bx-left-arrow-alt'></i>
                </button>
                <button id="nextButton">
                    <i class='bx bx-right-arrow-alt'></i>
                </button>
            </div>  

        </div>
        <%@include file="/EmployeePage/Efooter.jsp" %>
    </body>
    <script>
        // Pagination

        const itemList = document.getElementById('itemList');
        const prevButton = document.getElementById('prevButton');
        const nextButton = document.getElementById('nextButton');
        const rows = itemList.querySelectorAll('tr');

        const rowsPerPage = 5;
        let currentPage = 1;

        function showPage(pageNumber) {
            rows.forEach((row, index) => {
                if (index >= (pageNumber - 1) * rowsPerPage && index < pageNumber * rowsPerPage) {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        showPage(currentPage);

        prevButton.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        });

        nextButton.addEventListener('click', () => {
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        });

        // Add event listener to change the button color when clicked
        document.querySelectorAll('.btnTakeOrder').forEach(button => {
            button.addEventListener('click', function () {
                this.style.backgroundColor = 'red';
            });
        });

        // AJAX search order by ID
        document.querySelector('.searchButton button').addEventListener('click', function () {
            const searchValue = document.querySelector('.searchText input').value;

            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Update itemList element
                    document.getElementById('itemList').innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "/employee/searchByOrderId?orderId=" + searchValue, true);
            xhttp.send();
        });
    </script>
</html>
