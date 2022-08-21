package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.CheckStudent;
import navyug.java.pro.StudentViewProcess;
import navyug.java.to.Student;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class studentview
 */
@WebServlet(name="superadmin/studentview",urlPatterns = { "/superadmin/studentview"})
public class studentview extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student u = new Student();
		
		u.setName(request.getParameter("name"));
		u.setRollnumber(request.getParameter("roll_no"));
				
		try {
			Connection conn=DBUtil.getConnection();
			if(!CheckStudent.check(conn, u.getRollnumber(), u.getName())) {
				Student e = new Student();
				e=StudentViewProcess.view(conn, u.getRollnumber(),u.getName());
				if(e!=null) {
					System.out.println("yessss");
					request.getSession().setAttribute("STUDENT_VIEW",e);
					conn.close();
					request.getRequestDispatcher("studentprofile.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("err","Student not Present");
				request.getRequestDispatcher("studentlist.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("studentlist.jsp").forward(request,response);
			return;
		}
	}

}
