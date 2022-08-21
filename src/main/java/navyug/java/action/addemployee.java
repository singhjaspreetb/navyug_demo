package navyug.java.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import navyug.java.pro.AddEmployee;
import navyug.java.pro.CheckEmployee;
import navyug.java.to.Employee;
import navyug.java.util.DBUtil;
import navyug.java.util.Encrypt;

/**
 * Servlet implementation class addemployee
 */
@WebServlet(name = "superadmin/addemployee",urlPatterns = {"/superadmin/addemployee"})
@MultipartConfig
public class addemployee extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Employee u = new Employee();
		
		u.setEmpId(request.getParameter("emp_id"));
//		System.out.println(request.getParameter("emp_id"));
		u.setName(request.getParameter("name"));
		u.setPassword(Encrypt.encode(request.getParameter("password")));
		u.setAddres(request.getParameter("address"));
		u.setAge(request.getParameter("age"));
		u.setContact(request.getParameter("number"));
		u.setCreation(request.getParameter("joining_date"));
		u.setDegination(request.getParameter("degination"));
		u.setDepartment(request.getParameter("department"));
		u.setEmail(request.getParameter("email"));
		u.setGender(request.getParameter("gender"));
		u.setJoining_date(request.getParameter("joining_date"));
		u.setSalary(request.getParameter("salary"));
//		u.setPhoto(request.getPart("photo").getInputStream());
//		InputStream inputStream = null; 
		// input stream of the upload file
        // obtains the upload file part in this multipart request
		System.out.println("yesssss");
        Part filePart = request.getPart("photo");
        String nameString = getnameFile(filePart);
        String pathString="D:\\Navyug\\navyug\\src\\main\\webapp\\assets\\images"+ File.separator + nameString;
        File filesave = new File(pathString);
        filePart.write(pathString+File.separator);
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//
//            //obtains input stream of the upload file
//            //the InputStream will point to a stream that contains
//            //the contents of the file
//            inputStream = filePart.getInputStream();
//        }
		try {
			Connection conn=DBUtil.getConnection();
//			Admin check= CheckAdmin.check(conn, u.getAdminId(), u.getEmpId());
			if(CheckEmployee.check(conn, u.getEmpId())) {
//				request.getSession().setAttribute("CURRENT_SUPER_ADMIN",u);
				if(AddEmployee.add(conn, u,nameString)) {
					conn.close();
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("err","Employee Already Present");
				request.getRequestDispatcher("addstaff.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("addstaff.jsp").forward(request,response);
			return;
		}
	}
	private String getnameFile(Part filPart) {
		String cont=filPart.getHeader("content-disposition");
		String[] item= cont.split(";");
		for(String str: item) {
			if(str.trim().startsWith("filename")) {
				return str.substring(str.indexOf("=")+2,str.length()-1);
			}
		}
		return "";
	}
}
