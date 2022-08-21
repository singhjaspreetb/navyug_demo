package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteFees {
	public static Boolean del(Connection conn,String sno, String id) throws SQLException {
		String sql = "delete from "+id+" where sno='"+sno+"'";
		PreparedStatement temp= conn.prepareStatement(sql);
		temp.executeUpdate();
		
	return true;
}
}
