<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link href="css/Chistory.css" rel="stylesheet" type="text/css"/>
        <title>BookStore - Order History</title>
    </head>

    <body>
        <%@include file="Cheader.jsp"%>
        <div style="margin-top: 160px" ></div>
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <div class="header">


                    <div class="name-tittle">
                        Order History
                    </div>

                </div>
                <!-- Book Management Table -->
                <div class="orders-table">

                    <div id="tableContainer">
                        <table>
                            <thead>
                                <tr style="text-align: center">
                                    <th data-filter="orderId" onclick="sortTable(0)">Order ID</th>
                                    <th data-filter="status" onclick="sortTable(1)">Status</th>
                                    <th data-filter="dateOrder" onclick="sortTable(2)">Date Order</th>
                                    <th data-filter="paymentMethods" onclick="sortTable(4)">Payment Methods</th>
                                    <th data-filter="total" onclick="sortTable(5)">Total</th>
                                    <th data-filter="details"></th>
                                </tr>
                            </thead>

                            <tbody id="itemList">
                                <c:forEach var="o" items="${requestScope.orders}">
                                    <tr>
                                        <td>${o.getId()}</td>
                                        <td class="status">
                                            <c:choose>
                                                <c:when test="${o.getStatus() eq 'Cancelled' || o.getStatus() eq 'Rejected'}"> <!-- Access 'status' property instead of 'getStatus()' -->
                                                    <div style="color: #C21010;" class="status">${o.status}</div>
                                                </c:when>
                                                <c:when test="${o.getStatus() eq 'Waiting' || o.getStatus() eq 'Preparing'}"> <!-- Access 'status' property instead of 'getStatus()' -->
                                                    <div style="color: #0397d1;" class="status">${o.getStatus()}</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div style="color: #1ec708;" class="status">${o.getStatus()}</div>
                                                </c:otherwise>
                                            </c:choose></td>
                                        <td>${o.getOrderDate()}</td> <!-- Access 'orderDate' property instead of 'getOrderDate()' -->
                                        <td>${o.getPay()}</td>
                                        <td>${o.getTotal()}$</td>
                                        <td>
                                            <button onclick="viewOrder('${o.getId()}')">
                                                View
                                            </button>
                                            <c:choose>
                                                <c:when test="${o.getStatus() eq 'Waiting'}">
                                                    <button onclick="cancelOrder('${o.getId()}')">Cancel</button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

                    </div>
                </div>
                <!-- End of Book Management Orders -->

            </main>
            <!-- End of Main Content -->



        </div>
        <%@include file="Cfooter.jsp"%>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                                                        function cancelOrder(id) {
                                                            $.ajax({
                                                                url: "/customer/cancelOrder",
                                                                type: "get",
                                                                data: {
                                                                    id: id
                                                                },
                                                                success: function (data) {
                                                                    location.reload();
                                                                },
                                                                error: function (xhr) {
                                                                    Swal.fire({
                                                                        icon: 'error',
                                                                        text: 'The order is processing'
                                                                    });
                                                                }
                                                            });
                                                        }
                                                        function viewOrder(id) {
                                                            window.location = "/customer/ChistoryDetail?id=" + id
                                                        }

                                                        window.addEventListener('load', function () {
                                                            // Gọi hàm updateHistory() sau khi trang đã tải hoàn toàn.
                                                            checkForChanges();
                                                        });
                                                        function checkForChanges() {
                                                            $.ajax({
                                                                url: '/customer/CupdateHistory',
                                                                type: 'GET',

                                                                success: function (data) {
                                                                    // Xử lý dữ liệu trả về từ API endpoint

                                                                    // Cập nhật trang "history.jsp" nếu có thay đổi
                                                                    document.getElementById("itemList").innerHTML = data;

                                                                },
                                                                complete: function () {
                                                                    // Thiết lập một khoảng thời gian cho việc kiểm tra lại (đặt thời gian tùy ý)
                                                                    setTimeout(checkForChanges, 5000); // Ví dụ: kiểm tra lại sau mỗi 5 giây
                                                                }
                                                            });
                                                        }

                                                        window.addEventListener("pageshow", function (event) {
                                                            var historyTraversal = event.persisted ||
                                                                    (typeof window.performance != "undefined" &&
                                                                            window.performance.navigation.type === 2);
                                                            if (historyTraversal) {
                                                                // Khi người dùng trở lại từ trang chi tiết, làm mới trang giỏ hàng.
                                                                location.reload();
                                                            }
                                                        });

        </script>
    </body>

</html>