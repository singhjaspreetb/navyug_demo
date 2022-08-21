package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import navyug.java.to.Admin;

public class AdminViewCheck {
	public static Admin check(Connection conn,String userId,String name) throws SQLException {
//		String sql = "select * from student_auth where username = ? and password = ?";
		String sql = "select * from auth_admin where admin_id = '"+userId+"' and name = '"+name+"';";
		System.out.println(sql);
		PreparedStatement temp= conn.prepareStatement(sql);
		
//		int i=1;
//		temp.setString(i++, userId);
//		temp.setString(i++, passWord);
//		
		ResultSet rs = temp.executeQuery();
		
		if(rs.next()) {
			Admin u= new Admin();
			u.setUserName(rs.getString("name"));
			u.setAdminId(rs.getString("admin_id"));
			u.setEmpId(rs.getString("emp_id"));
			
//			u.setPassWord(rs.getString("passcode"));
			return u;
		}

		return null;
	}


}
