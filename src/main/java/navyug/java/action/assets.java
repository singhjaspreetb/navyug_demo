package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.AddAsset;
import navyug.java.pro.CheckEmployee;
import navyug.java.to.Asset;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class assets
 */
@WebServlet(name="superadmin/assets", urlPatterns = {"/superadmin/assets"})
public class assets extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Asset u = new Asset();
		
		u.setName(request.getParameter("name"));
		u.setEmpId(request.getParameter("emp_id"));
		u.setAssetName(request.getParameter("asset_name"));
		u.setAssetId(request.getParameter("asset_id"));
		u.setDateFrom(request.getParameter("date_from"));
		u.setDateTo(request.getParameter("date_to"));
		try {
			Connection conn=DBUtil.getConnection();
			if(!CheckEmployee.check(conn, u.getEmpId())) {
				if(AddAsset.add(conn, u)) {
					conn.close();
					request.getRequestDispatcher("/superadmin/asssetlist?list=getlist").forward(request, response);
//					request.getRequestDispatcher("/superadmin/asssetlist?list=getlist").forward(request, response);

				}
			}else {
				request.setAttribute("err","Employee Not Present");
				request.getRequestDispatcher("assets.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());
			request.getServletContext().getRequestDispatcher("assets.jsp").forward(request,response);
			return;
	}

	}

}
