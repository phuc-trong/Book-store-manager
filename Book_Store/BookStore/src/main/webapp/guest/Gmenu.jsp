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
        <link href="css/Gmenu.css" rel="stylesheet" type="text/css"/>
        <title>BookStore - Menu</title>
    </head>

    <body>
        <%@include file="Gheader.jsp"%>
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
        <div class="container">
            <!-- Sidebar -->

            <!-- End of Sidebar -->
            <!-- Main Content -->
            <main>

                <!-- Best Seller -->
                <div class="tittle">
                    <img src="../img/Menu.png" alt=""/>
                </div>
                <div class="search-main">
                    <div class="search-container">
                        <input oninput="searchByName(this)" type="text" class="search-box" id="searchInput" placeholder="Search Name...">
                    </div>
                    <div class="filter">
                        <label style="font-weight: 500; font-size: 20px; color: #C21010;">Category filter: </label>

                        <select class="select-box" oninput="searchByCategory(this)" id="select">
                            <option value="" selected>All</option>
                            <c:forEach var="c" items="${requestScope.categories}" >                        
                                <option value="${c.getId()}">${c.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="list-menu row" id="content"> 
                    <c:forEach var="book" items="${requestScope.books}" >
                        <div class="col-md-3">
                            <div class="best-seller">
                                <img src="${book.getImg()}" alt="">
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
                                    <c:choose>
                                        <c:when test="${book.getStatus() eq 'Sold Out'}">
                                            <button style="background-color: grey">Sold Out</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button  onclick="addToCart('0')"><ion-icon style="font-size: 22px;" name="cart"></ion-icon></button>

                                        </c:otherwise>
                                    </c:choose>
                                    <button onclick="viewBook('${book.getId()}')">View</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End List Book -->
            </main>
        </div>
        <%@include file="Gfooter.jsp"%>
        <!-- End of Main Content -->
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                            window.location = "/guest/bookDetail?id=" + id;
                                        }
                                        function addToCart(id) {
                                            Swal.fire({
                                                title: '',
                                                text: "You have to login to add to cart",
                                                icon: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#3085d6',
                                                cancelButtonColor: '#d33',
                                                confirmButtonText: 'Log in now'
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    window.location = "/guest/Glogin";
                                                    f
                                                }
                                            })
                                        }
                                        function searchByName(param) {
                                            var txtSearch = param.value;
                                            document.getElementById('select').value = "";
                                            $.ajax({
                                                url: "/searchName",
                                                type: "get",
                                                data: {
                                                    txt: txtSearch
                                                },
                                                success: function (data) {
                                                    // Đảm bảo rằng bạn sử dụng document.getElementById thay vì document.getElementbyID
                                                    var row = document.getElementById("content");

                                                    // Sử dụng innerHTML để cập nhật nội dung của phần tử "content"
                                                    row.innerHTML = data;

                                                },
                                                error: function (xhr) {
                                                    // Xử lý lỗi ở đây nếu cần
                                                    console.log(error);
                                                }
                                            });
                                        }
                                        function searchByCategory(param) {
                                            var txtSearch = param.value;
                                            document.getElementById('searchInput').value = "";
                                            $.ajax({
                                                url: "/searchCategory",
                                                type: "get",
                                                data: {
                                                    txt: txtSearch
                                                },
                                                success: function (data) {
                                                    // Đảm bảo rằng bạn sử dụng document.getElementById thay vì document.getElementbyID
                                                    var row = document.getElementById("content");

                                                    // Sử dụng innerHTML để cập nhật nội dung của phần tử "content"
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    // Xử lý lỗi ở đây nếu cần
                                                    console.log(error);
                                                }
                                            });
                                        }
    </script>

</html>