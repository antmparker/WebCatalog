<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Registered Students</title>
</head>
<body class="viewAll">
<%
    //you need this for JDBC with MySQL in version 5
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/store", //database address
            "jdbc", // username
            "java1234"); //user password
    Statement statement = connection.createStatement();
    ResultSet resultset = statement.executeQuery("SELECT productID, name, category, " +
            "year, price, photo, spec FROM inventory ORDER BY price");
%>

<table BORDER="1"> <%--creating a table for the query--%>
    <tr>
        <th>ID</th>
        <th>Name</th>
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
        <td class="button">
            <form method="post" action="updateForm.jsp">
                <input type="hidden" name="id" value="<%= resultset.getString("productID") %>">
                <input type="hidden" name="name" value="<%= resultset.getString("name") %>">
                <input type="hidden" name="class" value="<%= resultset.getString("category") %>">
                <input type="hidden" name="email" value=" <%= resultset.getString("year") %>">
                <input type="hidden" name="phone" value="<%= resultset.getString("price") %>">
                <input type="hidden" name="phone" value="<%= resultset.getString("photo") %>">
                <input type="hidden" name="phone" value="<%= resultset.getString("spec") %>">
                <input type="submit" value="Update">
            </form>
        </td>
        <td class="button">
            <form action="deleteSubmit.jsp" method="post">
                <input type="hidden" name="id" value="<%= resultset.getString("id") %>">
                <input type="submit" value="Delete">
            </form>
        </td>

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
