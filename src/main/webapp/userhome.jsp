<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Home</title>
<style>
.header {
text-align: center; margin-bottom: 20px;
}
.link {
display: block; margin-bottom: 10px;
}
.box {
border: 1px solid #ccc; padding: 10px;
margin: 10px;
background-color: #f9f9f9;
}
.button-green {
background-color: green; color: white;
border: none; padding: 5px 10px; border-radius: 5px;
}
.button-red {
background-color: red; color: white;
border: none; padding: 5px 10px; border-radius: 5px;
}
</style>
</head>
<body>
<h2>User Home</h2>
<a class="link" href="userhome.jsp">Home</a>
<a class "link" href="search.jsp">Search Crossing</a>
<a class="link" href="favorite.jsp">Favorite Crossing</a>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/railway" user="root" password="Ammu@1703" />
<sql:query dataSource="${snapshot}" var="result"> SELECT * FROM `railway`.`adminhome`;
</sql:query>
<c:forEach var="row" items="${result.rows}">
<div class="box">
<h4>
Name:
<c:out value="${row.Name}" />
 
</h4>
<p>
 Address:
<c:out value="${row.Address}" />

</p>
<p>
Landmark:
<c:out value="${row.Landmark}" />


</p>
<p>

Time Schedule:
<c:out value="${row.Trainschedule}" />

</p>
<p>
Person In-Charge:
<c:out value="${row.pname}" />


</p>
<p>

Status:
<span class="<c:out value="${row.status} == 'open' ? 'button-
 
green' : 'button-red'" />">
<c:out value="${row.status}" />
</span>
</p>
<c:set var="isFavorite" value="false" />
<sql:query dataSource="${snapshot}" var="favorites"> SELECT * FROM favorites WHERE id = '${row.id}';
</sql:query>
<c:if test="${not empty favorites.rows}">
<c:set var="isFavorite" value="true" />
</c:if>
<c:choose>
<c:when test="${isFavorite eq true}">
<form action="RemoveFromFavorite" method="POST">
<input type="hidden" name="id" value="${row.id}" />
<input type="submit" class="button-red" value="Remove
from Favorite" />
</form>
</c:when>
<c:otherwise>
<form action="AddToFavorite" method="POST">
<input type="hidden" name="id" value="${row.id}" />
<input type="submit" class="button-green" value="Add to
Favorite" />
</form>
</c:otherwise>
</c:choose>
</div>
</c:forEach>
<a class="link" href="login.jsp">Logout</a>
</body>
</html>
