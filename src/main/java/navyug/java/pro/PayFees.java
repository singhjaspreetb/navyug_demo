package navyug.java.pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import navyug.java.to.Fees;

public class PayFees {
	public static Boolean pay(Connection conn,Fees f) throws SQLException {
		String check="Success";
		if(Integer.parseInt(f.getPending_fee())< Integer.parseInt(f.getAmount()))
		{
			check="Fail";
		}else {
			Integer num=Integer.parseInt(f.getPending_fee()) - Integer.parseInt(f.getAmount());
			String sql = "update students set pending_fees='"+num+"' where roll_no='"+f.getRollnumber()+"';";
			System.out.println(sql);

			PreparedStatement temp= conn.prepareStatement(sql);
			temp.executeUpdate();
			
		}
		String sql = "insert into "+f.getRollnumber()+"_"+f.getName()+"(roll_no,fees,amount,fine,check_fee,trans_id,done_by,submission_date) values('"+f.getRollnumber()+"','"+f.getPending_fee()+"','"+f.getAmount()+"','0','"+check+"','"+f.getRollnumber()+"-id-"+f.getAmount()+"','"+f.getDoneBy()+"','"+java.time.LocalDate.now()+"');";
		System.out.println(sql);
		PreparedStatement temp= conn.prepareStatement(sql);
		temp.executeUpdate();
		
	return true;
}
}
