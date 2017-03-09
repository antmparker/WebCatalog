<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<head>
    <title>Inventory</title>
</head>
<body>
<%

    //you need this for JDBC with MySQL in version 5
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/store", //database address
            "jdbc", // username
            "java1234"); //user password
    Statement statement = connection.createStatement();
    ResultSet resultset = statement.executeQuery("SELECT category \n" +
            "FROM inventory " +
            "WHERE category= " +
            "WHERE category='" + resultset.getParameter("Luxury") + "'\n");
%>

<table BORDER="1"> <%--creating a table for the query--%>
    <tr>
        <th>Category</th>
        <th>Year</th>
        <th>Price</th>
        <th>Photo</th>
        <th>Spec</th>
        <th colspan="2">Edit</th>
    </tr>
        <% while(resultset != null && resultset.next()){ %>
    <TR>

        <td> <%= resultset.getString("category") %></td>

    </TR>
        <% }
  //close connections after checking for result
    if (resultset != null) {
      resultset.close();
    }
    if (statement != null) {
      statement.close();
    }
    if (connection != null) {
      connection.close();
    }
  %>

</body>
</html>
