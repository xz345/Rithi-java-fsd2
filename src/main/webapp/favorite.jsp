<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Favorite page</title>
</head>
<body>
<h2>Favorite Search Results</h2>
<sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"
 
url="jdbc:mysql://localhost:3306/railway" user="root" password="Ammu@1703" />

<sql:query dataSource="${snapshot}" var="result"> SELECT * FROM favorites;
</sql:query>

<table border="1" width="100%">
<tr>
<th>Sr.No</th>
<th>Name</th>
<th>Address</th>
<th>Landmark</th>
<th>Time Schedule</th>
<th>Person In-Charge</th>
<th>Status</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.id}" /></td>
<td><c:out value="${row.Name}" /></td>
<td><c:out value="${row.Address}" /></td>
<td><c:out value="${row.Landmark}" /></td>
<td><c:out value="${row.Trainschedule}" /></td>
<td><c:out value="${row.pname}" /></td>
<td><c:out value="${row.status}" /></td>
</tr>
</c:forEach>
</table>
</body>
</html>
    