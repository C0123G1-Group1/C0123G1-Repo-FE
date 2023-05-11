<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 5/12/2023
  Time: 12:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User Management</h1>
<h2>
    <a href="/accessory">List All Users</a>
</h2>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/accessory">List All Users</a>
    </h2>
</center>
<div align="center">
    <form action="/accessory?action=edit" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <input type="hidden" name="id" value="${product.getId()}"/>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="${product.getName()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Product Type:</th>
                <td>
                    <select name="productType" id="">
                        <option value="1">Phone</option>
                        <option value="2">Accessory</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Describe:</th>
                <td>
                    <input type="text" name="describe" size="45"
                           value="${product.getDescribe()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td>
                    <input type="text" name="price" size="45"
                           value="${product.getPrice()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Image:</th>
                <td>
                    <input type="text" name="productImage" size="15"
                           value="${product.getProductImage()}"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
