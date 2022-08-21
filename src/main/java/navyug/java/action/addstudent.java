package navyug.java.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import javax.rmi.CORBA.Stub;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import navyug.java.pro.AddStudent;
import navyug.java.pro.CheckStudent;
import navyug.java.to.Student;
import navyug.java.util.DBUtil;
import navyug.java.util.Encrypt;

/**
 * Servlet implementation class addstudent
 */
@WebServlet(name="superadmin/addstudent",urlPatterns = {"/superadmin/addstudent"})
@MultipartConfig

public class addstudent extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Student u = new Student();
		
		u.setRegnumber(request.getParameter("regnum"));
		u.setRollnumber(request.getParameter("rollnum"));
//		System.out.println(request.getParameter("emp_id"));
		u.setName(request.getParameter("name"));
		u.setPassword(Encrypt.encode(request.getParameter("password")));
		u.setAddres(request.getParameter("address"));
		u.setAge(request.getParameter("age"));
		u.setContact(request.getParameter("contact"));
		u.setBranch(request.getParameter("branch"));
		u.setCourse(request.getParameter("course"));
		u.setEmail(request.getParameter("email"));
		u.setGender(request.getParameter("gender"));
		u.setAdd_dates(request.getParameter("add_date"));
		u.setFee(request.getParameter("fees"));
		u.setFather_name(request.getParameter("father_name"));
		u.setFather_contact(request.getParameter("father_con"));
		u.setSection(request.getParameter("section"));

//		u.setPhoto(request.getPart("photo").getInputStream());
		System.out.println("yesssss");
        Part filePart = request.getPart("photo");
        String nameString = getnameFile(filePart);
        String pathString="D:\\Navyug\\navyug\\src\\main\\webapp\\assets\\images"+ File.separator + nameString;
        File filesave = new File(pathString);
        
        filePart.write(pathString+File.separator);
      		try {
			Connection conn=DBUtil.getConnection();
//			Admin check= CheckAdmin.check(conn, u.getAdminId(), u.getEmpId());
			if(CheckStudent.check(conn, u.getRollnumber(),u.getRegnumber())) {
//				request.getSession().setAttribute("CURRENT_SUPER_ADMIN",u);
				if(AddStudent.add(conn, u,nameString)) {
					conn.close();
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("err","Student Already Present");
				request.getRequestDispatcher("addstudent.jsp").forward(request, response);
			}
			} catch (Exception e) {
			request.setAttribute("er", "System : error"+e.getMessage());
			System.out.println("System : error"+e.getMessage());

			request.getRequestDispatcher("addstudent.jsp").forward(request,response);
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
