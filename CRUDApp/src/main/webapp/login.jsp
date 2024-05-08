<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="css/login_styles.css">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h2>Admin Login</h2>
            <form action="login" method="post">
                <label>Username:</label><br>
                <input type="text" name="username" required><br>
                <label>Password:</label><br>
                <input type="password" name="password" required><br>
                <button type="submit">Login</button>
            </form>
            <p>Don't have an account? <a href="register.jsp">Create New Account</a></p>
        </div>
    </div>
</body>
</html>
