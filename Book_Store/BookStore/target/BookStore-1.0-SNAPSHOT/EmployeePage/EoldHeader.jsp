<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="/EmployeePage/css/Eheader.css" rel="stylesheet" type="text/css"/>
        <style>
            .profileBox {
                display: none;
                position: absolute;
                top: 100px;
                right: 100px;
                width: 160px;
                background: #fff;
                padding: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                border-radius: 5px;
                & a {
                    text-decoration: none;
                    color: rgb(83, 83, 83);
                    font-weight: bold;
                    font-family: Arial, Helvetica, sans-serif;
                }

                & a:hover {
                    color: black;
                }

                & a:last-child{
                    color: rgb(255, 79, 79);
                }

                & a:last-child:hover{
                    color: rgb(255, 0, 0);
                }
            }


            .profileBox.show {
                display: block;
            }

        </style>
    </head>
    <body>
        <div class="container-fluid m-0 p-0">
            <div class="header d-flex justify-content-around my-0 align-items-center">
                <div class="brand d-flex align-items-center">
                    <div class="logo">
                        <a href="/employee/EorderList"><img src="/img/logo.png" alt="Logo Book Store"/></a> 
                    </div>

                    <div class="name">
                        <div>Book</div>
                        <div>Store</div>
                    </div>
                </div>
                <%
                    boolean OrderList = Boolean.parseBoolean(request.getParameter("isOrderList"));
                    pageContext.setAttribute("OrderList", OrderList);
                %>


                <div class="flex-fill d-flex justify-content-center">
                    <c:if test="${OrderList}">
                        <div class="search d-flex mx-1">
                            <div class="searchText">
                                <input name="orderId" type="text" placeholder="Search Order By ID">
                            </div>
                            <div class="searchButton" >
                                <button>Search</button>
                            </div>
                        </div>    
                    </c:if>
                    
                    <c:choose>
                    <c:when test="${sessionScope.phone!=null}">
                        <a href="/employee/EorderList" class="btn btn-outline-danger mx-1">Order List</a>
                    </c:when>
                    <c:otherwise>
                       <a href="/employee/Elogin" class="btn btn-outline-danger mx-1">Order List</a>
                    </c:otherwise>
                </c:choose>
                       <a href="/employee/EnewOrderList" class="btn btn-outline-danger mx-1">New Order</a>
                </div>
                <div class="profile d-flex align-items-center">
                    <div class="iconAvatar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="54" height="54" viewBox="0 0 54 54" fill="none">
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M36 20.25C36 22.6369 35.0518 24.9261 33.364 26.614C31.6761 28.3018 29.3869 29.25 27 29.25C24.6131 29.25 22.3239 28.3018 20.636 26.614C18.9482 24.9261 18 22.6369 18 20.25C18 17.8631 18.9482 15.5739 20.636 13.886C22.3239 12.1982 24.6131 11.25 27 11.25C29.3869 11.25 31.6761 12.1982 33.364 13.886C35.0518 15.5739 36 17.8631 36 20.25ZM31.5 20.25C31.5 21.4435 31.0259 22.5881 30.182 23.432C29.3381 24.2759 28.1935 24.75 27 24.75C25.8065 24.75 24.6619 24.2759 23.818 23.432C22.9741 22.5881 22.5 21.4435 22.5 20.25C22.5 19.0565 22.9741 17.9119 23.818 17.068C24.6619 16.2241 25.8065 15.75 27 15.75C28.1935 15.75 29.3381 16.2241 30.182 17.068C31.0259 17.9119 31.5 19.0565 31.5 20.25Z"
                              fill="#C21010" />
                        <path fill-rule="evenodd" clip-rule="evenodd"
                              d="M27 2.25C13.3313 2.25 2.25 13.3313 2.25 27C2.25 40.6688 13.3313 51.75 27 51.75C40.6688 51.75 51.75 40.6688 51.75 27C51.75 13.3313 40.6688 2.25 27 2.25ZM6.75 27C6.75 31.7025 8.35425 36.0315 11.043 39.4695C12.9313 36.9898 15.3673 34.9802 18.1607 33.5977C20.9542 32.2152 24.0294 31.4973 27.1462 31.5C30.2227 31.4971 33.2593 32.1964 36.0246 33.5448C38.7899 34.8931 41.2109 36.8548 43.1032 39.2805C45.0528 36.7236 46.3654 33.7392 46.9325 30.5743C47.4996 27.4094 47.305 24.155 46.3646 21.0802C45.4243 18.0055 43.7652 15.1989 41.5248 12.8926C39.2844 10.5863 36.5271 8.84668 33.4809 7.81765C30.4347 6.78861 27.1872 6.49974 24.0072 6.97494C20.8272 7.45014 17.806 8.67576 15.1937 10.5504C12.5814 12.425 10.4531 14.8947 8.98477 17.7552C7.51646 20.6157 6.75041 23.7847 6.75 27ZM27 47.25C22.3514 47.257 17.8431 45.6578 14.238 42.723C15.6891 40.6457 17.6205 38.9496 19.8679 37.779C22.1154 36.6085 24.6123 35.9982 27.1462 36C29.6486 35.998 32.1153 36.593 34.3416 37.7357C36.5678 38.8784 38.4893 40.5357 39.9465 42.57C36.3134 45.6001 31.7308 47.2566 27 47.25Z"
                              fill="#C21010" />
                        </svg>
                    </div>
                    <%
                        String name = request.getSession().getAttribute("phone") + "";
                        if (name.equals("") || name.equals("null")) {
                    %>
                    <div class="nameAccount">
                        <a href="#">My Account</a>
                        <div class="profileBox" id="profileBox">
                            <a href="/employee/Elogin"><div>Login</div></a>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="nameAccount">
                        <a href="#">${sessionScope.fullname}</a>
                    </div>
                    <div class="profileBox" id="profileBox" name="profile">
                        <a href="/employee/EupdateProfile" name="updateProfile" >Update Profile</a>
                        <a href="/employee/EchangePassword" name="updateProfile" >Change Password</a>
                        <a href="/employee/Elogout"><div>Logout</div></a>
                    </div>
                    <%}%>

                </div>
            </div>

        </div>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const profileIcon = document.querySelector('.iconAvatar');
            const profileBox = document.querySelector('.profileBox');

            profileIcon.addEventListener('click', function () {
                profileBox.classList.toggle('show');
            });
        });
    </script>
</html>
