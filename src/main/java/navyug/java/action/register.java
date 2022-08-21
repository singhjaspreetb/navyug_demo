package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.Register;
import navyug.java.to.Student;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class register
 */
@WebServlet(name="register",urlPatterns ={ "/register"})
public class register extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student u = new Student();
		
		u.setName(request.getParameter("name"));
		u.setAddres(request.getParameter("address"));
		u.setContact(request.getParameter("number"));
		u.setBranch(request.getParameter("branch"));
		u.setCourse(request.getParameter("course"));
		u.setEmail(request.getParameter("email"));
		u.setGender(request.getParameter("gender"));
		try {
			Connection conn=DBUtil.getConnection();
			if(Register.add(conn, u)) {
				conn.close();
				request.setAttribute("Register","Success");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("err","Student Already Present");
				request.getRequestDispatcher("student/register.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("err", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("student/register.jsp").forward(request,response);
			return;
		}
	}

}
