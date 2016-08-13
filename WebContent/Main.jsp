<%@page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>

<%@ include file="header.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>


<%  try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food", "root", "password");

        Statement statement = connection.createStatement();
        
 %>
<div class="container">

	<div class="row">
		<div class="col-sm-4 col-sm-offset-2">
			<h2>Today's Food</h2>
			<div class="alert alert-warning" role="alert"><h3>Total Food Calories - <%
			int temp;
			ResultSet totalQuery = statement.executeQuery("select * from userbreakfast");
			
			long count =0;
			HashMap hm = new HashMap();
			hm.put("Nihal","CoolGuy");
			
			Set s =hm.entrySet();
			
			Iterator itr = s.iterator();
			
			while(itr.hasNext()){
				Map.Entry ent = (Map.Entry)itr.next();
			}
			
			
			
			ArrayList<Integer> userBreakfastArray = new ArrayList<Integer>();			
			ArrayList<Integer> userLunchArray = new ArrayList<Integer>();	
			
			ArrayList<Integer> userDinnerArray = new ArrayList<Integer>();	
			
            	    while(totalQuery.next()){
            	    	count = count + Integer.parseInt(totalQuery.getString(3));
            	    	temp = Integer.parseInt(totalQuery.getString(1));
            	    	userBreakfastArray.add(temp);
            	    }
            
			
			totalQuery = statement.executeQuery("select * from userlunch");
			
			
			
			
            	    while(totalQuery.next()){
            	    	count = count + Integer.parseInt(totalQuery.getString(3));
            	    	temp = Integer.parseInt(totalQuery.getString(1));
            	    	userLunchArray.add(temp);
            	    }
           
			
			totalQuery = statement.executeQuery("select * from userdinner");
			
			
			
			
            	    while(totalQuery.next()){
            	    	count = count + Integer.parseInt(totalQuery.getString(3));
            	    	temp = Integer.parseInt(totalQuery.getString(1));
            	    	userDinnerArray.add(temp);
            	    	
            	    }
            
			
			out.print(count);
		
			%></h3></div>
			
			
			<h3>Breakfast</h3>
			<%
			

            ResultSet resultset = 
                statement.executeQuery("select * from userbreakfast");
            out.println();
            if(!resultset.next()) {
                out.println("No Breakfast Added ");
            } else {
			
			//out.println("oloY");
			
			%>
			<table class="table">
				<tr><th>Name</th><th>Calories</th><th>Remove</th></tr>
				<%
				
				do{
					
					%>
					
					<tr>
					<td><%= resultset.getString(2) %></td>
					<td><%= resultset.getString(3) %></td>
					<td>
					<form action="DelFood" method="post">
					
					
					<input type="hidden" name="form-name" value="breakfast">
					<input type="hidden" name="foodindex" value="<%= resultset.getString(1) %>">
					<input class="btn btn-danger" type="submit" name="breakfast" value="Delete">
					</form>
					</td>
					</tr>
					<%
					
				}while(resultset.next());
				
				%>
			</table>
			
			<%
            }
            %>
            <h3>Lunch</h3>
            <%
            
ResultSet lunchResult = statement.executeQuery("select * from userlunch");
			
			if(!lunchResult.next()){
				out.println("No Lunch Menu");
			}
			
			else {
				%>
				
				<table class="table">
				<tr><th>Name</th><th>Calories</th><th>Remove</th></tr>
				<%
				
				do{
					
					%>
				<tr>
					<td><%= lunchResult.getString(2) %></td>
					<td><%= lunchResult.getString(3) %></td>
					<td>
					<form action="DelFood" method="post">
					<input type="hidden" name="form-name" value="lunch">
					<input type="hidden" name="foodindex" value="<%= lunchResult.getString(1) %>">
					<input class="btn btn-danger" type="submit" name="lunch" value="Delete">
					</form>
					</td>
				</tr>
				
			<%
			
				}while(lunchResult.next()); 
				
			%>
				
				
				</table>
				<% } %>
				<h3>Dinner</h3>
				<%
			
            ResultSet dinnerResult = statement.executeQuery("select * from userdinner");
            
        	if(!dinnerResult.next()){
				out.println("No Dinner Menu");
			}
			
			else {
				%>
				
				<table class="table">
				<tr><th>Name</th><th>Calories</th><th>Remove</th></tr>
				<%
				
				do{
					
					%>
				<tr>
					<td><%= dinnerResult.getString(2) %></td>
					<td><%= dinnerResult.getString(3) %></td>
					<td>
					<form action="DelFood" method="post">
					<input type="hidden" name="form-name" value="dinner">
					<input type="hidden" name="foodindex" value="<%= dinnerResult.getString(1) %>">
					<input class="btn btn-danger" type="submit" name="dinner" value="Delete">
					</form>
					</td>
				</tr>
				<%
				
				}while(dinnerResult.next());
				%>
				</table>
				<%
			}
        	%>
			<a href="addFood.jsp" class="btn btn-block btn-warning">Add Food</a>
		</div>
		<div class="col-sm-4">
			<h2>Today's Exercises </h2>
			<form method="post" action="Exercise">
			<%
			
			ResultSet rb = statement.executeQuery("select * from exercise");
			
			int ecount = 0;
			
			while(rb.next()){
				if(rb.getString(2).equals("Running")){
					ecount = ecount + Integer.parseInt(rb.getString(3))*8;
				}
				if(rb.getString(2).equals("Cycling")){
					ecount = ecount + Integer.parseInt(rb.getString(3))*5;
				}
			}
		
			%>
			<div class="alert alert-warning" role="alert"><h3>Total Exercise Calories - <% out.println(ecount); %></h3>
			</div>
			
			<%
			ResultSet rs = statement.executeQuery("select * from exercise");
			
			
			//out.println("oloY");
			
			while(rs.next()){
			%>
			
			<div class="form-group">
				<label><%= rs.getString(2) %></label>
				<input type="text" name="<%= rs.getString(2) %>" value="<%= rs.getString(3) %>">
			</div>
			 
			<%
			}
			
			%>
			
			<input type="submit" class="btn btn-block btn-success" value="Update">
			</form>
			<div class="alert alert-success" role="alert">
				<p>Calorie Count :</p> <h1><% out.print(count - ecount); %></h1>
			</div>
			
			<%
}
catch(Exception e ){
	e.printStackTrace();
}
			%>
			
		</div>
	</div>
	<div class="row">
		
	</div>
	
</div>
