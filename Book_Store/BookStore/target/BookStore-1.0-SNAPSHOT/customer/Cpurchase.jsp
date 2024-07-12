

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <link href="css/Cpurchase.css" rel="stylesheet" type="text/css"/>
        <title>BookStore - Purchase</title>
    </head>

    <body>
        <%@include file="Cheader.jsp" %>
        <div style="margin-top: 100px" ></div>
        <div class="container">


            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>

                <!-- Add Book Table -->
                <div style="text-align: center; margin-bottom: 20px; margin-left: 10%;">
                    <img src="../img/order1.jpg" alt=""/>
                </div>
                <div class="acc-info">
                    <div class="left-info">
                        <ul>
                            <h3 style="font-weight: 600; margin-bottom: 30px; text-align: center;">Customer Information</h2>
                                <li><label>Your Name: *</label><input type="text" name="name"  readonly value="${customer.getName()}"></li>
                                <li><label>Your Phone: *</label><input type="text" name="number"  readonly value="${customer.getPhone()}"></li>
                                <li><label>Address: *</label>
                                    <textarea style="resize:none" cols="30" rows="3" readonly>${customer.getAddress()}</textarea>
                                </li>
                                <li>
                                    <label>Shipping Method:</label>
                                    <input style=" margin-left: 30px;" name="a" type="radio" id="delivery"  checked
                                           value="Delivery">
                                    <label style="font-weight: 400; color: black;" for="delivery">Delivery</label><br>
                                    <input style=" margin-left: 192px;" name="a" type="radio" id="delivery"
                                           value="At Store">
                                    <label style="font-weight: 400; color: black;" for="pickup">Pickup At Store</label><br>
                                </li>
                                <li><label>Purchase Method:</label>
                                    <select  id="pay">
                                        <option value="COD">Cash On Delivery</option>
                                        <option value="Banking">Online Banking</option>
                                    </select>
                                </li>
                                <li><label>Note:</label>
                                    <textarea  style="resize:none" cols="30" rows="3" id="note" value=""></textarea>
                                </li>

                        </ul>
                    </div>
                    <div class="right-info">
                        <div class="orders-table">
                            <h3 style="text-align: center; font-weight: 600; margin-bottom: 20px;">Order Details</h2>
                                <table>
                                    <thead style="font-size: 15px;" >
                                        <tr style="text-align: center" >
                                            <th colspan="2">Book</th>
                                            <th>Unit Price</th>
                                            <th>Quantity</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="f" items="${requestScope.carts}">
                                            <tr>
                                                <td class="book-info">
                                                    <img src="${f.getBook().getImg()}" alt="">
                                                </td>
                                                <td style="font-size: 20px;"><a href="#">${f.getBook().getName()}</a></td>
                                                <td>${f.getBook().getRealPrice()}$</td>
                                                <td>${f.getQuantity()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <p style="margin-left: 20px; margin-top: 20px; font-size: 18px;">Provisional costs: ${total}$</p>
                                <hr>
                                <h4 style="font-weight: 600; margin-top: 20px; color: #C21010; ">Total Order:${total}$</h4>
                        </div>
                        <div class="btn-product">
                            <div class="btn-add-product">
                                <button onclick="order()">
                                    Order Now
                                </button>
                            </div>
                            <!-- Chuyển đến trang gio hàng -->
                            <div class="btn-cancel-product">
                                <button onclick="cart()" >
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </main>

            <!-- End of Main Content -->
        </div>
    </body>

    <script>
        function cart() {
            window.location = "/customer/Ccart";
        }
        function order() {
            var note = document.getElementById("note").value;
            var delivery = document.getElementById("delivery").value;
            var pay = document.getElementById("pay").value;
            var total = ${total};
            window.location = "/customer/finishOrder?note=" + note + "&delivery=" + delivery + "&pay=" + pay + "&total=" + total;
        }
    </script>
</html>

