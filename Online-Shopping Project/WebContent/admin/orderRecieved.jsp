<%@page import="com.onlline.demo.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../Css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>
<%
String msg=request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%} %>
<%if("delivered".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
<%} %>
<%if("delivered".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>

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
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
        <%
          
        try{
        	Connection con=ConnectionProvider.getCon();
    		Statement stmt=con.createStatement();
    		ResultSet res=stmt.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing' ");
    		while(res.next())
    		{
    			
    			%>
    		   
    	  <tr>
          <td><%=res.getString(10)%></td>
            <td><%=res.getString(17)%></td>
            <td><%=res.getString(3)%></td>
            <td><i class="fa fa-inr"><%=res.getString(5)%></i>  </td>
                <td><%=res.getString(6)%></td>
               <td><%=res.getString(7)%></td>
                <td><%=res.getString(8)%></td>
                 <td><%=res.getString(9)%></td>
             <td><%=res.getString(11)%></td>
              <td><%=res.getString(12)%></td>
               <td><%=res.getString(13)%></td>
               <td><%=res.getString(14)%></td>
               <td><%=res.getString(15)%></td>
               <td><a href="cancelOrdersAction.jsp?id=<%=res.getString(2)%>&email=<%=res.getString(1)%>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="deliveredOrdersAction.jsp?id=<%=res.getString(2)%>&email=<%=res.getString(1)%>">Delivered <i class='fas fa-dolly'></i></i></a></td>
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