<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

    HttpSession httpSession = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
       
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CRUD Application</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <h1>Simple Employee Management Application</h1>
       
        
        <div class="btn-container">
            <button class="btn" onclick="openForm()">Add Employee</button>
        </div>
    </div>
    
    <div style="display: flex; justify-content: center; align-items: center; ">
    <h2>Employee Records</h2>
    <br>
    <br>
    <div id="message"></div>
	</div>

    
    <div class="form-popup" id="addForm">
        <form class="form-container" action="create" method="post">
            <h2>Add Employee</h2>
            <input type="text" placeholder="Name" name="name" required>
            <input type="email" placeholder="Email" name="email" required>
            <input type="text" placeholder="Position" name="position" required>
            <input type="number" placeholder="Salary" name="salary" required>
            <button type="submit">Add</button>
            <button type="button" onclick="closeForm()">Close</button>
        </form>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Position</th>
            <th>Salary (Rs)</th>
            <th>Action</th>
        </tr>
        <%@ page import="java.sql.*" %>
        <%@ page import="com.crudapp.servlets.*" %>
        <% 
            try {
               
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_db", "root", "");
                
               
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM employees");
                
               
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String position = rs.getString("position");
                    double salary = rs.getDouble("salary");
        %>
                    <tr id="row-<%= id %>">
                        <td class="editable" data-field="id"><%= id %></td>
                        <td class="editable" data-field="name" onclick="enableEditing(this)"><%= name %></td>
                        <td class="editable" data-field="email" onclick="enableEditing(this)"><%= email %></td>
                        <td class="editable" data-field="position" onclick="enableEditing(this)"><%= position %></td>
                        <td class="editable" data-field="salary" onclick="enableEditing(this)"><%= salary %></td>
                        <td>
                        
                        <div class="button-container">
    						<button type="button" onclick="updateRecord(<%= id %>)">Update</button>
    						<div id="message"></div>
    						<form action="delete" method="post" onsubmit="return confirm('Are you sure you want to delete this record?')">
        						<input type="hidden" name="id" value="<%= id %>">
        					<button type="submit">Delete</button>
    					</form>
    						
						</div>
						
                        </td>
                    </tr>
        <% 
                }
                
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    
    <script src="js/script.js"></script>
    
</body>
</html>
