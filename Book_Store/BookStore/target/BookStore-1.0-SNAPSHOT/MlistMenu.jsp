<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="css/listMenu.css">
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
                        Menu
                    </div>
                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Best Seller -->
                <h2>Best Seller</h2>
                <div class="list-menu row">
                    <c:forEach var="s" items="${requestScope.bestSeller}">
                        <div class="best-seller col-md-3">
                            <a href="MbookDetails?bid=${s.id}">
                                <img src="${s.img}" alt="">
                                <div class="name-book">
                                    <p>
                                        <c:choose>
                                            <c:when test="${fn:length(s.name) > 14}">
                                                ${fn:substring(s.name, 0, 14)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${s.name}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </a>
                            <div class="book-info">
                                <hr>
                                <c:choose>
                                    <c:when test="${s.status eq 'Sold Out'}">
                                        <div class="price-section">
                                            <p style="color: #888">Price:</p>
                                            <c:if test="${s.sale ne 0}">
                                                <p class="original-price">${s.price}$</p>
                                            </c:if>
                                            <p  style="color: #888" class="discounted-price">${s.getRealPrice()}$</p>
                                        </div>
                                        <p style="color: #888">Status: ${s.status}</p>
                                        <p style="color: #888">Total Order: ${s.numOrder}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="price-section">
                                            <p>Price:</p>
                                            <c:if test="${s.sale ne 0}">
                                                <p class="original-price">${s.price}$</p>
                                            </c:if>
                                            <p class="discounted-price">${s.getRealPrice()}$</p>
                                        </div>
                                        <p>Status: ${s.status}</p>
                                        <p>Total Order: ${s.numOrder}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="book-btn">
                                <button type="submit" onclick="updateBook('${s.id}')">Update</button>
                                <button type="submit" onclick="confirmDeleteBook('${s.id}')">
                                    Delete
                                </button>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- End Best Seller -->
                <!-- List Book -->
                <h2>List Book</h2>
                <div class="search-main">
                    <div class="search-container">
                        <input type="text" class="search-box" id="searchInput" placeholder="Search Name Book...">
                    </div>
                    <div class="filter"> 
                        <label>Category filter: </label>
                        <select class="select-box">
                            <option value="All" selected>All</option>
                            <option value="CAT001">Children books</option>
                            <option value="CAT002">Comic</option>
                            <option value="CAT003">Textbook</option>
                            <option value="CAT004">Psychology books</option>
                            <option value="CAT005">Fables</option>
                            <option value="CAT006">Novel</option>
                            <option value="CAT007">Combo</option>

                        </select>

                    </div>
                </div>
                <div class="list-menu row" id="bookList">
                    <c:forEach var="m" items="${requestScope.menu}">
                        <div class="book col-md-3">
                            <a href="MbookDetails?bid=${m.id}">
                                <img  src="${m.img}" alt="">
                                <div class="name-book">
                                    <p>
                                        <c:choose>
                                            <c:when test="${fn:length(m.name) > 14}">
                                                ${fn:substring(m.name, 0, 14)}...
                                            </c:when>
                                            <c:otherwise>
                                                ${m.name}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </a>

                            <div class="book-info">
                                <hr>


                                <c:choose>
                                    <c:when test="${m.status eq 'Sold Out'}">
                                        <div class="price-section">
                                            <p style="color: #888">Price:</p>
                                            <c:if test="${m.sale ne 0}">
                                                <p class="original-price">${m.price}$</p>
                                            </c:if>
                                            <p  style="color: #888" class="discounted-price">${m.getRealPrice()}$</p>
                                        </div>
                                        <p style="color: #888">Status: ${m.status}</p>
                                        <p style="color: #888">Total Order: ${m.numOrder}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="price-section">
                                            <p>Price:</p>
                                            <c:if test="${m.sale ne 0}">
                                                <p class="original-price">${m.price}$</p>
                                            </c:if>
                                            <p class="discounted-price">${m.getRealPrice()}$</p>
                                        </div>
                                        <p>Status: ${m.status}</p>
                                        <p>Total Order: ${m.numOrder}</p>
                                    </c:otherwise>
                                </c:choose>


                            </div>
                            <div class="book-btn">
                                <button type="submit" onclick="updateBook('${m.id}')">Update</button>
                                <button type="submit" onclick="confirmDeleteBook('${m.id}')">
                                    Delete
                                </button>
                            </div>
                            <div class="categoryId" style="display: none;">
                                <p>${m.categoryId}</p>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="not-found" style="display: none;">
                    <p>Not found !</p>
                </div>
                <!-- End List Book -->
            </main>

        </div>
        <!-- End of Main Content -->
    </body>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const bookItems = document.querySelectorAll('.book');
            const searchInput = document.getElementById('searchInput');
            const selectBox = document.querySelector('.select-box');
            const notFoundMessage = document.querySelector('.not-found');

            // Lưu trữ danh sách ban đầu
            const originalBookList = Array.from(bookItems);

            selectBox.addEventListener('change', function () {
                const selectedCategory = selectBox.value;
                const searchTerm = searchInput.value.toLowerCase();

                originalBookList.forEach(bookItem => {
                    const categoryId = bookItem.querySelector('.categoryId').textContent.trim();
                    const nameBook = bookItem.querySelector('.name-book p').textContent.toLowerCase();

                    if (
                            (selectedCategory === 'All' || categoryId === selectedCategory) &&
                            (nameBook.includes(searchTerm))
                            ) {
                        bookItem.style.display = '';
                    } else {
                        bookItem.style.display = 'none';
                    }
                });

                const resultsFound = originalBookList.some(bookItem => {
                    return bookItem.style.display !== 'none';
                });

                if (resultsFound) {
                    notFoundMessage.style.display = 'none';
                } else {
                    notFoundMessage.style.display = '';
                }
            });

            searchInput.addEventListener('input', function () {
                const searchTerm = searchInput.value.toLowerCase();
                const selectedCategory = selectBox.value;

                originalBookList.forEach(bookItem => {
                    const categoryId = bookItem.querySelector('.categoryId').textContent.trim();
                    const nameBook = bookItem.querySelector('.name-book p').textContent.toLowerCase();

                    if (
                            (selectedCategory === 'All' || categoryId === selectedCategory) &&
                            (nameBook.includes(searchTerm))
                            ) {
                        bookItem.style.display = '';
                    } else {
                        bookItem.style.display = 'none';
                    }
                });

                const resultsFound = originalBookList.some(bookItem => {
                    return bookItem.style.display !== 'none';
                });

                if (resultsFound) {
                    notFoundMessage.style.display = 'none';
                } else {
                    notFoundMessage.style.display = '';
                }
            });
        });

        function confirmDeleteBook(bookId) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'Do you really want to delete this book?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng xác nhận xóa
                    window.location = "MdeleteBook?bid=" + bookId;
                }
            });
        }

        function updateBook(bookId) {
            window.location = "MupdateBook?bid=" + bookId;
        }
    </script>
</html>