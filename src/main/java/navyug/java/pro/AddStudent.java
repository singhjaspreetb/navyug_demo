package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import navyug.java.to.Student;

public class AddStudent {
	public static Boolean add(Connection conn,Student u, String nameString) throws SQLException {
		String sql = "insert into students(resistration_number,roll_no,name,number,email,gender,age,branch,course,address,addmission_date,father_name,father_contact,section,photo,fees,feestatus,pending_fees) values('"+u.getRegnumber()+"','"+u.getRollnumber()+"','"+u.getName()+"','"+u.getContact()+"','"+u.getEmail()+"','"+u.getGender()+"',"+u.getAge()+",'"+u.getBranch()+"','"+u.getCourse()+"','"+u.getAddres()+"','"+u.getAdd_dates()+"', '"+u.getFather_name()+"','"+u.getFather_contact()+"','"+u.getSection()+"','"+nameString+"','"+u.getFee()+"','Pending','"+u.getFee()+"');";
		PreparedStatement temp= conn.prepareStatement(sql);
        System.out.println(temp);
		temp.executeUpdate();
		
		sql = "insert into student_auth(roll_no,name,passcode,token) values('"+u.getRollnumber()+"','"+u.getName()+"','"+u.getPassword()+"','0');";
		temp= conn.prepareStatement(sql);
        System.out.println(temp);
		temp.executeUpdate();
		
		sql = "CREATE TABLE `"+u.getRollnumber()+"_"+u.getName()+"` (`sno` int NOT NULL AUTO_INCREMENT,`roll_no` varchar(10) NOT NULL,`fees` varchar(10) NOT NULL,`amount` varchar(10) NOT NULL,`fine` varchar(10) NOT NULL,`check_fee` varchar(20) NOT NULL,`trans_id` varchar(20) NOT NULL,`done_by` varchar(30) NOT NULL,`submission_date` datetime(6) NOT NULL,PRIMARY KEY (`sno`,`trans_id`));";
		temp= conn.prepareStatement(sql);
        System.out.println(temp);
		temp.executeUpdate();
	return true;
}

}
