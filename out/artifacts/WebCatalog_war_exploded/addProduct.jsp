<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<h1>Invetory Updated</h1>

Name: <%= request.getParameter("name")%> <br>
Category: <%= request.getParameter("category")%><br>
Price: <%= request.getParameter("price")%><br>
Year: <%= request.getParameter("year")%><br>
Specs: <%= request.getParameter("spec")%><br>
Photo: <%= request.getParameter("photo")%><br>
Thank you for regisering.
<%
    //you need this for JDBC with MySQL in version 5
    //even though youre not supposed to
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/store",
            "jdbc",
            "java1234");
    Statement statement = connection.createStatement();
    int result = statement.executeUpdate(
            "INSERT INTO inventory " + "(name, category, price, year, photo, spec)" +
                    " VALUES ('" + request.getParameter("name") + "','" +
                    request.getParameter("category") + "','" +
                    request.getParameter("price") + "','" +
                    request.getParameter("year") + "','" +
                    request.getParameter("photo") + "','" +
                    request.getParameter("spec") +"');");
    //cleaning up so as to not leave dangling connections close connections after checking for result
    if (statement != null) {
        statement.close();
    }
    if (connection != null) {
        connection.close();
    }
%>
</body>
</html>
