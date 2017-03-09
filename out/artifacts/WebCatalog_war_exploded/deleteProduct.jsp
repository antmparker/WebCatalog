<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Delete Customer</title>
    <link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<%
    //you need this for JDBC with MySQL in version 5
    //even though you're not supposed to
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/store",
            "jdbc",
            "java1234");
    Statement statement = connection.createStatement();
    int result = statement.executeUpdate(
            "DELETE FROM inventory\n" +
                    "WHERE productID='" +
                    request.getParameter("productID") +
                    "'");
%>
<h1>Car Deleted</h1>
The Car (ID=<%= request.getParameter("productID") %>)
was deleted from the database.
<p>
    <a href="showAllProd.jsp">&leftarrow; Back to inventory list</a>
</p>
</body>
</html>