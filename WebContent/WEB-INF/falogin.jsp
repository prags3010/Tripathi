
<html>
<body>
<h2 align="center"> Validating User Name and Password </h2>
 
<%
  String str1=request.getParameter("t1");
  String str2=request.getParameter("t2");
 
  if(str1.equalsIgnoreCase("admin") && str2.equals("1234"))
  {
    out.println("<h3>Thankyou, you are VALID</h3>");    
  }
  else
  {
    out.println("<h3>Sorry, you are INVALID</h3>");    
  }
%>
 
</body>
</html>