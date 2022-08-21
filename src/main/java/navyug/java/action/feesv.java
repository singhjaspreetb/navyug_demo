package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.CheckStudent;
import navyug.java.pro.FeesViewProcess;
import navyug.java.pro.StudentViewProcess;
import navyug.java.to.Fees;
import navyug.java.to.Student;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class fees
 */
@WebServlet(name = "superadmin/feesv", urlPatterns = {"/superadmin/feesv"})
public class feesv extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Fees u = new Fees();
		
		u.setRollnumber(request.getParameter("roll_no"));
		u.setName(request.getParameter("name"));
				
		try {
			Connection conn=DBUtil.getConnection();
			if(!CheckStudent.check(conn, u.getRollnumber(),u.getName())) {
				List<Fees> e=FeesViewProcess.view(conn, u.getRollnumber(),u.getName());
				Student st=StudentViewProcess.view(conn, u.getRollnumber(),u.getName());
				if(e!=null) {
					System.out.println("yessss");
					request.getSession().setAttribute("FEES_VIEW",e);
					request.getSession().setAttribute("FEES_VIEW_ST",st);

					conn.close();
					request.getRequestDispatcher("feesupdate.jsp").forward(request, response);
				}else {
					System.out.println("yessss");
					request.getSession().setAttribute("FEES_VIEW_ST",st);
					conn.close();
					request.getRequestDispatcher("feesupdate.jsp").forward(request, response);

				}
			}else {
				request.setAttribute("err","Student Not Present");
				request.getRequestDispatcher("fees.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("fees.jsp").forward(request,response);
			return;
		}
	}

}
