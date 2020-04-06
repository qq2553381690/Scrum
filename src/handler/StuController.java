package handler;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mysqldb.CDB;

@Controller
public class StuController {
	@RequestMapping(value="/ApplyCard")
	public ModelAndView ApplyCard(String name, String class1, String address, HttpSession session) throws UnsupportedEncodingException
	{ 
		name = new String(name.getBytes("ISO-8859-1"),"utf-8");
		class1 = new String(class1.getBytes("ISO-8859-1"),"utf-8");
		address = new String(address.getBytes("ISO-8859-1"),"utf-8");
		ModelAndView  modelAndView = new ModelAndView();
		
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		CDB c1 = new CDB();
		c1.InitCon();
		
		CDB c2 = new CDB();
		c2.InitCon();
		
		String user_id = (String) session.getAttribute("user_id");
		
		String sql1 = "select count(*) from card where sq_id='" + user_id + "'";
		c1.executeQuery(sql1);
		
		try {
			if(c1.rs.next())
				if(c1.rs.getString(1).equals("0")){
					
					System.out.print("asdda");
					String sql2 = "insert into card(card_vid,sq_id,auth_id,state) values('" + uuid +
							"','" + user_id + "',3,'0')";
					c2.executeUpdate(sql2);
					String sql3 = "insert into user_stu(stu_id,name,class,address) values('" + 
							user_id +"','" + name + "','" + class1 + "','" + address + "')";
					c2.executeUpdate(sql3);
					System.out.print("asdda");
					modelAndView.setViewName("nonCheckedCard");
					
				}else if(c1.rs.getString(1).equals("1")){
					
					String sql3 = "select state from card where sq_id='" + user_id + "'";
					c2.executeQuery(sql3);
					if(c2.rs.getString(1).equals("0")){
						
						modelAndView.setViewName("nonCheckedCard");
					}else{
						
						modelAndView.setViewName("checkedCard");
					}
				}else{
					System.out.println("error");
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping("/CheckCard")
	public ModelAndView CheckCard( HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		//�Զ�����uuid
		String stu_id = (String) session.getAttribute("stu_id");
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select state from card where sq_id='" + stu_id + "'";
		c1.executeQuery(sql1);
		
		
		
		try {
			if (c1.rs.next())
			{
				if(c1.rs.getString(1).equals("0")){
					
					modelAndView.setViewName("nonCheckedCard");
				}else{
					
					modelAndView.setViewName("checkedCard");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return modelAndView;
	}
}
