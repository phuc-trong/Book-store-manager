

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
        <link href="css/ChistoryDetail.css" rel="stylesheet" type="text/css"/>
        <title>BookStore - Order Detail</title>
    </head>

    <body>
        <%@include file="Cheader.jsp"%>
        <div style="margin-top: 160px" ></div>
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main id="main">
                <div class="header">
                    <div class="name-tittle">
                        Order Information
                    </div>
                </div>
                <!-- Orders Book Information Table -->

                <!-- End of Book Order Information Orders -->
                <div class="history-order row">
                    <div class="col-md-8">
                        <div class="orders-table">
                            <h2 style="font-weight: 600; text-align: center;" class="order-list">Order Details</h2>
                            <table>
                                <thead  style="text-align: center">
                                    <tr >
                                        <th>Book</th>
                                        <th>Unit Price</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="o" items="${requestScope.orders}">
                                        <tr>
                                            <!--                                            <td class="book-info">
                                            
                                                                                            <img src="" alt="">
                                            
                                                                                        </td>-->
                                            <!-- liên kết với book detail -->
                                            <td>${o.getBookName()}</td>
                                            <td>${o.getPrice()}$</td>
                                            <td>${o.getQuantity()}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="total-order">Total Order: ${order.getTotal()}$</div>
                        </div>
                    </div>
                    <div style="height: 340px; background-color: #c7c6c6;" class="col-md-4 order-info">
                        <h2 style="font-weight: 600; padding-bottom: 10px; text-align: center;" class="customer-info">
                            Invoice Information</h2>
                        <hr>
                        <span>
                            <p><span class="bold-numbers">Order ID: </span>  ${order.getId()}</p>
                            <p><span class="bold-numbers">Order Status: </span>  ${order.getStatus()} </p>
                            <p><span class="bold-numbers">Payment Methods: </span>  ${order.getPay()} </p>
                            <p><span class="bold-numbers">Order Date: </span> ${order.getOrderDate()} </p>
                            <p><span class="bold-numbers">Address: </span>${cus.getAddress()} </p>
                            <p><span class="bold-numbers">Note: </span> ${order.getNote()}</p>
                        </span>
                    </div>
                </div> 
                <c:choose>
                    <c:when test="${order.getStatus() eq 'Waiting'&&order.getPay() eq 'Banking'}">
                        <div style="display: flex;">
                            <div style="width: 450px; padding: 20px; background-color: #c2c2c2; margin-top: 20px; border-radius: 5px;">
                                <p style="margin-top: 5px; font-size: 20px; font-weight: 500;">Please pay to proceed with the order
                                </p><p style="font-size: 20px; font-weight: 500;" >(If you have already paid, please skip)</p>
                                <p style="font-size: 20px; font-weight: 500;">Scan the QR code below:</p>
                                <img style="width: 200px; margin-top: 20px;" src="../img/qrcode.jpg" alt="">
                            </div>

                            <div class="cancel-order">
                                <button onclick="cancelOrder('${order.getId()}')">Cancel Order</button>
                            </div>
                        </div>
                    </c:when>

                    <c:when test="${order.getStatus() eq 'Waiting'}">
                        <div style="display: flex;">
                            <div  class="cancel-order">
                                <button style="margin:0" onclick="cancelOrder('${order.getId()}')">Cancel Order</button>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>              


            </main>
            <!-- End of Main Content -->



        </div>
    </body>
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


                                    window.addEventListener('load', function () {
                                        // Gọi hàm updateHistory() sau khi trang đã tải hoàn toàn.
                                        checkForChanges();
                                    });
                                    function checkForChanges() {
                                        $.ajax({
                                            url: '/customer/updateHistoryDetail',
                                            type: 'GET',
                                            data: {
                                                id: '${order.getId()}'
                                            },
                                            success: function (data) {
                                                // Xử lý dữ liệu trả về từ API endpoint

                                                // Cập nhật trang "history.jsp" nếu có thay đổi
                                                document.getElementById("main").innerHTML = data;
                                            },
                                            complete: function () {
                                                // Thiết lập một khoảng thời gian cho việc kiểm tra lại (đặt thời gian tùy ý)
                                                setTimeout(checkForChanges, 5000); // Ví dụ: kiểm tra lại sau mỗi 5 giây
                                            }
                                        });
                                    }

    </script>
</html>