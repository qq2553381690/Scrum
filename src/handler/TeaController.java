package handler;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mysqldb.CDB;

@Controller
public class TeaController {
	@RequestMapping("/PreChecked")
	public ModelAndView PreCheck(String userNm, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select sq_id,name,class,address,card.state,balance from card,user,user_stu where sq_id=user.id and "
				+ "user.id=stu_id and user.auth_id='3' and card.state='1'";
		c1.executeQuery(sql1);
		
		int counter = 0;
		String[][] result = new String[100][6];
		try {
			while (c1.rs.next()) {
				for(int i = 1;i <= 6;i++){
					result[counter][i-1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][4] = "已审核";
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
		modelAndView.setViewName("teaChecked");
		return modelAndView;
		
	}
	
	@RequestMapping("/PreNonChecked")
	public ModelAndView PreNonChecked(String userNm, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select sq_id,name,class,address,card.state,balance from card,user,user_stu where sq_id=user.id and "
				+ "user.id=stu_id and user.auth_id='3' and card.state='0'";
		c1.executeQuery(sql1);
		
		int counter = 0;
		String[][] result = new String[100][6];
		try {
			while (c1.rs.next()) {
				for(int i = 1;i <= 6;i++){
					result[counter][i-1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][4]="未审核";
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
		modelAndView.setViewName("teaNonChecked");
		return modelAndView;
		
	}
	
	@RequestMapping("/PassCheck")
	public ModelAndView PassCheck(String stu_id, String balance, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		System.out.println(stu_id);
		String sql1 = "update card set state='1',balance=" + balance + " where sq_id='" + stu_id + "'";
		System.out.println(sql1);
		c1.executeUpdate(sql1);
		
		String sql2 = "select sq_id,name,class,address,card.state,balance from card,user,user_stu where sq_id=user.id and "
				+ "user.id=stu_id and user.auth_id='3' and card.state='0'";
		c1.executeQuery(sql2);
		
		int counter = 0;
		String[][] result = new String[100][6];
		try {
			while (c1.rs.next()) {
				for(int i = 1;i <= 6;i++){
					result[counter][i-1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][4]="未审核";
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
		modelAndView.setViewName("teaNonChecked");
		return modelAndView;
		
	}



	@RequestMapping("/FailCheck")
	public ModelAndView FailCheck(String stu_id, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		System.out.println(stu_id);
		String sql1 = "update card set state='0',balance=0 where sq_id='" + stu_id + "'";
		System.out.println(sql1);
		c1.executeUpdate(sql1);
		
		String sql2 = "select sq_id,name,class,address,card.state,balance from card,user,user_stu where sq_id=user.id and "
				+ "user.id=stu_id and user.auth_id='3' and card.state='1'";
		c1.executeQuery(sql2);
		
		int counter = 0;
		String[][] result = new String[100][6];
		try {
			while (c1.rs.next()) {
				for(int i = 1;i <= 6;i++){
					result[counter][i-1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][4]="已审核";
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
		modelAndView.setViewName("teaChecked");
		return modelAndView;
		
	}
	
	@RequestMapping("/Recharge")
	public ModelAndView Recharge(String stu_id, String add_balance, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		
		int balance = 0;
		
		String sql3 = "select balance from card where sq_id='" + stu_id + "'";
		c1.executeQuery(sql3);
		try {
			if(c1.rs.next()){
				balance = c1.rs.getInt(1) + Integer.parseInt(add_balance);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql1 = "update card set balance=" + Integer.toString(balance) + " where sq_id='" + stu_id + "'";
		System.out.println(sql1);
		c1.executeUpdate(sql1);
		
		String sql2 = "select sq_id,name,class,address,card.state,balance from card,user,user_stu where sq_id=user.id and "
				+ "user.id=stu_id and user.auth_id='3' and card.state='1'";
		c1.executeQuery(sql2);
		
		int counter = 0;
		String[][] result = new String[100][6];
		try {
			while (c1.rs.next()) {
				for(int i = 1;i <= 6;i++){
					result[counter][i-1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][4]="已审核";
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
		modelAndView.setViewName("teaChecked");
		return modelAndView;
		
	}
}
