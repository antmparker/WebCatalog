<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<head>
    <title>Product Details</title>
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
    ResultSet resultset = statement.executeQuery("SELECT DISTINCT productID, name, category, year, price, photo, spec \n" +
            "FROM inventory " +
            "WHERE productID='" + request.getParameter("productID") + "'\n");
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

        <td> <%= resultset.getString("productID") %></td>
        <td> <%= resultset.getString("name") %></td>
        <td> <%= resultset.getString("category") %></td>
        <td> <%= resultset.getString("year") %></td>
        <td> <%= resultset.getString("price") %></td>
        <td> <%= resultset.getString("photo") %></td>
        <td> <%= resultset.getString("spec") %></td>

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
