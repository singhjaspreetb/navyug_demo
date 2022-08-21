package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.SuperAdminProcess;
import navyug.java.to.SuperAdmin;
import navyug.java.util.DBUtil;
import navyug.java.util.Encrypt;

/**
 * Servlet implementation class superadminlogin
 */
@WebServlet(name = "superadmin/superadminlogin",urlPatterns = { "/superadmin/superadminlogin" })
public class superadminlogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId=request.getParameter("username");
		String passWord=request.getParameter("password");
		passWord = Encrypt.encode(passWord);
//		System.out.println(passWord);
		try {
			Connection conn=DBUtil.getConnection();
			SuperAdmin u= SuperAdminProcess.login(conn, userId, passWord);
			if(u!=null) {
				request.getSession().setAttribute("CURRENT_SUPER_ADMIN",u);
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
