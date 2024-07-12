<%@page import="java.sql.ResultSet"%>
<%@page import="Edao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="/EmployeePage/css/EorderList.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>       
        <style>
            .btn-pagination button {
                font-size: 50px;
                width: 70px;
                border: none;
                color: black;
                background-color: white;
                cursor: pointer;
            }
            #pagination {
                text-align: center;
                margin-top: 10px;
            }
            .search-container {
                display: flex;
                align-items: center;
                margin-bottom: 20px;
                margin-right: 20px;
            }
            .search-c   ontainer input {
                margin-right: 10px;

            }
            .btn-custom i {
                font-size: 1rem;
                vertical-align: middle;
            }
            .search-button {
                background-color: white;
                border: none;
                padding: 10px 10px;
                border-radius: 5px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            .search-button i {
                font-size: 1.2rem;
                margin-right: 5px;

            }

        </style>
    </head>
    <body>
        <jsp:include page="/EmployeePage/Eheader.jsp">
            <jsp:param name="isOrderList" value="${true}"></jsp:param>
        </jsp:include>
        <div class="container-fluid" style="min-height: 100vh; padding-top: 241px;">
            <div class="d-flex justify-content-center">
                <div class="d-flex justify-content-center px-2 py-1 title my-3" style="color: white; background-color: #ff7c7c ">Order List</div>
            </div>

            <%
                String startDate = "";
                String endDate = "";
                try {
                    startDate = request.getAttribute("startDate") + "";
                    endDate = request.getAttribute("endDate") + "";
                } catch (Exception e) {
                }
            %>
            <div class="d-flex justify-content-start mb-2">
                <div class="search-container">
                    <select id="searchCategory" class="form-select" style="width: auto;">
                        <option value="orderId">Order ID</option>
                        <option value="orderDate">Order Date</option>
                    </select>
                    <div id="dateInputs" style="display: none;">
                        <form id="dateSearchForm" action="/employee" method="post">
                            <label for="startDate" style="color: white; font-weight: bold">From: </label>
                            <input type="date" id="startDate" name="startDate">
                            <label for="endDate" style="color: white; font-weight: bold">To: </label>
                            <input type="date" id="endDate" name="endDate">
                            <button type="submit" class="mx-2 search-button" name="btnSearch" value="Search">
                                <i class="fa-solid fa-magnifying-glass nav_acc_glass" style="color: black;"></i>
                            </button>
                        </form>
                    </div>
                    <input type="text" id="searchInput" placeholder="Search by Order ID" class="form-control mx-2">
                    <button id="searchButton" style="background-color: white; color: black; border: none;" type="button" class="btn btn-custom searchButton">
                        <i class="fa-solid fa-magnifying-glass" style="color: black;"></i>
                    </button>
                </div>
            </div>

            <div id="searchResults" class="table-container">
            </div>
            <script>
                document.getElementById("searchCategory").addEventListener("change", function () {
                    var category = this.value;
                    var dateInputs = document.getElementById("dateInputs");
                    var searchInput = document.getElementById("searchInput");
                    var searchButton = document.getElementById("searchButton");

                    if (category === "orderDate") {
                        dateInputs.style.display = "block";
                        searchInput.style.display = "none";
                        searchButton.style.display = "none";
                    } else {
                        dateInputs.style.display = "none";
                        searchInput.style.display = "block";
                        searchButton.style.display = "block";
                    }
                });

                document.querySelector(".searchButton").addEventListener("click", function () {
                    var category = document.getElementById("searchCategory").value;

                    if (category === "orderId") {
                        var searchInput = document.getElementById("searchInput").value;

                        if (searchInput) {
                            // Perform search by order ID (replace this with actual search logic)
                            searchByOrderId(searchInput);
                        } else {
                            alert("Please enter an order ID.");
                        }
                    }
                });

                function searchByOrderId(orderId) {
                    // Mock search result
                    var results = `Searching for order ID: ${orderId}`;
                    displayResults(results);
                }

                function displayResults(results) {
                    var searchResults = document.getElementById("searchResults");
                    searchResults.innerHTML = results;
                }
            </script>

            <div class="table-container">
                <div class="scrollable">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Status</th>
                                <th scope="col">Order Date</th>
                                <th scope="col">Customer Name</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Type</th>
                                <th scope="col">Payment</th>
                                <th scope="col">Total</th>
                                <th scope="col">Detail</th>
                            </tr>
                        </thead>
                        <tbody id="itemList">
                            <%  ResultSet rs = (ResultSet) request.getAttribute("rs");
                                while (rs.next()) {
                            %>
                            <tr>
                                <td><%= rs.getString("ord_id")%></td>
                                <td>
                                    <%
                                        String status = rs.getString("ord_status");
                                        if (status.equals("Preparing")) {
                                    %>
                                    <div class="btn btn-primary"><%= rs.getString("ord_status")%></div>
                                    <%
                                    } else if (status.equals("Completed")) {
                                    %>
                                    <div class="btn btn-success"><%= rs.getString("ord_status")%></div>
                                    <%
                                    } else if (status.equals("Waiting")) {
                                    %>
                                    <div class="btn btn-warning" style="color: white;"><%= rs.getString("ord_status")%></div>
                                    <%
                                    } else if (status.equals("Rejected")) {
                                    %>
                                    <div style="background-color: red; color: white; padding: 5px; border-radius: 5px;"><%= rs.getString("ord_status")%></div>
                                    <%
                                    } else if (status.equals("Cancelled")) {
                                    %>
                                    <div style="background-color: gray; color: white; padding: 5px; border-radius: 5px;"><%= rs.getString("ord_status")%></div>
                                    <%
                                        }
                                    %>
                                </td>
                                <td><%= rs.getString("ord_date")%></td>
                                <td><%= rs.getString("cus_name")%></td>
                                <td><%= rs.getString("cus_phone")%></td>
                                <td><%= rs.getString("ord_type")%></td>
                                <td><%= rs.getString("ord_pay")%></td>
                                <td><%= rs.getString("ord_total")%></td>
                                <td><a class="btn btn-outline-primary btnView" href="/EorderDetail/<%= rs.getString("ord_id")%>" style="color: black;">View</a></td>
                            </tr>   
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn-pagination" id="pagination">
                <button id="prevButton">
                    <i class='bx bx-left-arrow-alt'></i>
                </button>
                <button id="nextButton">
                    <i class='bx bx-right-arrow-alt'></i>
                </button>
            </div>
        </div>
        <%@include file="/EmployeePage/Efooter.jsp" %>
    </body>
    <script>
        // Pagination
        const itemList = document.getElementById('itemList');
        const prevButton = document.getElementById('prevButton');
        const nextButton = document.getElementById('nextButton');
        const rows = itemList.querySelectorAll('tr');
        const rowsPerPage = 5;
        let currentPage = 1;

        function showPage(pageNumber) {
            rows.forEach((row, index) => {
                if (index >= (pageNumber - 1) * rowsPerPage && index < pageNumber * rowsPerPage) {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        showPage(currentPage);

        prevButton.addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        });

        nextButton.addEventListener('click', () => {
            const totalPages = Math.ceil(rows.length / rowsPerPage);
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        });

        // Add event listener to change the button color when clicked
        document.querySelectorAll('.btnView').forEach(button => {
            button.addEventListener('click', function () {
                this.style.backgroundColor = 'red';
            });
        });

// AJAX search order by ID
        document.querySelector('.searchButton').addEventListener('click', function () {
            const searchValue = document.querySelector('#searchInput').value.trim();

            if (searchValue !== '') {
                const xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Replace the table body content with the search results
                        document.getElementById('itemList').innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "/employee/EsearchByOrderId?orderId=" + searchValue, true);
                xhttp.send();
            } else {
                alert("Please enter a valid search term.");
            }
        });

    </script>
</html>
