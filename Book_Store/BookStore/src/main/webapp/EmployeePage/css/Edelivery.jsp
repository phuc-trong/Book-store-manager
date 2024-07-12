<%@page import="java.sql.ResultSet"%>
<%@page import="dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Delivery List</title>
    </head>
    <body>
        <h1>Delivery List</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Customer Phone</th>
                    <th>Address</th>
                    <th>Status</th>
                    <th>Update Status</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${deliveryList}">
                <tr>
                    <td>${order.ord_id}</td>
                    <td>${order.cus_name}</td>
                    <td>${order.cus_phone}</td>
                    <td>${order.address}</td>
                    <td>${order.status}</td>
                    <td><a href="/employee/EupdateDeliveryStatus/${order.ord_id}">Update Status</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>