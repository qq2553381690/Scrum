package handler;

import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mysqldb.CDB;

@Controller
public class PerchaseController {
	@RequestMapping("/ShowShop")
	public ModelAndView ShowShop(String userNm, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select * from shop_info where state=1";
		c1.executeQuery(sql1);
		
		int counter = 0;
		String[][] result = new String[100][3];
		try {
			while (c1.rs.next()) {
				result[counter][0]=c1.rs.getString(1);
				result[counter][1]=c1.rs.getString(2);
				result[counter][2]=c1.rs.getString(3);
				counter++;
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
		
		String user_id = (String) session.getAttribute("user_id");
		int balance = 0;
		String sql2 = "select balance from card where state=1 and sq_id='" + user_id +"'";
		System.out.println(sql2);
		c1.executeQuery(sql2);
		try {
			if(c1.rs.next()){
				balance = c1.rs.getInt(1);
				System.out.println("balance"+balance);
				session.setAttribute("balance", balance);
			}
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		modelAndView.setViewName("showShop");
		return modelAndView;
	}
	
	@RequestMapping("/PrePerchaseUp")
	public ModelAndView PrePerchaseUp(String shop_uuid, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		session.setAttribute("shop_uuid", shop_uuid);
		String sql1 = "select * from goods where g_state=1 and s_i_uuid='" + shop_uuid + "'";
		System.out.println(sql1);
		c1.executeQuery(sql1);
		
		int counter = 0;
		String[][] result = new String[100][11];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 11; i++) {
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
		modelAndView.setViewName("perchaseUp");
		return modelAndView;
	}
	
	@RequestMapping("/PrePerchaseDown2Up")
	public ModelAndView PrePerchaseDown2Up( HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		String shop_uuid = (String) session.getAttribute("shop_uuid");
		String sql1 = "select * from goods where g_state=1 and s_i_uuid='" + shop_uuid + "'";
		System.out.println(sql1);
		c1.executeQuery(sql1);
		
		int counter = 0;
		String[][] result = new String[100][11];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 11; i++) {
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
		modelAndView.setViewName("perchaseUp");
		return modelAndView;
	}
	
	@RequestMapping("/PrePerchaseAbsence")
	public ModelAndView PrePerchaseAbsence( HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		
		String shop_uuid = (String) session.getAttribute("shop_uuid");
		String sql1 = "select * from goods where g_state=2 and s_i_uuid='" + shop_uuid + "'";
		c1.executeQuery(sql1);
		
		int counter = 0;
		String[][] result = new String[100][11];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 11; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
				for(int i = 0;i < counter;i++){
					result[i][8]="缺货";
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
		modelAndView.setViewName("perchaseAbsence");
		return modelAndView;
	}
	
	@RequestMapping("/Perchase")
	public ModelAndView Perchase(String id, String perchase_num, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		
		int total_num = 0;
		int buy_num = 0;
		int unit_price = 0;
		int balance = 0;
		
		String user_id = (String) session.getAttribute("user_id");
		
		String sql5 = "select balance from card where state=1 and sq_id='" + user_id +"'";
		c1.executeQuery(sql5);
		try {
			if(c1.rs.next()){
				balance = c1.rs.getInt(1);
			}
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		session.setAttribute("balance", balance);
		
		String shop_uuid = (String) session.getAttribute("shop_uuid");
		String sql1 = "select * from goods where g_state=1 and id=" + id + 
				" and s_i_uuid='" + shop_uuid + "'";
		System.out.println(sql1);
		c1.executeQuery(sql1);
		try {
			if(c1.rs.next()){
				total_num = c1.rs.getInt(10);
				buy_num = Integer.parseInt(perchase_num);
				unit_price = c1.rs.getInt(11);
				if(total_num < buy_num){
					//����������
					modelAndView.addObject("alert_str", "购买数量不能大于库存量");
				}else if(buy_num*unit_price > balance){
					//����
					modelAndView.addObject("alert_str", "余额不足");
				}else{
					String order_uuid = UUID.randomUUID().toString().replaceAll("-", "");
					String sql2 = "update goods set g_num=" + (total_num - buy_num) + 
							" where g_state=1 and id=" + id + " and s_i_uuid='" + shop_uuid + "'";
					System.out.println(sql2);
					c1.executeUpdate(sql2);
					
					String sql3 = "insert into `order` (uuid, user_uuid, g_id, g_num, g_unit_price) values ('" + 
					order_uuid + "','" + user_id + "','" + id + "','" + perchase_num + "'," + unit_price + ")";
					c1.executeUpdate(sql3);
					System.out.println(sql3);
					
					String sql6 = "update card set balance=" + Integer.toString(balance - buy_num*unit_price) + 
							" where sq_id='" + user_id +"'";
					System.out.println(sql6);
					c1.executeUpdate(sql6);
					
					session.setAttribute("balance", Integer.toString(balance - buy_num*unit_price));
					
					if(total_num - buy_num == 0){
						//û�п��
						String sql4 = "update goods set g_state=2 where g_state=1 and "
								+ "id=" + id + " and s_i_uuid='" + shop_uuid + "'";
						c1.executeUpdate(sql4);
						System.out.println(sql4);
					}
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql7 = "select * from goods where g_state=1 and s_i_uuid='" + shop_uuid + "'";
		c1.executeQuery(sql7);
		
		int counter = 0;
		String[][] result = new String[100][11];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 11; i++) {
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
		modelAndView.setViewName("perchaseUp");
		return modelAndView;
	}
	
	@RequestMapping("/ShowBusOrder")
	public ModelAndView ShowBusOrder( HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		String uuid = (String) session.getAttribute("uuid");
		System.out.println("id" + uuid);
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select user_uuid,g_name,g_ly,g_vid,shop_name,`order`.g_num,`order`.g_unit_price from goods,shop_info,`order` "
				+ "where goods.s_i_uuid=shop_info.uuid and shop_info.uuid=" + uuid
				+ " and `order`.g_id=goods.id";
		c1.executeQuery(sql1);
		int counter = 0;
		String[][] result = new String[100][8];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 7; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				result[counter][7] = Integer.toString(Integer.parseInt(result[counter][5])*Integer.parseInt(result[counter][6]));
				counter++;
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
		modelAndView.setViewName("showBusOrder");
		return modelAndView;
	}
	
	@RequestMapping("/ShowOrder")
	public ModelAndView ShowOrder( HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		String uuid = (String) session.getAttribute("uuid");
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("id" + uuid);
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select user_uuid,g_name,g_ly,g_vid,shop_name,`order`.g_num,`order`.g_unit_price from goods,shop_info,`order` "
				+ "where goods.s_i_uuid=shop_info.uuid and `order`.g_id=goods.id and `order`.user_uuid='" + user_id + "'";
		c1.executeQuery(sql1);
		int counter = 0;
		String[][] result = new String[100][8];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 7; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				result[counter][7] = Integer.toString(Integer.parseInt(result[counter][5])*Integer.parseInt(result[counter][6]));
				counter++;
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
		modelAndView.setViewName("showOrder");
		return modelAndView;
	}
}
