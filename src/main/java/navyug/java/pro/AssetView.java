package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import navyug.java.to.Asset;

public class AssetView {
	public static List<Asset> getAssets(Connection conn) throws SQLException{
		String sqlemp = "select * from allocated_assets;";
		PreparedStatement temp2= conn.prepareStatement(sqlemp);
		System.out.println(sqlemp);
		ResultSet rs = temp2.executeQuery();
		List<Asset> res = new ArrayList<Asset>();
		while(rs.next()) {
			Asset e=new Asset();
			
			e.setName(rs.getString("name"));
			e.setAssetName(rs.getString("asset_name"));
			e.setAssetId(rs.getString("asset_id"));
			e.setEmpId(rs.getString("emp_id"));
			e.setDateFrom(rs.getString("allocation_date"));
			e.setSno(rs.getString("sno"));
			e.setDateTo(rs.getString("return_date"));

			res.add(e);

		}
		return res;
}
}
