package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import navyug.java.to.Employee;

public class EmployeeViewProcess {
	public static Employee view(Connection conn,String empId,String name) throws SQLException {
		
		String sql = "select * from employee where emp_id = '"+empId+"' and name='"+name+"';";
		System.out.println(sql);
		PreparedStatement temp2= conn.prepareStatement(sql);
		ResultSet rs2 = temp2.executeQuery();
		
		if(rs2.next()) {
			Employee e=new Employee();
			
			e.setName(rs2.getString("name"));
			e.setEmpId(rs2.getString("emp_id"));
			e.setContact(rs2.getString("contact"));
			e.setEmail(rs2.getString("email"));
			e.setGender(rs2.getString("gender"));
			e.setAge(rs2.getString("age"));
			e.setSalary(rs2.getString("department"));
			e.setDegination(rs2.getString("degination"));
			e.setAddres(rs2.getString("address"));
			e.setJoining_date(rs2.getString("joining_date"));
			e.setLast_date(rs2.getString("last_date"));
			e.setCreation(rs2.getString("creation_date"));
			e.setSalary(rs2.getString("salary"));
			e.setPhoto(rs2.getString("photo"));
			
			return e;
		}
		return null;
}

}
