package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import navyug.java.to.Student;

public class StudentViewProcess {
public static Student view(Connection conn,String roll_no,String name) throws SQLException {
		
		String sql = "select * from students where roll_no = '"+roll_no+"' and name='"+name+"';";
		System.out.println(sql);
		PreparedStatement temp2= conn.prepareStatement(sql);
		ResultSet rs2 = temp2.executeQuery();
		
		if(rs2.next()) {
			Student e=new Student();
			
			e.setName(rs2.getString("name"));
			e.setRollnumber(rs2.getString("roll_no"));
			e.setRegnumber(rs2.getString("resistration_number"));
			e.setContact(rs2.getString("number"));
			e.setEmail(rs2.getString("email"));
			e.setGender(rs2.getString("gender"));
			e.setAge(rs2.getString("age"));
			e.setSection(rs2.getString("section"));
			e.setBranch(rs2.getString("branch"));
			e.setAddres(rs2.getString("address"));
			e.setCourse(rs2.getString("course"));
			e.setAdd_dates(rs2.getString("addmission_date"));
			e.setPhoto(rs2.getString("photo"));
			e.setFather_name(rs2.getString("father_name"));
			e.setFather_contact(rs2.getString("father_contact"));
			e.setFee(rs2.getString("fees"));
			e.setFee_status(rs2.getString("feestatus"));
			e.setPending_fee(rs2.getString("pending_fees"));
			return e;
		}
		return null;
}
}
