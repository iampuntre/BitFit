package fitness;

import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Food
 */
@WebServlet("/Food")
public class Food extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	 static Connection getConn() throws Exception {
	        String driver = "com.mysql.jdbc.Driver";
	        String url = "jdbc:mysql://localhost/food";
	        String username = "root";
	        String password = "password";
	        Class.forName(driver);
	        Connection conn = DriverManager.getConnection(url, username, password);
	        return conn;
	    }
    
    public Food() {
    	
    	
    	
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String formName = request.getParameter("form-name");
		String query="";
		System.out.println(formName);
		
		try {
			Connection conn = getConn();
			
			int findex =Integer.parseInt(request.getParameter("foodindex"));
			String fname = request.getParameter("fname");
			
			int fcal = Integer.parseInt(request.getParameter("fcal"));
			
			
			
			System.out.println(findex+"Yolo");
			
			if(formName.equals("breakfast")){
				
				query = "insert into userbreakfast(bid,bname,cal) Values("+findex+",'"+fname+"',"+fcal+")";
				
			}
			
			else if(formName.equals("lunch")){
				query = "insert into userlunch(lid,lname,cal) Values("+findex+",'"+fname+"',"+fcal+")";
			}
			else if(formName.equals("dinner")){
				query = "insert into userdinner(did,dname,cal) Values("+findex+",'"+fname+"',"+fcal+")";
			}
			
			Statement stmt = conn.createStatement();
			
			stmt.executeUpdate(query);
			
			response.sendRedirect("addFood.jsp");
			
			
			
		}
		catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
			response.sendRedirect("addFood.jsp");
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
