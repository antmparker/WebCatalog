<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 3/8/17
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Inventory Item #<%= request.getParameter("productID") %></title>
    <link rel="stylesheet" href="styles.css" type="text/css">
</head>

<body>

<h1> Update Inventory <%= request.getParameter("productID") %> </h1>
<form method="post" action="updateProductSubmit.jsp">
    <input type="hidden" name="productID" value="<%= request.getParameter("productID") %>">
    Car Name: <input type="text" name="name" value="<%= request.getParameter("name") %>"><br>
    Category: <input type="text" name="category" value="<%= request.getParameter("category") %>"><br>
    Year: <input type="text" name="year" value="<%= request.getParameter("year") %>"><br>
    Price: <input type="text" name="price" value="<%= request.getParameter("price") %>"><br>
    Spec: <input type="text" name="spec" value="<%= request.getParameter("spec") %>"><br>
    Photo: <input type="text" name="photo" value="<%= request.getParameter("photo")%> "><br>

    <input type="submit" value="Update">
    <input type="reset" value="Reset Form">
</form>

</body>
</html>