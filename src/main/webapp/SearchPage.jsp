
<%@ page import="com.example.demo7.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="Header.jsp" %>


<div class="container mt-4">
    <form action="SearchServlet" method="post" onsubmit="return validateSearchForm()">
        <div class="mb-3">
            <label for="employeeName">Student Name:</label>
            <input type="text" class="form-control" id="employeeName" name="employeeName">
            <div id="employeeNameError" class="text-danger"></div>
        </div>
        <button class="btn btn-primary" type="submit">Search Student</button>
    </form>

    <!-- Display Search Results -->
    <div class="mt-4">
        <h2>Search Results:</h2>

        <%
            List<Employee> employees = (List<Employee>) request.getAttribute("employees");

            if (employees != null && !employees.isEmpty()) {
        %>
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Department</th>
                <th>Student Address Type</th>
                <th>Student Address</th>
                <th>Student NO</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Employee employee : employees) {
            %>
            <tr>
                <td><%= employee.getId() %></td>
                <td><%= employee.getName() %></td>
                <td><%= employee.getDepartmentName() %></td>
                <td><%= employee.getAddressType() %></td>
                <td><%= employee.getAddress() %></td>
                <td><%= employee.getNO() %></td>
                <td>
                    <form action="EditEmployeeServlet" method="post" style="display: inline-block;">
                        <input type="hidden" name="employeeId" value="<%= employee.getId() %>">
                        <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                    </form>
                    <form action="DeleteEmployeeServlet" method="post" style="display: inline-block;">
                        <input type="hidden" name="employeeId" value="<%= employee.getId() %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <p class="mt-3">No employees found.</p>
        <%
            }
        %>
    </div>
</div>

<script>
    function validateSearchForm() {
        var isValid = true;

        // Reset error message
        document.getElementById("employeeNameError").innerHTML = "";

        // Validate employeeName
        var employeeName = document.getElementById("employeeName").value;
        if (employeeName.trim() === "") {
            document.getElementById("employeeNameError").innerHTML = "Name is required.";
            isValid = false;
        }

        return isValid;
    }
</script>

</body>
</html>
