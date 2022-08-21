package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.EmployeeViewProcess;
import navyug.java.pro.FindEmployee;
import navyug.java.to.Employee;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class employeeview
 */
@WebServlet(name="superadmin/employeeview",urlPatterns = {"/superadmin/employeeview"})
public class employeeview extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId=request.getParameter("emp_id");		
		String name=request.getParameter("name");		

		try {
			Connection conn=DBUtil.getConnection();
			if(!FindEmployee.check(conn, empId,name)) {
				Employee e = new Employee();
				e=EmployeeViewProcess.view(conn, empId,name);
				if(e!=null) {
					System.out.println("yessss");
					request.getSession().setAttribute("EMPLOYEE_VIEW",e);
					conn.close();
					request.getRequestDispatcher("staffprofile.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("err","Admin Already Present");
				request.getRequestDispatcher("staffview.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("staffview.jsp").forward(request,response);
			return;
		}
	}

}
