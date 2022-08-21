package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckStudent {
	public static Boolean check(Connection conn,String rollno,String regnum) throws SQLException {
//		String sql = "select * from student_auth where username = ? and password = ?";
		String sql = "select * from students where roll_no = '"+rollno+"' or resistration_number='"+regnum+"';";
		System.out.println(sql);
		PreparedStatement temp= conn.prepareStatement(sql);
		
		ResultSet rs = temp.executeQuery();
		
		if(rs.next()) {
			return false;
		}

		return true;
	}


}
