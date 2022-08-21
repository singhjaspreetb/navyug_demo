package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.DeleteAsset;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class deleteasset
 */
@WebServlet(name="superadmin/deleteasset",urlPatterns = {  "/superadmin/deleteasset"})
public class deleteasset extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg=request.getParameter("sno");
		try {
			Connection conn=DBUtil.getConnection();
				if(DeleteAsset.del(conn, msg)) {
					System.out.println("yessss");
					conn.close();
					request.getRequestDispatcher("/superadmin/asssetlist?list=getlist").forward(request, response);
				
			}else {
				System.out.println("nooooooooo");
				request.setAttribute("err","Noting is Present");
				request.getRequestDispatcher("assets.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			request.getRequestDispatcher("assets.jsp").forward(request,response);
			return;
		}

	}

}
