<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="css/Chome.css" rel="stylesheet" type="text/css"/>
        <title>Menu</title>
        <style>
            body{
                background-image: url('/img/bgblue (1).jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
                background-attachment: fixed;
            }
        </style>
    </head>

    <body>
        <%@include file="Cheader.jsp"%>
        <div class="banner" style="margin-top:160px">
            <div class="banner-slide">
                <img src="../img/BannerBS.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/banner2.png" alt=""/>
            </div>
            <div class="banner-slide">
                <img src="../img/sale.png" alt=""/>
            </div>
        </div>
        <!-- Best Seller -->
        <div class="best-seller-logo">
            <img src="../img/Left_BestSeller.png" alt=""/>
            <img src="../img/BestSeller_Header.png" alt=""/>
            <img src="../img/Right_BestSeller.png" alt=""/>
        </div>
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>
                <div class="list-menu row">

                    <c:forEach items="${requestScope.topFourSeller}" var="book">
                        <div class="col-md-3">
                            <div class="best-seller ">

                                <div class="best-seller-image abc">
                                    <img src="${book.getImg()}" alt="">
                                </div>
                                <div class="best-seller-image">
                                    <img src="../img/BestSeller_OnFood.png" alt=""/>
                                </div>
                                <div class="name-book">
                                    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

                                    <c:choose>
                                        <c:when test="${fn:length(book.getName()) > 15}">
                                            ${fn:substring(book.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${book.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>
                                <hr>
                                <div class="book-info">
                                    <div class="price-section">
                                        <p>Price:</p>
                                        <c:choose>
                                            <c:when test="${book.getSale() == 0}">
                                                <p class="discounted-price">${book.getRealPrice()}$</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="original-price">${book.getPrice()}$</p>
                                                <p class="discounted-price">${book.getRealPrice()}$</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <p>Units Sold: (15+)</p>
                                </div>
                                <div class="book-btn">
                                    <button onclick="viewBook('${book.getId()}')">View</button>
                                    <c:choose>
                                        <c:when test="${book.getStatus() eq 'Sold Out'}">
                                            <button style="background-color: grey">Sold Out</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="addToCart('${book.getId()}')"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                                </c:otherwise>
                                            </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End Best Seller -->
                <!-- List Book -->
                <div style="text-align: center; margin:50px 0" class="new">
                    <img src="../img/newbook12.jpg" alt=""/>
                </div>
                <div class="list-menu row" id="bookList">
                    <c:forEach items="${requestScope.topFourLatest}" var="book">
                        <div class="col-md-3">
                            <div class="best-seller ">
                                <div class="new-book-img">
                                    <img src="${book.getImg()}" alt="">
                                </div>
                                <div class="new-book">
                                    <c:choose>
                                        <c:when test="${fn:length(book.getName()) > 15}">
                                            ${fn:substring(book.getName(), 0, 15)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${book.getName()}
                                        </c:otherwise>
                                    </c:choose> 
                                </div>
                                <hr>
                                <div class="book-info">
                                    <div class="price-section">
                                        <p>Price:</p>

                                        <c:choose>
                                            <c:when test="${book.getSale() == 0}">

                                                <p class="discounted-price">${book.getRealPrice()}$</p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="original-price">${book.getPrice()}$</p>
                                                <p class="discounted-price">${book.getRealPrice()}$</p>
                                            </c:otherwise>
                                        </c:choose>

                                    </div> <p>Units Sold: (15+)</p>
                                    <!--                                <p>Units Sold: (99+)</p>-->
                                </div>
                                <div class="book-btn">
                                    <button onclick="viewBook('${book.getId()}')">View</button>
                                    <c:choose>
                                        <c:when test="${book.getStatus() eq 'Sold Out'}">
                                            <button style="background-color: grey">Sold Out</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button onclick="addToCart('${book.getId()}')"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>
                                                </c:otherwise>
                                            </c:choose>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End List Book -->
            </main>
        </div>
        <%@include file="Cfooter.jsp"%>

        <!-- End of Main Content -->
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
                                                $(document).ready(function () {
                                                    var currentIndex = 0;
                                                    var slides = $(".banner-slide");

                                                    function showSlide(index) {
                                                        slides.hide();
                                                        slides.eq(index).fadeIn();
                                                    }

                                                    function nextSlide() {
                                                        currentIndex = (currentIndex + 1) % slides.length;
                                                        showSlide(currentIndex);
                                                    }

                                                    showSlide(currentIndex);

                                                    setInterval(nextSlide, 5000);
                                                });

                                                function viewBook(id) {
                                                    window.location = "/customer/bookDetail?id=" + id;
                                                }
                                                function addToCart(id) {
                                                    Swal.fire({
                                                        title: '',
                                                        text: "Add successfully",
                                                        icon: 'success',
                                                    });
                                                    $.ajax({
                                                        url: "/customer/addToCart",
                                                        type: "get",
                                                        data: {
                                                            bookId: id
                                                        },
                                                        success: function (data) {


                                                        },
                                                        error: function (xhr) {
                                                            // Xử lý lỗi ở đây nếu cần
                                                            console.log(error);
                                                        }
                                                    });
                                                }
    </script>

</html>