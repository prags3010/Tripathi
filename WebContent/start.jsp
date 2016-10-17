<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("token_id");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "whyq";
String userId = "root";
String password = "password";

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
<form action ="update.java">
<body>
<head>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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

<h2 align="center"><font><strong>Tokens</strong></font></h2></head>
<table class="table table-striped" id="tbUser" align="center" width="20%" height="%30">
<tr>

</tr>
<tr>
<td><b>Icons</b></td>
<td><b>token_id</b></td>
<td><b><select id="ddlCars2" multiple="multiple">
<option value="Accord">Pani Puri</option>
<option value="Duster">Bhel</option>
<option value="Esteem">Dosa</option>
<option value="Fiero">Misal Paw</option>
<option value="Lancer">Sandwich</option>
<option value="Phantom">Pav Bhaji</option>
</select></b></td>
<td><b>token_state</b></td>
<td><b>token_quant</b></td>
<td><b>menu_id</b></td>
<td><b>Status</b>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM tokens";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td> <span class="glyphicon glyphicon-hand-right"></span></td>

<td><%=resultSet.getString("token_id") %></td>
<td><%=resultSet.getString("menu_item") %></td>
<td><%=resultSet.getString("token_state") %></td>
<td><%=resultSet.getString("token_quant") %></td>
<td><%=resultSet.getString("menu_id") %></td>
<td><button id="btnDelete" class= "btn btn-outline-secondary" > Done<i class="material-icons">done</i></button></td>

</tr>

<%
}

} catch (Exception e) {
e.printStackTrace();
}
%><script>
$(document).ready(function(){

 $("#tbUser").on('click','#btnDelete',function(){
       $(this).closest('tr').remove();
     });

});

</script>

<script type="text/javascript"> $(function(){$('#ddlCars2').multiselect({ 
        includeSelectAllOption: true,
        enableFiltering:true         
        
  });
    });</script>
</table>
</body>
</html>