package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FindEmployee {
	public static Boolean check(Connection conn,String empId,String name) throws SQLException {
//		String sql = "select * from student_auth where username = ? and password = ?";
		String sql = "select * from employee where emp_id = '"+empId+"' and name='"+name+"';";
		System.out.println(sql);
		PreparedStatement temp= conn.prepareStatement(sql);
		
//		int i=1;
//		temp.setString(i++, userId);
//		temp.setString(i++, passWord);
//		
		ResultSet rs = temp.executeQuery();
		
		if(rs.next()) {
			return false;
		}

		return true;
	}

}
