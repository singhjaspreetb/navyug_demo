package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class DeleteAsset {
	public static Boolean del(Connection conn,String sno) throws SQLException {
		String sql = "delete from allocated_assets where sno='"+sno+"'";
		PreparedStatement temp= conn.prepareStatement(sql);
		temp.executeUpdate();
		
	return true;
}
}
