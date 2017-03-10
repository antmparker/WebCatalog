<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<title>Update Inventory Product ID #<%= request.getParameter("productID") %>
</title>
<link rel="stylesheet" href="styles.css" type="text/css">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">
</head>

<body>
<html>
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
        <h1> Update Inventory <%= request.getParameter("productID") %>
        </h1>
        <form method="post" action="updateProductSubmit.jsp">
            <input type="hidden" name="productID" value="<%= request.getParameter("productID") %>">
            Car Name: <input type="text" name="name" value="<%= request.getParameter("name") %>"><br>
            Category:
            <select name="category">
                <option value="Luxury">Luxury Car</option>
                <option value="Sports">Sports Car</option>
                <option value="Midsize">Midsize/Large Car</option>
                <option value="Compact">Compact Car</option>
            </select> <br>
            Year: <input type="text" name="year" value="<%= request.getParameter("year") %>"><br>
            Price: <input type="text" name="price" value="<%= request.getParameter("price") %>"><br>
            Spec: <input type="text" name="spec" value="<%= request.getParameter("spec") %>"><br>
            Photo: <input type="text" name="photo" value="<%= request.getParameter("photo")%> "><br>

            <input type="submit" value="Update">
            <input type="reset" value="Reset Form">
        </form>

</body>
</html>