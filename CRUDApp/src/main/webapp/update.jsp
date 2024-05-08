<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
</head>
<body>
    <h2>Update Employee</h2>
    <form action="update" method="post">
    	<label>ID:</label><br>
        <input type="text" name="id" value="${param.id}"><br>
        <label>Name:</label><br>
        <input type="text" name="name" value="${param.name}" required><br>
        <label>Email:</label><br>
        <input type="email" name="email" value="${param.email}" required><br>
        <label>Position:</label><br>
        <input type="text" name="position" value="${param.position}" required><br>
        <label>Salary:</label><br>
        <input type="number" name="salary" min="0" step="0.01" value="${param.salary}" required><br><br>
        <button type="submit">Update</button>
    </form>
</body>
</html>
<div class="container">
        <h1>CRUD Application</h1>
        <div class="btn-container">
            <a href="create.jsp" class="btn">Create Employee</a>
            <a href="read.jsp" class="btn">View Employees</a>
            <a href="update.jsp" class="btn">Update Employee</a>
            <a href="delete.jsp" class="btn">Delete Employee</a>
        </div>
    </div>