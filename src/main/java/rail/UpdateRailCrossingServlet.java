package rail;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
* Servlet implementation class UpdateRailCrossingServlet
*/
@WebServlet("/UpdateRailCrossingServlet")
public class UpdateRailCrossingServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

 /**
 * @see HttpServlet#HttpServlet()
 */
 public UpdateRailCrossingServlet() {
 super();
 // TODO Auto-generated constructor stub
 }
/**
* @see HttpServlet#doGet(HttpServletRequest request,
HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse
response) throws ServletException, IOException {
// TODO Auto-generated method stub
response.getWriter().append("Served at:").append(request.getContextPath());
}
/**
* @see HttpServlet#doPost(HttpServletRequest request,
HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse
response) throws ServletException, IOException {
// TODO Auto-generated method stub
doGet(request, response);
String name = request.getParameter("Name");
 String address = request.getParameter("Address");
 String landmark = request.getParameter("Landmark");
 String trainSchedule = request.getParameter("Trainschedule");
 String personInCharge = request.getParameter("pname");
 String status = request.getParameter("status");
 // Database connection parameters
 String jdbcUrl = "jdbc:mysql://localhost:3306/railway";
 String dbUser = "root";
 String dbPassword = "Ammu21703";
 try {
 // Load the MySQL JDBC driver
 Class.forName("com.mysql.jdbc.Driver");

 // Establish a database connection
 Connection connection =
DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
 // Prepare the SQL update statement
 String updateQuery = "UPDATE railway.adminhome SET Name=?, Address=?, Landmark=?, Trainschedule=?, pname=?, status=? WHEREid=?";
 PreparedStatement preparedStatement =
connection.prepareStatement(updateQuery);
 preparedStatement.setString(1, name);
 preparedStatement.setString(2, address);
 preparedStatement.setString(3, landmark);
 preparedStatement.setString(4, trainSchedule);
 preparedStatement.setString(5, personInCharge);
 preparedStatement.setString(6, status);
 preparedStatement.setInt(7,
Integer.parseInt(request.getParameter("id"))); // Assuming you have 'id' in your form

 // Execute the update
 int updatedRows = preparedStatement.executeUpdate();
 // Close the database connection
 preparedStatement.close();
 connection.close();
 // Redirect to a success page or display a message
 if (updatedRows > 0) {
 response.sendRedirect("success.jsp"); // Redirect to a success page
 } else {
 response.sendRedirect("error.jsp"); // Redirect to an error page
 }
 } catch (Exception e) {
 e.printStackTrace();
 // Handle database errors or exceptions here
 response.sendRedirect("error.jsp"); // Redirect to an error page
 }
 }
}