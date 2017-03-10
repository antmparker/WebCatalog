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
    <title>Inventory</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">
</head>
<body>
<%

    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/store", //database address
            "jdbc", // username
            "java1234"); //user password
    Statement statement = connection.createStatement();
    ResultSet resultset = statement.executeQuery("SELECT productID, name, category, " +
            "year, price, photo, spec FROM inventory ORDER BY price");
%>
<head>
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: white;
        }

        li {
            float: left;
        }

        li a {
            display: inline-block;
            color: lightblue;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            color: darkblue;
        }


    </style>

</head>
<body>
<ul>
    <div class="nav">
        <li><a href="HomePage.html">Home</a></li>
<li><a href="addProduct.html">Add Car</a> </li>

    </div><br>
</ul>
<h1>C and A New Car Sales Web Catalog</h1>
<h2> 0 </h2>
<table BORDER="1"> <%--creating a table for the query--%>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Year</th>
        <th>Price</th>
        <th>Spec</th>
        <th>Photo</th>
        <th colspan="2">Edit</th>
    </tr>
        <% while(resultset != null && resultset.next()){ %>
    <TR>
        <td> <%= resultset.getString("productID") %></td>
        <td> <%= resultset.getString("name") %></td>
        <td> <%= resultset.getString("category") %></td>
        <td> <%= resultset.getString("year") %></td>
        <td> <%= resultset.getString("price") %></td>
        <td> <%= resultset.getString("spec") %></td>
        <td> <img src="<%= resultset.getString("photo") %>"></td>
        <td class="button">
            <form method="post" action="updateProduct.jsp">
                <input type="hidden" name="productID" value="<%= resultset.getString("productID") %>">
                <input type="hidden" name="name" value="<%= resultset.getString("name") %>">
                <input type="hidden" name="category" value="<%= resultset.getString("category") %>">
                <input type="hidden" name="year" value=" <%= resultset.getString("year") %>">
                <input type="hidden" name="price" value="<%= resultset.getString("price") %>">
                <input type="hidden" name="photo" value="<%= resultset.getString("photo") %>">
                <input type="submit" value="Update">
            </form>
        </td>
        <td class="button">
            <form action="deleteProduct.jsp" method="post">
                <input type="hidden" name="productID" value="<%= resultset.getString("productID") %>">
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
