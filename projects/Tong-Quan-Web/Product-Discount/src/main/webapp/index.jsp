<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
</head>
<body>
    <h1>Product Discount</h1>
    <form method="post" action="/discount">
        <input type="text" name="product" placeholder="Enter Name Product"/>
        <span>Product Description</span><br/>
        <input type="number" name="price" placeholder="Enter Price"/>
        <span>List Price</span><br/>
        <input type="number" name="discount" placeholder="Enter Discount"/>
        <span>Discount Percent</span><br/>
        <input type="submit" name="submit" value="Calculate Discount"/>
    </form>
</body>
</html>