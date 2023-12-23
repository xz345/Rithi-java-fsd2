<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
title>Update Railway Crossing</title>
<style>
body {
text-align: center;
 
}
h2 {

}
 


color: #333;
 
form {
margin-top: 20px;
}
table {
margin: 0 auto;
 
}
td {

}
 


padding: 5px;
 
input[type="text"], input[type="time"], input[type="radio"] {
padding: 5px; border-radius: 4px;
 
border: 1px solid #ccc;
}
input[type="submit"] { padding: 5px 10px; background-color: #f2f2f2; border-radius: 4px; border: none;
cursor: pointer;
}
input[type="submit"]:hover { background-color: #ddd;
}
</style>
</head>
<body>
<h2>Update Railway Crossing</h2>
<form action="UpdateRailCrossingServlet" method="POST">
<table>
<tr>
<td>Name:</td>
<td><input type="text" name="Name" value="<%= request.getAttribute("Name") %>" required></td>
</tr>
<tr>
<td>Address:</td>
<td><input type="text" name="Address" value="<%= request.getAttribute("Address") %>" required></td>
</tr>
<tr>
<td>Landmark:</td>
<td><input type="text" name="Landmark" value="<%= request.getAttribute("Landmark") %>" required></td>
</tr>
<tr>
<td>Time Schedule:</td>
<td><input type="time" name="Trainschedule" value="<%= request.getAttribute("Trainschedule") %>" required></td>
</tr>
<tr>
<td>Person In-Charge:</td>
<td><input type="text" name="pname" value="<%= request.getAttribute("pname") %>" required></td>
</tr>
<tr>
<td>Status:</td>
<td>
<input type="radio" name="status" value="open" required
<%= ("open".equals(request.getAttribute("status")) ? "checked" : "") %>> open
<input type="radio" name="status" value="closed" required <%= ("closed".equals(request.getAttribute("status")) ? "checked" : "") %>> closed
</td>
</tr>
<tr>
<td><input type="submit" value="Update Crossing"></td>
</tr>
</table>
</form>
</body>
</html>
