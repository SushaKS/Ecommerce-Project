<%@page import="com.onlline.demo.ConnectionProvider"%>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="CSS/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Security Question</h3>
 <select class="input-style" name="securityQuestion">
 <option value="What was your first Car">What was your first Car?</option>
 <option value="What is the name of your first pet">What is the name of your first pet?</option>
 <option value="What elementary school did you attend?">What elementary school did you attend?</option>
 <option value="What  is the name of the town where you were born">What  is the name of the town where you were born?</option>
   
</select> 
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" palceholder="Enter Your New Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter password(for security)" required>

<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>