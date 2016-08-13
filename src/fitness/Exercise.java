package fitness;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Exercise
 */
@WebServlet("/Exercise")
public class Exercise extends HttpServlet {
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
    public Exercise() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			Connection conn = getConn();
			
			int RunningTime = Math.abs(Integer.parseInt(request.getParameter("Running")));
			
			int CyclingTime = Math.abs(Integer.parseInt(request.getParameter("Cycling")));
			
			Statement statement = conn.createStatement();
			statement.executeUpdate("Update exercise set time="+RunningTime+" where ename='Running'");
			statement.executeUpdate("Update exercise set time="+CyclingTime+" where ename='Cycling'");
			response.sendRedirect("Main.jsp");
		}
		catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e){
			response.sendRedirect("Main.jsp");
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			
			response.sendRedirect("Main.jsp");
			e.printStackTrace();
		}
		
		
	}

	}


