<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Registration</title>
    <link rel="stylesheet" type="text/css" href="css/login_styles.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Admin Registration</h2>
            <form action="register" method="post">
                <label>Username:</label><br>
                <input type="text" name="username" required><br>
                <label>ID Number:</label><br>
                <input type="text" name="idNumber" required><br>
                <label>Email:</label><br>
                <input type="email" name="email" required><br>
                <label>Password:</label><br>
                <input type="password" name="password" required><br>
                <label>Retype Password:</label><br>
                <input type="password" name="retypePassword" required><br>
                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>
</html>
