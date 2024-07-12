<%@page import="java.sql.ResultSet"%>
<%@page import="Edao.CustomerDAO"%>
<%@page import="Emodel.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/EmployeePage/css/EcustomerInfo.css">
    </head>

    <body>
        <%@include file="/EmployeePage/Eheader.jsp" %>
        <%
            Customer customerInfo = (Customer) request.getAttribute("customerInfo");
        %>
        <div class="container-fluid" style="min-height: 155vh; padding-top: 90px;">
            <div class="title mx-auto my-5" style="color: white;">Customer Information</div>
            <div class="customer-info mx-auto p-4 d-flex flex-column justify-content-center" style="border: none">
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items">Name</div>
                    <div class="info-value"><%= customerInfo.getName()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items">Phone</div>
                    <div class="info-value"><%= customerInfo.getPhone()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items">Email</div>
                    <div class="info-value"><%= customerInfo.getEmail()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items">Address</div>
                    <div class="info-value" style="height: 12.5625rem; justify-content: start;">
                        <%= customerInfo.getAddress()%>
                    </div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items">Birthday</div>
                    <div class="info-value"><%= customerInfo.getBirthday()%></div>
                </div>
                <div class="d-flex justify-content-between mb-2">
                    <div class="info-items">Rejected Count</div>
                    <div class="info-value"><%= customerInfo.getCancel_count()%></div>
                </div>
            </div>

            <div class="title mx-auto my-5" style="color: white;">Orders</div>
            <div class="history-order w-75 mx-auto">
                <table class="table table-bordered" border="1">
                    <thead class="table-header">

                        <tr align="center">
                            <th scope="col" style="color: white;">Order ID</th>
                            <th scope="col" style="color: white;">Status</th>
                            <th scope="col" style="color: white;">Date</th>
                        </tr>
                    </thead>
                    <tbody class="table-body">
                        <%
                            ResultSet order = (ResultSet) request.getAttribute("order");
                            String orderDetailId = request.getAttribute("orderDetailId") + "";
                            while (order.next()) {
                        %>
                        <tr  align="center">
                            <td><%= order.getString("ord_id")%></td>
                            <td>
                                <%= order.getString("ord_status")%>
                            </td>
                            <td><%= order.getString("ord_date")%></td>
                        </tr>    
                        <%}%>
                    </tbody>
                </table>
            </div>

            <div class="btnBack mx-auto my-5">
                <a href="/EorderDetail/<%= orderDetailId%>">
                    <button style="color: black;">Back</button>
                </a>
            </div>
        </div>
        <%@include file="/EmployeePage/Efooter.jsp" %>
    </body>

</html>
