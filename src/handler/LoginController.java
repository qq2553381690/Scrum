package handler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mysqldb.CDB;

@Controller
public class LoginController 
{
	
	// http://127.0.0.1:8080/SpringMVC/showUserLogin
	@RequestMapping("/CheckLogin")
	public ModelAndView login(String username, String password, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		
		System.out.println(username + ":" + password);
		
		// java.sql
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");  
			String url = "jdbc:mysql://127.0.0.1:3306/springmvc?useUnicode=true&characterEncoding=utf8";
			conn = DriverManager.getConnection(url, "root", "123456");
			
			String  sql = new StringBuffer()
					           .append(" select ")
					           .append("     * ")
					           .append(" from user,authority ")
					           .append(" where user.id = ? ")
					           .append(" and password = ? ")
					           .append(" and state = 1")
					           .append(" and user.auth_id=authority.id")
					           .toString();
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, username);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			if (rs.next())
			{
				if(rs.getString(10).equals("0")){
					//商户
					modelAndView.addObject("uuid", rs.getString(1));
					session.setAttribute("uuid", rs.getString(1));
					String uuid = (String) session.getAttribute("uuid");
					CDB c1 = new CDB();
					c1.InitCon();
					
					String sql2 = "select * from shop_info where uuid=" + uuid;
					c1.executeQuery(sql2);
					
					if(c1.rs.next()){
						session.setAttribute("shop_name", c1.rs.getString(2));
					}
					
					String sql1 = "select * from goods where g_state=1 and s_i_uuid=" + uuid;
					c1.executeQuery(sql1);
					int counter = 0;
					String[][] result = new String[100][12];
					try {
						while (c1.rs.next()) {
							for (int i = 1; i <= 12; i++) {
								result[counter][i - 1] = c1.rs.getString(i);
							}
							counter++;
							for(int i = 0;i < counter;i++){
								result[i][8]="上架";
							}
						}
						if(counter > 0){
							counter--;
							session.setAttribute("flag", "true");
						}else
							session.setAttribute("flag", "false");
					} catch (Exception e) {
						System.out.print("error");
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					modelAndView.addObject("result", result);
					modelAndView.addObject("counter", counter);
					modelAndView.setViewName("editBusUpInfo");
				}else if(rs.getString(10).equals("1")){
					//老师
					modelAndView.setViewName("teaManager");
					modelAndView.addObject("uuid", rs.getString(1));
					session.setAttribute("uuid", rs.getString(1));
					session.setAttribute("user_id", rs.getString(2));
					
					String user_id = (String) session.getAttribute("user_id");
					
					CDB c1 = new CDB();
					c1.InitCon();
					
					int balance = 0;
					String sql3 = "select balance from card where state=1 and sq_id='" + user_id +"'";
					c1.executeQuery(sql3);
					try {
						if(c1.rs.next()){
							balance = c1.rs.getInt(1);
						}
					} catch (SQLException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
					
					session.setAttribute("balance", balance);
				}else{
					//学生
					modelAndView.addObject("uuid", rs.getString(1));
					session.setAttribute("uuid", rs.getString(1));
					session.setAttribute("user_id", rs.getString(2));
					String user_id = (String) session.getAttribute("user_id");
					CDB c1 = new CDB();
					c1.InitCon();
					
					String sql1 = "select count(*) from card where sq_id='" + user_id + "'";
					c1.executeQuery(sql1);
					System.out.println(sql1);
					modelAndView.addObject("user_id", user_id);
					
					
					try {
						if (c1.rs.next())
						{
							if(c1.rs.getString(1).equals("0")){
								//该学生未申请
								modelAndView.addObject("checkInfo", "已申请等待审核");
								modelAndView.setViewName("stuManager");
								System.out.println("sssss");
							}else{
							//该学生已申请
							String sql2 = "select state from card where sq_id='" + user_id + "'";
							c1.executeQuery(sql2);
								if (c1.rs.next())
								{
									if(c1.rs.getString(1).equals("0")){
										//申请未审核
										modelAndView.setViewName("nonCheckedCard");
									}else{
										modelAndView.setViewName("checkedCard");
										//申请已审核
									}
								}
								
							}
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			
				}
				//modelAndView.setViewName("success2");
				return modelAndView;
			}
			
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			modelAndView.setViewName("login"); 
			modelAndView.addObject("loginMsg", "用户名或密码错误");
			
		} catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		} finally
		{
			try 
			{
				if (rs != null)
				{
					rs.close();
				}
				
				rs = null;
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			
			try 
			{
				if (ps != null)
				{
					ps.close();
				}
				
				ps = null; 
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
			
			try 
			{
				if (conn != null)
				{
					conn.close();
				}
				
				conn = null;  
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		
		return modelAndView;
	}
}
