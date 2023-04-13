package Package;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Expert {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.OracleDriver";
	String db = "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "hr";
	String pwd = "hr";
	
	public ArrayList<Vote> huboList(){
		ArrayList<Vote> huboList = new ArrayList<Vote>();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			 conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","hr","hr");
			 pstmt = 
					conn.prepareStatement("select m.M_NO ,m.M_NAME, "
							+ "P_NAME, "
							+ "decode(m.P_SCHOOL, '1','고졸','2','학사','3','석사','4','박사') as school, "
							+ "substr(m.M_JUMIN,1,6)||'-'||substr(m.M_JUMIN,7,6) as jumin, "
							+ "M_CITY,p.P_TEL1||'-'||p.P_TEL2||'-'||p.P_TEL3 as tel "
							+ "from TBL_MEMBER_2020025 m , TBL_PARTY_2020025 p "
							+ "where m.P_CODE = p.P_CODE");
			 rs = pstmt.executeQuery();
			while(rs.next()) {
				Vote v = new Vote();
				v.setM_NO(rs.getString(1));
				v.setM_NAME(rs.getString(2));
				v.setP_NAME(rs.getString(3));
				v.setP_SCHOOL(rs.getString(4));
				v.setM_JUMIN(rs.getString(5));
				v.setM_CITY(rs.getString(6));
				v.setP_TEL(rs.getString(7));
				huboList.add(v);
			}
					
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();				
			}catch(Exception e) {}
		}
		return huboList;
	}//huboList

	public ArrayList<Vote> voteList(){
		ArrayList<Vote> voteList = new ArrayList<Vote>();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost1521/xe","hr","hr");
			pstmt=conn.prepareStatement("select V_NAME, "
					+ "'19'||substr(V_JUMIN,1,2)||'년'|| "
					+ "substr(V_JUMIN,3,2)||'월'|| "
					+ "substr(V_JUMIN,5,2)||'일생' as birth, "
					+ "'만'||to_number(120-substr(V_JUMIN,1,2))||'세' as age, "
					+ "M_NO, "
					+ "decode(substr(V_JUMIN,7,1),'1','남','2','여') as gender, "
					+ "substr(V_TIME,1,2)||':'|| substr(V_TIME,3,2) as time, "
					+ "decode(V_CONFIRM ,'Y','확인','N','미확인') as confirm "
					+ "from TBL_VOTE_2020025 "
					+ "where V_AREA='제1투표장'");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Vote v = new Vote();
				v.setV_NAME(rs.getString(1));
				v.setBirth(rs.getString(2));
				v.setAge(rs.getString(3));
				v.setM_NO(rs.getString(4));
				v.setGender(rs.getString(5));
				v.setV_TIME(rs.getString(6));
				v.setV_CONFIRM(rs.getString(7));
				voteList.add(v);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch(Exception e) {}
		}
		return voteList;
	}//voteList

	public ArrayList<Vote> voteSelect(){
		ArrayList<Vote> voteSelect = new ArrayList<Vote>();
		String select = "select m.M_NO, m.M_NAME from TBL_MEMBER_2020025 m";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(db,id,pwd);
			pstmt=conn.prepareStatement(select);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Vote v = new Vote();
				v.setM_NO(rs.getString(1));
				v.setM_NAME(rs.getString(2));
				voteSelect.add(v);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close(); pstmt.close(); rs.close();
			}catch(Exception e) {}
		}
		return voteSelect;
	}//voteSelect
	
	public boolean voteInsert(Vote v) {
		//Vote vote = new Vote();
		boolean result = false;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(db,id,pwd);
			pstmt= conn.prepareStatement("insert into TBL_VOTE_2020025 values(?,?,?,?,?,?)");
			pstmt.setString(1,v.getV_JUMIN());
			System.out.println(v.getV_JUMIN());
			pstmt.setString(2,v.getV_NAME());				
			pstmt.setString(3,v.getM_NO());				
			pstmt.setString(4,v.getV_TIME());				
			pstmt.setString(5,v.getV_AREA());				
			pstmt.setString(6,v.getV_CONFIRM());				
			pstmt.executeUpdate();
			conn.commit();
			result = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close(); pstmt.close();
			}catch(Exception e) {}
			return result;
		}
		
	}//voteInsert
}//Expert
