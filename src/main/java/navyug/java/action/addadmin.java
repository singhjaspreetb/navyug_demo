package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.AddAdmin;
import navyug.java.pro.CheckAdmin;
import navyug.java.to.Admin;
import navyug.java.util.DBUtil;
import navyug.java.util.Encrypt;

/**
 * Servlet implementation class addadmin
 */
@WebServlet(name = "superadmin/addadmin",urlPatterns = {"/superadmin/addadmin"})
public class addadmin extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Admin u = new Admin();
		
		u.setAdminId(request.getParameter("admin_id"));
		u.setEmpId(request.getParameter("emp_id"));
		u.setUserName(request.getParameter("name"));
		u.setPassWord(Encrypt.encode(request.getParameter("password")));
				
		try {
			Connection conn=DBUtil.getConnection();
			Admin check= CheckAdmin.check(conn, u.getAdminId(), u.getEmpId());
			if(check==null) {
//				request.getSession().setAttribute("CURRENT_SUPER_ADMIN",u);
				if(AddAdmin.add(conn, u)) {
					conn.close();
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("err","Admin Already Present");
				request.getRequestDispatcher("addadmin.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("addadmin.jsp").forward(request,response);
			return;
		}
	}
}
