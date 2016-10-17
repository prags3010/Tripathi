<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("token_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://redvelvetdb.czvyaawmcxuy.ap-south-1.rds.amazonaws.com:3306/";
String dbName = "botdb";
String userId = "awsadmin";
String password = "awsadmin";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">


<head>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
    rel="stylesheet" type="text/css" />
<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
    type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('#lstFruits').multiselect({
            includeSelectAllOption: true
        });
    });
</script>
<form method="post" >

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WhyQ</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="final.jsp">Counter View</a></li>
      <li><a href="final1.jsp">Manager View</a></li>
     
    </ul>
  </div>
</nav>

<table class="flatTable">
  <tr class="titleTr">
    <td class="titleTd">TABLE TITLE</td>
    <td colspan="4"></td>
    <td class="plusTd button"></td>
  </tr>
  <tr class="headingTr">
<td><b>Token No</b></td>
<td><b><select id="ddlCars2" multiple="multiple">
<option value="Accord">Pani Puri</option>
<option value="Duster">Bhel</option>
<option value="Esteem">Dosa</option>
<option value="Fiero">Misal Paw</option>
<option value="Lancer">Sandwich</option>
<option value="Phantom">Pav Bhaji</option>
</select></b></td>
<td><b>Order No</b></td>
<td><b>Quantity</b></td>
<td><b>Customer</b></td>
<td><b>Status</b>
<td><b>Order State</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select tokenid ,mi.name, ol.orderid, ol.quantity, od.username,status from token t, orderline ol, menuitem mi, orderinfo od where t.tokenid = ol.orderlineid and mi.itemid = ol.itemid and od.orderid=ol.orderid";
int i=0;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<% 
String hiddenFieldValue=resultSet.getString("tokenid");%>

<td><%=resultSet.getString("tokenid") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("orderid") %></td>
<td><%=resultSet.getString("quantity") %></td>

<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("status") %></td>
 <input type="hidden" id="hdnTokenId_<%=i %>" name="hidn" value="<%=resultSet.getString("tokenid") %>"/>
<td><button id="remove" class= "btn btn-outline-secondary" onclick="submit()" >Complete</button></td>

<%i++; %>

</tr>
  </form>
<%
}

} catch (Exception e) {
e.printStackTrace();
}
%> 
<script>
function submit() {
	$("#remove").click(function() {
	var url = 'http://localhost:8080/newWhyq/update.java';
	window.location.href = url;
	});
</script>

<script>
/* function submit()
{
  string getid= document.getElementById("hdnToknId").submit();
   //This will submit the request to `second.jsp` where you can have your validations

}
$.ajax({
    type: "POST",
    url: "update",
    data: { tokenid: getid }
}); */
/* .done(function( msg ) {
	//String hiddenFieldValue=resultSet.getString("tokenid");
}); */
                              
</script>
                          <%--   <script language="javascript">
        function deleteRow(btn) {
        	
        	alert(tokenid.value);
           		var index = btn.id.substr(7);
           		var tokenid = document.getElementById('hdnTokenId_'+index);
           		
           		var abc=tokenid.value;
           		<% 
           		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
           		statement=connection.createStatement();
            	 //String str = "<script>document.writeln(abc)</script>";
           		String sql="update token set status='complete' where tokenid=11";
              
           		statement.executeUpdate(sql);
           		
           		
           		%>
           		alert('123');
           	
           		//response.redirect("update.jsp");
           		 /*   $.ajax({url: "update.java", success: function(result){
           		        $("#div1").html(result);
           		    }}); */
        	
  		
        }
    </script> --%>
 <!--   <script>
$(document).ready(function(){

 $("#tbUser").on('click','#remove',function(){
	 
		 $(this).closest('tr').remove();
		
		
      
     });

});

</script> 

    -->

<script > $(function(){$('#ddlCars2').multiselect({ 
        includeSelectAllOption: true,
        enableFiltering:true         
        
  });
    });</script>
  
</table>
</body>
</html>