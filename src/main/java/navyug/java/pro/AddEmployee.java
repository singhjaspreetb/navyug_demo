package navyug.java.pro;

import java.io.File;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import navyug.java.to.Employee;


public class AddEmployee {
	public static Boolean add(Connection conn,Employee u, String nameString) throws SQLException {
		String sql = "insert into employee(emp_id,name,contact,email,gender,age,salary,salary_status,department,degination,address,joining_date,creation_date,photo) values('"+u.getEmpId()+"','"+u.getName()+"','"+u.getContact()+"','"+u.getEmail()+"','"+u.getGender()+"',"+u.getAge()+",'"+u.getSalary()+"','Pending','"+u.getDepartment()+"','"+u.getDegination()+"','"+u.getAddres()+"', '"+u.getJoining_date()+"','"+u.getCreation()+"','"+nameString+"');";
		PreparedStatement temp= conn.prepareStatement(sql);
//        temp.setBlob(1, inputStream);
        System.out.println(temp);
		temp.executeUpdate();
		sql = "insert into employee_auth(emp_id,name,passcode,token) values('"+u.getEmpId()+"','"+u.getName()+"','"+u.getPassword()+"','0');";
		temp= conn.prepareStatement(sql);
        System.out.println(temp);
		temp.executeUpdate();

	return true;
}
}