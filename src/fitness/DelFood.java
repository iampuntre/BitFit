package fitness;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class DelFood
 */
@WebServlet("/DelFood")
public class DelFood extends HttpServlet {
	
	
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
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelFood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String formName = request.getParameter("form-name");
		String query="";
		System.out.println(formName);
		
		try {
			Connection conn = getConn();
			
			int findex =Integer.parseInt(request.getParameter("foodindex"));
			
			
			
			
			System.out.println(findex+"Yolo");
			
			if(formName.equals("breakfast")){
				
				query = "delete from userbreakfast where bid="+findex+"";
				
			}
			
			else if(formName.equals("lunch")){
				query = "delete from userlunch where lid="+findex+"";
			}
			else if(formName.equals("dinner")){
				query = "delete from userdinner where did="+findex+"";
			}
			
			Statement stmt = conn.createStatement();
			
			stmt.executeUpdate(query);
			
			response.sendRedirect("Main.jsp");
			
			
			
		}
		catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
			response.sendRedirect("Main.jsp");
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
