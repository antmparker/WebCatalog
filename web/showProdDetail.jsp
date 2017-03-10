
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<head>
    <title>Product Details</title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">
</head>

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
        <li><a href="showAllProdUser.jsp">View ALL CARS</a></li>
    </div>

</ul>
<h1>C and A New Car Sales Web Catalog</h1>
<h2> 0 </h2>
<table BORDER="1"> <%--creating a table for the query--%>
    <tr>
        <th>Product ID</th>
        <th>Car Make/Model</th>
        <th>Style</th>
        <th>Year</th>
        <th>Price</th>
        <th colspan="2">Specs</th>
    </tr>
        <% while(resultset != null && resultset.next()){ %>
    <TR>

        <td><%= resultset.getString("productID") %>
        </td>
        <td><%= resultset.getString("name") %>
        </td>
        <td><%= resultset.getString("category") %>
        </td>
        <td><%= resultset.getString("year") %>
        </td>
        <td><%= resultset.getString("price") %>
        </td>
        <td><%= resultset.getString("spec") %>
        </td>
        <td><img src="<%= resultset.getString("photo") %>"></td>

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
