<%@page import="com.onlline.demo.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../CSS/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Cancel Orders <i class='fas fa-window-close'></i></div>
<table id="customers">

          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
          </tr>
       <%
       try{
    	   Connection con=ConnectionProvider.getCon();
   		   Statement stmt=con.createStatement();
   		   ResultSet res=stmt.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Cancel'");
   		   while(res.next())
   		   {
       %> 
       
          <tr>
          <td><%=res.getString(10) %></td>
            <td><%=res.getString(17) %></td>
            <td><%=res.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=res.getString(5) %>  </td>
            <td><%=res.getString(6) %></td>
             <td><%=res.getString(7) %></td>
               <td><%=res.getString(8) %></td>
                <td><%=res.getString(9) %></td>
                 <td><%=res.getString(11) %></td>
             <td><%=res.getString(12) %></td>
              <td><%=res.getString(13) %></td>
               <td><%=res.getString(14) %></td>
               <td><%=res.getString(15) %></td>
               </tr>
 <%
 }
 }
 catch(Exception e)
       {
	 
       }
 %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>