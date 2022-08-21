package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.AdminViewCheck;
import navyug.java.pro.AdminViewProcess;
import navyug.java.to.Admin;
import navyug.java.to.Employee;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class adminview
 */
@WebServlet(name = "superadmin/adminview",urlPatterns = {"/superadmin/adminview"})
public class adminview extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Admin u = new Admin();
		
		u.setAdminId(request.getParameter("admin_id"));
		u.setUserName(request.getParameter("name"));
				
		try {
			Connection conn=DBUtil.getConnection();
			Admin check= AdminViewCheck.check(conn, u.getAdminId(), u.getUserName());
			if(check!=null) {
				Employee e = new Employee();
				e=AdminViewProcess.view(conn, check.getEmpId(),check.getAdminId());
				if(e!=null) {
					System.out.println("yessss");
					request.getSession().setAttribute("ADMIN_VIEW",e);
					conn.close();
					request.getRequestDispatcher("adminprofile.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("err","Admin Already Present");
				request.getRequestDispatcher("adminview.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("adminview.jsp").forward(request,response);
			return;
		}
	}

}
