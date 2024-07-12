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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="css/employeeDetail.css">
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
                        Employee Details
                        <div class="order-id">
                            Phone: ${phoneEmp}
                        </div>
                    </div>

                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Employee Details Information -->
                <ul class="employee-details-info">
                    <li>
                        <h2>Employee Information</h2>
                        <hr>
                        <p>Name: ${infoEmp.name}</p>
                        <p>Phone: ${infoEmp.phone}</p>
                        <p>Email: ${infoEmp.email}</p>
                        <p>Address: ${infoEmp.address}</p>
                        <p>Birthday: ${birthday}</p>
                        <p>Order Served: ${infoEmp.order_served}</p>
                        <p>Account Status: ${infoEmp.emp_status}</p>
                        <p>Account Creation Date: ${dateCreate}</p>
                    </li>
                    <li>
                        <h2>History Order Served</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Status</th>
                                    <th>Date Order</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="h" items="${requestScope.historyOrderSer}">
                                    <tr>
                                        <td><a href="MorderDetails?bid=${h.getOrd_id()}">${h.getOrd_id()}</a></td>
                                            <c:choose>
                                                <c:when test="${h.getOrd_status() eq 'Cancelled' || h.getOrd_status() eq 'Rejected'}">
                                                <td style="color: #C21010;">${h.getOrd_status()}</td>
                                            </c:when>
                                            <c:when test="${h.getOrd_status() eq 'Waiting' || h.getOrd_status() eq 'Preparing'}">
                                                <td style="color: #0397d1;">${h.getOrd_status()}</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td style="color: #1ec708;">${h.getOrd_status()}</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${h.getOrd_date()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </li>
                </ul>
                <div class="btn-detail">
                    <div class="btn-create-acc">
                        <button type="submit" onclick="createAcc()">
                            Create Account
                        </button>
                    </div>
                    <div class="btn-delete-cus">
                        <c:choose>
                            <c:when test="${statusAcc ne 'Deleted'}">
                                <button type="submit" onclick="confirmDeleteEmp('${phoneEmp}')">
                                    Delete
                                </button>
                            </c:when>
                        </c:choose>

                    </div>
                </div>


            </main>
            <!-- End of Main Content -->



        </div>
    </body>
    <script>
        function createAcc() {
            window.location = "McreateAccount";
        }

        function confirmDeleteEmp(phone) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'Do you really want to delete this employee?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng xác nhận xóa
                    window.location = "deleteEmployee?bid=" + phone;
                }
            });
        }
    </script>

</html>