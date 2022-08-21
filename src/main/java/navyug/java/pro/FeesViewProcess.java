package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import navyug.java.to.Fees;

public class FeesViewProcess {
	public static List<Fees> view(Connection conn,String roll_no,String name) throws SQLException {
		
		String sqlemp = "select * from `"+roll_no+"_"+name+"`;";
		System.out.println(sqlemp);
		PreparedStatement temp2= conn.prepareStatement(sqlemp);
		ResultSet rs = temp2.executeQuery();
		List<Fees> res = new ArrayList<Fees>();
		while(rs.next()) {
			Fees e=new Fees();
			
			e.setName(name);
			e.setRollnumber(rs.getString("roll_no"));
			e.setAmount(rs.getString("amount"));
			e.setFine(rs.getString("fine"));
			e.setCheck(rs.getString("check_fee"));
			e.setTransId(rs.getString("trans_id"));
			e.setDoneBy(rs.getString("done_by"));
			e.setSubDate(rs.getString("submission_date"));
			e.setSno(rs.getString("sno"));
			res.add(e);
		}
		return res;
}

}
