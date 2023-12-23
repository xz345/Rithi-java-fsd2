<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADMIN HOME</title>
</head>
<body>
<h2>Welcome to Admin Home</h2>

<!-- Add button/link to navigate to the 'add.jsp' page for adding new records -->
<a href="addrail.jsp">Add New Record</a>

<table border="1" width="100%">
<tr>
<th>Sr.No</th>
<th>Name</th>
<th>Address</th>
<th>Landmark</th>
<th>Time Schedule</th>
<th>Person In-Charge</th>
<th>Status</th>
<th>Action</th>
</tr>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/railway" user="root"
password="Ammu@1703" />
<sql:query dataSource="${snapshot}" var="result"> SELECT * FROM `railway`.`adminhome`</sql:query><c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.id}" /></td>
<td><c:out value="${row.Name}" /></td>
<td><c:out value="${row.Address}" /></td>
<td><c:out value="${row.Landmark}" /></td>
<td><c:out value="${row.Trainschedule}" /></td>
<td><c:out value="${row.pname}" /></td>
<td><c:out value="${row.status}" /></td>
<td>
 

/>">Update</a>

/>">Delete</a>
 
<a href="update.jsp?id=<c:out value="${row.id}"
/>">Update</a>

<a href="delete.jsp?id=<c:out value="${row.id}"
/>">Delete</a>
</td>
 
</tr>
</c:forEach>
</table>
</body>
</html>
    