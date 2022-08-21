package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import navyug.java.to.Asset;

public class AddAsset {
	public static Boolean add(Connection conn,Asset u) throws SQLException {
	String sql = "insert into allocated_assets(name,emp_id,asset_id,asset_name,allocation_date,return_date) values('"+u.getName()+"','"+u.getEmpId()+"','"+u.getAssetId()+"','"+u.getAssetName()+"','"+u.getDateFrom()+"','"+u.getDateTo()+"');";
	PreparedStatement temp= conn.prepareStatement(sql);
    System.out.println(temp);
	temp.executeUpdate();
	
	return true;
}

}
