<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

      .button-container {
    display: flex;
    justify-content: space-around; 
}

.button-container button {
    padding: 8px 16px;
    border: none;
    cursor: pointer;
    background-color: #007bff;
    color: #fff;
    border-radius: 4px;
}

.button-container button:hover {
    background-color: #0056b3;
}

.button-container button[type="submit"] {
    background-color: #dc3545;
}

.button-container button[type="submit"]:hover {
    background-color: #bd2130;
}



        .form-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #f2f2f2;
            padding: 20px;
            border: 1px solid #ccc;
            z-index: 1;
        }

        .form-container {
            max-width: 300px;
            text-align: center;
        }

        .form-container input[type=text],
        .form-container input[type=email],
        .form-container input[type=number] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container button {
            background-color: #007bff;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function enableEditing(cell) {
            var input = document.createElement('input');
            input.type = 'text';
            input.value = cell.innerText.trim();
            input.style.width = '100%';
            input.style.border = 'none';
            input.style.padding = '6px';
            input.style.boxSizing = 'border-box';
            cell.innerHTML = '';
            cell.appendChild(input);
            input.focus();

            input.addEventListener('blur', function() {
                cell.innerText = input.value;
            });

            input.addEventListener('keydown', function(event) {
                if (event.key === 'Enter') {
                    cell.innerText = input.value;
                }
            });
        }

        function updateRecord(id) {
            var row = document.getElementById('row-' + id);
            var form = document.createElement('form');
            form.setAttribute('method', 'POST');
            form.setAttribute('action', 'update'); 

            var data = {};
            data.id = id;

            var cells = row.querySelectorAll('.editable');
            cells.forEach(function(cell) {
                var fieldName = cell.getAttribute('data-field');
                var input = document.createElement('input');
                input.setAttribute('type', 'hidden');
                input.setAttribute('name', fieldName);
                input.setAttribute('value', cell.innerText.trim());
                form.appendChild(input);
                data[fieldName] = cell.innerText.trim();
            });

            var csrfTokenInput = document.querySelector('input[name=_csrf]');
            if (csrfTokenInput) {
                var csrfToken = csrfTokenInput.value;
                var csrfInput = document.createElement('input');
                csrfInput.setAttribute('type', 'hidden');
                csrfInput.setAttribute('name', '_csrf');
                csrfInput.setAttribute('value', csrfToken);
                form.appendChild(csrfInput);
            }

            document.body.appendChild(form);
            form.submit();
        }

        function openForm() {
            document.getElementById("addForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("addForm").style.display = "none";
        }
    </script>
</head>
<body>
    <h2>Employee Records</h2>
    
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
            <th>Salary</th>
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
    						<button onclick="openForm()">Add Employee</button>
    						<button type="button" onclick="updateRecord(<%= id %>)">Update</button>
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
</body>
</html>
