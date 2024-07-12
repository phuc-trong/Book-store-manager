<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.all.min.js"></script>
        <link rel="stylesheet" href="css/bookDetail.css">
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
                        Book Details
                        <div class="book-id">
                            Book ID: ${infoBook.id}
                        </div>
                    </div>
                    <div class="user-info">
                        <p>Hey, <b><%= request.getSession().getAttribute("username")%></b></p>

                        <small class="text-muted">Admin</small>
                    </div>
                </div>
                <!-- Book Detail -->
                <div class="main-book-details">
                    <div class="book-detail">
                        <div class="book-img">
                            <img src="${infoBook.img}" alt="">
                        </div>
                        <div class="book-edit">
                            <p>${infoBook.name}</p>
                            <p><span class="bold-numbers">Sale Price: </span> ${infoBook.getRealPrice()}$</p>
                            <button type="submit" onclick="updateBook('${infoBook.id}')">Update</button>
                            <button type="submit" onclick="confirmDeleteBook('${infoBook.id}')">
                                Delete
                            </button>
                        </div>
                    </div>
                    <div class="book-info-detail">
                        <h2>Book Information</h2>
                        <hr>
                        <p><span class="bold-numbers">Book ID:</span> ${infoBook.id}</p>
                        <p><span class="bold-numbers">Book Name:</span> ${infoBook.name}</p>
                        <p><span class="bold-numbers">Category Name:</span> ${infoBook.caterogyName}</p>
                        <p><span class="bold-numbers">Historical Cost: </span> ${infoBook.price}$</p>
                        <p><span class="bold-numbers">Sale:</span> ${infoBook.sale}%</p>
                        <p><span class="bold-numbers">Description:</span> ${infoBook.description}</p>
                        <p><span class="bold-numbers">Status:</span> ${infoBook.status}</p>
                        <p><span class="bold-numbers">Total Order:</span> ${infoBook.numOrder}</p>
                    </div>
                </div>

                <div class="btn-add-product">
                    <button type="submit" onclick="addBook()">
                        Add Book
                    </button>
                </div>
                <!-- End Book Detail -->
                <!-- List Menu -->

                <div class="list-menu row">
                    <c:forEach var="s" items="${requestScope.suggestList}">
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

                <!-- End List Menu -->
            </main>
            <!-- End of Main Content -->



        </div>
    </body>
    <script>
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
        function addBook() {
            window.location = "MaddBook";
        }
    </script>
</html>