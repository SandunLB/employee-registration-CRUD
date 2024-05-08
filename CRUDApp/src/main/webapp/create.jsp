<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Employee</title>
</head>
<body>
    <h2>Create Employee</h2>
    <form action="create" method="post">
        <label>Name:</label><br>
        <input type="text" name="name" required><br>
        <label>Email:</label><br>
        <input type="email" name="email" required><br>
        <label>Position:</label><br>
        <input type="text" name="position" required><br>
        <label>Salary:</label><br>
        <input type="number" name="salary" min="0" step="0.01" required><br>
        <button type="submit">Create</button>
    </form>
</body>
</html>
