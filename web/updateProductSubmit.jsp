<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>

    <title>Update Confirmed <%= request.getParameter("name") %>
    </title>
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">

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

    int result = statement.executeUpdate("UPDATE inventory\n" +
            "SET\n" +
            "name='" + request.getParameter("name") + "',\n" +
            "category='" + request.getParameter("category") + "',\n" +
            "year='" + request.getParameter("year") + "',\n" +
            "price='" + request.getParameter("price") + "',\n" +
            "spec='" + request.getParameter("spec") + "',\n" +
            "photo='" + request.getParameter("photo") + "'\n" +
            "WHERE productID='" + request.getParameter("productID") + "'\n");

%>


<h1> Update Confirmed <%= request.getParameter("productID") %>
</h1>
<%= request.getParameter("name") %><br>
<%= request.getParameter("category") %><br>
<%= request.getParameter("year") %><br>
<%= request.getParameter("price") %><br>
<%= request.getParameter("spec") %><br>
<%= request.getParameter("photo") %><br>

<p>
    <a href="#" onclick="window.history.back()">&leftarrow; Change Update</a>
</p>
<p>
    <a href="showAllProd.jsp">&leftarrow; Back to index</a>
</p>
</body>
</html>