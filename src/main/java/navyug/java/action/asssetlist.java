package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.AssetView;
import navyug.java.to.Asset;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class asssetlist
 */
@WebServlet( name="superadmin/assetlist", urlPatterns = { "/superadmin/asssetlist"})
public class asssetlist extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg=request.getParameter("list");
		try {
			Connection conn=DBUtil.getConnection();
			if(msg.equals("getlist")) {
				List<Asset> e=AssetView.getAssets(conn);
				if(e!=null) {
					System.out.println("yessss");
					request.getSession().setAttribute("LIST",e);
					conn.close();
					request.getRequestDispatcher("assets.jsp").forward(request, response);
				}
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg=request.getParameter("list");
		try {
			Connection conn=DBUtil.getConnection();
			if(msg.equals("getlist")) {
				List<Asset> e=AssetView.getAssets(conn);
				if(e!=null) {
					System.out.println("yessss");
					request.getSession().setAttribute("LIST",e);
					conn.close();
					request.getRequestDispatcher("assets.jsp").forward(request, response);
				}
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
