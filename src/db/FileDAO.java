package db;

public class FileDAO {
	public int update(String sessionId, String path){
		
		DBConnection dbCon=new DBConnection();
		dbCon.createConnection();
		
		String sql = "update stu_info set img='"+path+"' where stu_id='"+sessionId+"'";
		int i=dbCon.update(sql);
		dbCon.close();
		
		return i;
	
	}
}
