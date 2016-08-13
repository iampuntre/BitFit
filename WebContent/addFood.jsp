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
			<div class="alert alert-warning" role="alert"><h3>Total Food Calories - <%
			
			ResultSet totalQuery = statement.executeQuery("select * from userbreakfast");
			
			long count =0;
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
			
			<a href="Main.jsp" class="btn btn-pull-right">Go back to Main Page</a>
			
		</div>
		
		<div class="col-sm-6 col-sm-offset-3">
			<h3>Breakfast</h3>
			<%
				
				
		              
		 
		            ResultSet resultset = 
		                statement.executeQuery("select * from breakfast");
		            
		            if(!resultset.next()) {
		                out.println("SORRY, WE COULD NOT GET YOUR INFORMATIONS. ");
		            } else {
		            
				%>
				
			<table class="table">
			
				<tr><th>Name</th><th>Calories</th><th>Add/Remove</th></tr>
				
				<%
				while(resultset.next())
				{
					
				temp= Integer.parseInt(resultset.getString(1));
					
					presentInUser=false;
					
					itr = userBreakfastArray.iterator();
					
					while(itr.hasNext()){
						System.out.println("testing");
						if(itr.next() == temp){
							presentInUser=true;
							break;
						}
					}
					
					
				%>
				<tr>
					
					<td><%= resultset.getString(2) %></td>
					<td><%= resultset.getString(3) %></td>
					<%
					
					if(!presentInUser){
					
					%>
					<form action="Food" method="post">
					<td>
					<input type="hidden" name="fname" value="<%= resultset.getString(2) %>">
					<input type="hidden" name="fcal" value="<%= resultset.getString(3) %>">
					<input type="hidden" name="form-name" value="breakfast">
					<input type="hidden" name="foodindex" value="<%= resultset.getString(1) %>">
					<input class="btn btn-success" type="submit" name="breakfast" value="Add">
					</td>
					</form>
					<%
					
					}
					else {
						%>
						<td>
					<input class="btn btn-default" type="submit" name="dinner" value="Added" disabled="disabled">
					</td>
						
						<%
					}
					
					%>
				</tr>
				<%
				}
		            }
				%>
				
			</table>
			
			<h3>Lunch</h3>
			
			
			<table class="table">
			<tr><th>Name</th><th>Calories</th><th>Add/Remove</th></tr>
			
			<%
			
			ResultSet lunchResult = statement.executeQuery("select * from lunch");
			
			if(!lunchResult.next()){
				out.println("No Lunch Menu");
			}
			
			else {
				
				while(lunchResult.next()){
					
					temp= Integer.parseInt(lunchResult.getString(1));
					
					presentInUser=false;
					
					itr = userLunchArray.iterator();
					
					while(itr.hasNext()){
						System.out.println();
						
						
						if(itr.next() == temp){
							presentInUser=true;
							break;
						}
					}
				
			%>
			<tr>
					
					<td><%= lunchResult.getString(2) %></td>
					<td><%= lunchResult.getString(3) %></td>
					<%
					
					if(!presentInUser){
					
					%>
					<form action="Food" method="post">
					<td>
					<input type="hidden" name="fname" value="<%= lunchResult.getString(2) %>">
					<input type="hidden" name="fcal" value="<%= lunchResult.getString(3) %>">
					<input type="hidden" name="form-name" value="lunch">
					<input type="hidden" name="foodindex" value="<%= lunchResult.getString(1) %>">
					<input class="btn btn-success" type="submit" name="lunch" value="Add"></td>
					</form>
			<%
				}
				else {
					%>
					
					<td>
					<input class="btn btn-default" type="submit" name="dinner" value="Added" disabled="disabled">
					</td>
					
					<%
				}
			%>
			</tr>
			<%
				}
			
			}
			
			%>
			</table>
			
			<h3>Dinner</h3>
			
			<table class="table">
			
			
			
			<tr><th>Name</th><th>Calories</th><th>Add/Remove</th></tr>
			
			<%
			
			ResultSet dinnerResult = statement.executeQuery("select * from dinner");
			
			if(!dinnerResult.next()){
				out.println("No Dinner Menu");
			}
			
			else {
				
				//ResultSet userDinner = statement.executeQuery("select * from userdinner");
				
				while(dinnerResult.next()){
					
			%>
			
			<tr>
					
					<td><%= dinnerResult.getString(2) %></td>
					<td><%= dinnerResult.getString(3) %></td>
					<%
					
					temp= Integer.parseInt(dinnerResult.getString(1));
					
					presentInUser=false;
					
					itr = userDinnerArray.iterator();
					
					while(itr.hasNext()){
						System.out.println("testing");
						if(itr.next() == temp){
							presentInUser=true;
							break;
						}
					}
					
					/* while(userDinner.next())
					{
						if(dinnerResult.getString(1) == userDinner.getString(1))
						{
							presentInUser = true;
							break;
						}
					} */
					
					if(!presentInUser)
					{
					
					%>
					<form action="Food" method="post">
					<td>
					<input type="hidden" name="fname" value="<%=  dinnerResult.getString(2) %>">
					<input type="hidden" name="fcal" value="<%= dinnerResult.getString(3) %>">
					<input type="hidden" name="form-name" value="dinner">
					<input type="hidden" name="foodindex" value="<%= dinnerResult.getString(1) %>">
					<input class="btn btn-success" type="submit" name="dinner" value="Add">
					</td>
					</form>
					<%
					
					}
					else {
					
					%>
					<td>
					<input class="btn btn-default" type="submit" name="dinner" value="Added" disabled="disabled">
					</td>
			
				<%
					
						%>
						
						</tr>
						<%
					}
				}
			}
}
catch (Exception e){
	e.printStackTrace();
}
				%>
			</table>
			
		</div>
	</div>
	
	
</div>