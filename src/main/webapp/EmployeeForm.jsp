
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.demo7.SaveDataServlet" %>

<%@ include file="Header.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Student Information Form</h2>

    <form action="SaveDataServlet" method="post" onsubmit="return validateForm()">
        <div class="mb-3">
            <label for="employeeName" class="form-label">Student Name:</label>
            <input type="text" class="form-control" id="employeeName" name="employeeName" required>
            <div id="employeeNameError" class="text-danger"></div>
        </div>

        <div class="mb-3">
            <label for="departmentName" class="form-label">Department Name:</label>
            <input type="text" class="form-control" id="departmentName" name="departmentName" required>
            <div id="departmentNameError" class="text-danger"></div>
        </div>

        <div class="mb-3">
            <label for="addressType" class="form-label">Student Address Type:</label>
            <select class="form-select" id="addressType" name="addressType" required>
                <option value="permanent">Permanent</option>
                <option value="temporary">Temporary</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="address" class="form-label">Student Address:</label>
            <input type="text" class="form-control" id="address" name="address" required>
            <div id="addressError" class="text-danger"></div>
        </div>

        <div class="mb-3">
            <label for="NO" class="form-label">Student NO:</label>
            <input type="number" class="form-control" id="NO" name="NO" required>
            <div id="NOError" class="text-danger"></div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="SearchPage.jsp" class="btn btn-warning">Search Student</a>
    </form>

    <div class="mt-3">
        <%
            // Retrieve the session attribute
            String message = (String) session.getAttribute("message");

            // Check if the message is not null and not empty
            if (message != null && !message.isEmpty()) {
        %>
        <div class="alert alert-info" role="alert">
            <%= message %>
        </div>
        <%
                // Clear the session attribute after displaying the message
                session.removeAttribute("message");
            }
        %>
    </div>
</div>

<script>
    function validateForm() {
        var isValid = true;

        // Reset error messages
        document.getElementById("employeeNameError").innerHTML = "";
        document.getElementById("departmentNameError").innerHTML = "";
        document.getElementById("addressError").innerHTML = "";
        document.getElementById("NOError").innerHTML = "";

        // Validate employeeName
        var employeeName = document.getElementById("employeeName").value;
        if (employeeName.trim() === "") {
            document.getElementById("employeeNameError").innerHTML = "Name is required.";
            isValid = false;
        }

        // Validate departmentName
        var departmentName = document.getElementById("departmentName").value;
        if (departmentName.trim() === "") {
            document.getElementById("departmentNameError").innerHTML = "Department Name is required.";
            isValid = false;
        }

        // Validate address
        var address = document.getElementById("address").value;
        if (address.trim() === "") {
            document.getElementById("addressError").innerHTML = "Address is required.";
            isValid = false;
        }

        // Validate salary
        var NO = document.getElementById("NO").value;
        if (isNaN(NO) || parseFloat(NO) <= 0) {
            document.getElementById("NOError").innerHTML = "NO must be a positive number.";
            isValid = false;
        }

        return isValid;
    }
</script>

</body>
</html>



