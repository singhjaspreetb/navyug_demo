package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.DeleteFees;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class deletefees
 */
@WebServlet(name="superadmin/deletefees",urlPatterns = {  "/superadmin/deletefees"})
public class deletefees extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg=request.getParameter("sno");
		String id=request.getParameter("id");
		try {
			Connection conn=DBUtil.getConnection();
				if(DeleteFees.del(conn, msg,id)) {
					System.out.println("yessss");
					conn.close();
					request.getRequestDispatcher("/superadmin/feesv").forward(request, response);
				
			}else {
				System.out.println("nooooooooo");
				request.setAttribute("err","Noting is Present");
				request.getRequestDispatcher("/superadmin/feesv").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			request.getRequestDispatcher("/superadmin/feesv").forward(request,response);
			return;
		}

	}

}
