<%@page import="Emodel.Employee"%>
<%@page import="Edao.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="/EmployeePage/css/EupdateProfile.css">
        <style>

        </style>
    </head>
    <body>
        <%
            String phone = (String) session.getAttribute("phone");
            EmployeeDAO empDAO = new EmployeeDAO();
            Employee empInfo = empDAO.searchByPhone(phone);
        %>
        <%@include file="/EmployeePage/Eheader.jsp" %>
        <div class="container-fluid" style="min-height: 125vh; padding-top: 90px;">
            <div class="title mx-auto my-5" style="color: white;">Employee Information</div>
            <form action="/employee" method="post" onsubmit="return validateForm()">
                <div class="customer-info mx-auto p-4  d-flex flex-column justify-content-center" style="border: none">
                    <div class="d-flex">
                        <div class="info-items m-3 ">Phone</div>
                        <div class="info-value m-3 "><input  type="text" name="txtPhone" value="<%= empInfo.getPhone()%>" readonly></div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3 ">Name</div>
                        <div class="info-value m-3 "><input  type="text" name="txtName" value="<%= empInfo.getName()%>"></div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3 ">Email</div>
                        <div class="info-value m-3 "><input  type="text" name="txtEmail" value="<%= empInfo.getEmail()%>"></div>
                    </div>

                    <div class="d-flex">
                        <div class="info-items m-3 ">Address</div>
                        <div class="info-value m-3 " style="height: 12.5625rem;">
                            <textarea style="height: 200px; text-align: left" type="text"  name="txtAddress" value="<%= empInfo.getAddress()%>"><%= empInfo.getAddress()%></textarea>
                        </div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3 ">Birthday</div>
                        <div class="info-value m-3 "><input type="date"  name="txtBirthday" value="<%= empInfo.getBirthday()%>"></div>
                    </div>
                    <div class="d-flex">
                        <div class="info-items m-3 ">Create Date</div>
                        <div class="info-value m-3 "><input type="date"  name="txtCreateDay" value="<%= empInfo.getCreate()%>"></div>
                    </div>
                    <%
                        try {
                            String result = (String) request.getAttribute("result");
                            if (!result.equals("")) {
                    %>
                    <div class="d-flex justify-content-center result p-2  mx-auto" style="font-size: larger; font-weight: bold"><%=result%></div>
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>
                </div>

                <div class="btnBack mx-auto my-5 d-flex">
                    <button type="submit" value="Update" name="btnUpdateProfile" style="color: black;">Update</button>
                    <a href="/employee/EorderList" class="align-items-center d-flex justify-content-center ms-2" style="color: black;">Order List</a>
                </div>

            </form>

        </div>
        <%@include file="/EmployeePage/Efooter.jsp" %>
        <script>

            function validateForm() {
                const nameInput = document.getElementsByName("txtName")[0];
                const emailInput = document.getElementsByName("txtEmail")[0];
                const addressInput = document.getElementsByName("txtAddress")[0];
                const birthdayInput = document.getElementsByName("txtBirthday")[0];
                const createDateInput = document.getElementsByName("txtCreateDay")[0];
                const nameRegex = /^[a-zA-Z\s]+$/;
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                const maxAddressLength = 50;
                var error = ""
                if (!nameRegex.test(nameInput.value.trim())) {
                    error += 'Name must contain letters and spaces.\n';
                }

                if (!emailRegex.test(emailInput.value.trim())) {
                    error += 'Please enter a valid email format.\n';
                }

                if (addressInput.value.trim() === '' || addressInput.value.trim().length > maxAddressLength) {
                    error += 'Address must not be empty and must not exceed 50 characters.\n';
                }

                const today = new Date().toISOString().slice(0, 10);
                if (new Date(birthdayInput.value) > new Date(today)) {
                    error += 'Birthday must be a date in the past.\n';
                }

                if (new Date(createDateInput.value) > new Date(today)) {
                    error += 'Create date must be a date in the past.\n';
                }

                if (error !== "") {
                    alert(error);
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
