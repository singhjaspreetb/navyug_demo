package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import navyug.java.to.SuperAdmin;


public class SuperAdminProcess {
	public static SuperAdmin login(Connection conn,String userId,String passWord) throws SQLException {
//		String sql = "select * from student_auth where username = ? and password = ?";
		String sql = "select * from auth_super_admin where superadminid = '"+userId+"' and passcode = '"+passWord+"';";
//		System.out.println("select * from student_auth where roll_no = '"+userId+"' and passcode = '"+passWord+"';");
		PreparedStatement temp= conn.prepareStatement(sql);
		
//		int i=1;
//		temp.setString(i++, userId);
//		temp.setString(i++, passWord);
//		
		ResultSet rs = temp.executeQuery();
		
		if(rs.next()) {
			SuperAdmin u= new SuperAdmin();
			u.setUserName(rs.getString("name"));
			u.setAdminId(rs.getString("superadminid"));
			u.setPassWord(rs.getString("passcode"));
			return u;
		}

		return null;
	}

}
