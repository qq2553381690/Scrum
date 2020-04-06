package mysqldb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javassist.bytecode.stackmap.BasicBlock.Catch;
public class CDB {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;
	
	public void InitCon() {
		try{
			Class.forName("com.mysql.jdbc.Driver");  
			String url = "jdbc:mysql://127.0.0.1:3306/springmvc?useUnicode=true&characterEncoding=utf8";
			conn = DriverManager.getConnection(url, "root", "123456");
		} catch (Exception e){
			
		}
	}
	
	public void executeQuery(String sql){
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void executeUpdate(String sql){
		try {
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
