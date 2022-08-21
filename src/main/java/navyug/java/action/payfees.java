package navyug.java.action;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import navyug.java.pro.PayFees;
import navyug.java.to.Fees;
import navyug.java.util.DBUtil;

/**
 * Servlet implementation class payfees
 */
@WebServlet(name="superadmin/payfees",urlPatterns = {  "/superadmin/payfees"})
public class payfees extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Fees f= new Fees();
		f.setAmount(request.getParameter("fees"));
		f.setRollnumber(request.getParameter("roll_no"));
		f.setName(request.getParameter("name"));
		f.setDoneBy(request.getParameter("done_by"));
		f.setPending_fee(request.getParameter("pending_fee"));
		try {
			Connection conn=DBUtil.getConnection();
				if(PayFees.pay(conn, f)) {
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
