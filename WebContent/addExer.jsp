<%@page import="java.util.Iterator"%>
<%@ include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%  try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/food", "root", "password");

        Statement statement = connection.createStatement();
	int temp;
	boolean presentInUser=false;
	
	Iterator<Integer> itr;
	%>

<div class="container">
	

	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<div class="alert alert-warning" role="alert"><h3>Total Burnt Calories - 
			<% 
			
			ResultSet rs = statement.executeQuery("select * from exercise");
			int ecount=0;
			do{
				if(rs.getString(2).equals("Running")){
					ecount = ecount + Integer.parseInt(rs.getString(3))*23;
				}
				if(rs.getString(2).equals("Cycling")){
					ecount = ecount + Integer.parseInt(rs.getString(3))*15;
				}
			}while(rs.next());
			
			out.print(ecount);
			
			
			%>
		
			</h3></div>
			
			<div class="col-xs-12">
			<p>Enter the time in minutes</p>
				<form action="Exercise" method='post'>
				
				</form>
			</div>
			
			<%
}

catch (Exception e){
	e.printStackTrace();
}

%>
			
			
		
	</div>
	
	
</div>
</div>