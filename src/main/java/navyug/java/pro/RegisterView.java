package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import navyug.java.to.Student;

public class RegisterView {
	public static List<Student> getreg(Connection conn) throws SQLException{
		String sqlemp = "select * from student_registration;";
		PreparedStatement temp2= conn.prepareStatement(sqlemp);
		System.out.println(sqlemp);
		ResultSet rs = temp2.executeQuery();
		List<Student> res = new ArrayList<Student>();
		while(rs.next()) {
			Student e=new Student();
			
			e.setName(rs.getString("name"));
			e.setRegnumber(rs.getString("registration_number"));
			e.setContact(rs.getString("number"));
			e.setEmail(rs.getString("email"));
			e.setBranch(rs.getString("branch"));
			e.setCourse(rs.getString("course"));
			e.setAddres(rs.getString("address"));
			res.add(e);

		}
		return res;
}

}
