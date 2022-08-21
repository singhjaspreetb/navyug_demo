package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.FeesViewProcess;
import navyug.java.pro.StudentViewProcess;
import navyug.java.pro.UserProcess;
import navyug.java.to.Fees;
import navyug.java.to.Student;
import navyug.java.to.User;
import navyug.java.util.DBUtil;
import navyug.java.util.Encrypt;

/**
 * Servlet implementation class login
 */
@WebServlet(name="student/login",urlPatterns =  {"/student/login"})
public class login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("username");
		String passWord=request.getParameter("password");
		passWord = Encrypt.encode(passWord);
//		System.out.println(passWord);
		try {
			Connection conn=DBUtil.getConnection();
			User u= UserProcess.login(conn, userId, passWord);
			
			if(u!=null) {
				Student s = StudentViewProcess.view(conn, userId,u.getUserName());
				List<Fees> e=FeesViewProcess.view(conn, userId,u.getUserName());
				Student st=StudentViewProcess.view(conn, userId,u.getUserName());
				request.getSession().setAttribute("FEES_VIEW",e);
				request.getSession().setAttribute("FEES_VIEW_ST",st);

				request.getSession().setAttribute("CURRENT_USER",s);
				conn.close();
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}else {
				request.setAttribute("err","Wrong Username or Password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("login.jsp").forward(request,response);
			return;
		}
	}

}
