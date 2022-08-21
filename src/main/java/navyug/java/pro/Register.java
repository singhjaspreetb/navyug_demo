package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import navyug.java.to.Student;

public class Register {
	public static Boolean add(Connection conn,Student u) throws SQLException {
		String sql = "insert into student_registration(registration_number,name,number,email,gender,branch,course,address,resistration_date) values('"+u.getName()+"_"+u.getContact()+"','"+u.getName()+"','"+u.getContact()+"','"+u.getEmail()+"','"+u.getGender()+"','"+u.getBranch()+"','"+u.getCourse()+"','"+u.getAddres()+"','"+java.time.LocalDate.now()+"');";
		PreparedStatement temp= conn.prepareStatement(sql);
        System.out.println(temp);
		temp.executeUpdate();
		
		return true;
}
}
