package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import navyug.java.to.Admin;

public class AddAdmin {
	public static Boolean add(Connection conn,Admin u) throws SQLException {
			String sql = "insert into auth_admin(admin_id,emp_id,name,passcode,token) values('"+u.getAdminId()+"','"+u.getEmpId()+"','"+u.getUserName()+"','"+u.getPassWord()+"','0');";
			PreparedStatement temp= conn.prepareStatement(sql);
			temp.executeUpdate();
			
		return true;
	}

}
