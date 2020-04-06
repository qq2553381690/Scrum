package handler;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mysqldb.CDB;


@Controller
public class BusConrtroller {
	@RequestMapping("/AddBusInfo")
	public ModelAndView AddBusInfo(String g_name, String g_ly, String g_vid, String g_img, String g_simg,
			String g_label, String g_details, String g_num, String g_unit_price, String g_state, HttpSession session){
		ModelAndView  modelAndView = new ModelAndView();
		CDB c1 = new CDB();
		c1.InitCon();
		String uuid = (String) session.getAttribute("uuid");
		System.out.print(uuid);
		String sql1 = "insert into goods(g_name,g_ly,g_vid,g_img,g_simg,g_label,g_details,g_num,g_state,g_unit_price,s_i_uuid) "
				+ "values('" + g_name + "','" + g_ly + "','" + g_vid + "','" + g_img + "','" + g_simg + "','" 
				+ g_label + "','" + g_details + "'," + g_num + ",'" + g_state + "'," + g_unit_price + ",'" + uuid  + "')";
		System.out.print(sql1);
		c1.executeUpdate(sql1); 
		String sql2;
		String state_str = "";
		if(g_state.equals("0")){
			sql2 = "select * from goods where g_state=0 and s_i_uuid=" + uuid;
			state_str = "下架";
			modelAndView.setViewName("editBusDownInfo");
		}else if(g_state.equals("1")){
			sql2 = "select * from goods where g_state=1 and s_i_uuid=" + uuid;
			state_str = "上架";
			modelAndView.setViewName("editBusUpInfo");
		}else if(g_state.equals("2")){
			sql2 = "select * from goods where g_state=2 and s_i_uuid=" + uuid;
			state_str = "缺货";
			modelAndView.setViewName("editBusAbsenceInfo");
		}else{
			sql2="";
			System.out.print("error");
		}
		c1.executeQuery(sql2);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
				for(int i = 0;i < counter;i++){
					result[i][8] = state_str;
				}
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		return modelAndView;
	}
	
	@RequestMapping("/PreBusUpEdit")
	public ModelAndView preBusUpEdit( HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		String uuid = (String) session.getAttribute("uuid");
		CDB c1 = new CDB();
		c1.InitCon();
		
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
		return modelAndView;
	}
	
	@RequestMapping("/PreBusDownEdit")
	public ModelAndView preBusDownEdit( HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		String uuid = (String) session.getAttribute("uuid");
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select * from goods where g_state='0' and s_i_uuid=" + uuid;
		c1.executeQuery(sql1);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][8]="下架";
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		modelAndView.setViewName("editBusDownInfo");
		return modelAndView;
	}
	
	@RequestMapping("/PreBusAbsenceEdit")
	public ModelAndView preAbsenceDownEdit( HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		String uuid = (String) session.getAttribute("uuid");
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql1 = "select * from goods where g_state='2' and s_i_uuid=" + uuid;
		c1.executeQuery(sql1);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
			}
			for(int i = 0;i < counter;i++){
				result[i][8]="缺货";
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		modelAndView.setViewName("editBusAbsenceInfo");
		return modelAndView;
	}
	
	@RequestMapping("/PreBusModify")
	public ModelAndView PreBusModify(String state, String id, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		session.setAttribute("state", state);
		String uuid = (String) session.getAttribute("uuid");
		CDB c1 = new CDB();
		c1.InitCon();
		session.setAttribute("id", id);
		String sql1 = "select * from goods where s_i_uuid=" + uuid + " and id=" + id;
		c1.executeQuery(sql1);
		String[] resultVector = new String[12];
		try {
			if (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					resultVector[i - 1] = c1.rs.getString(i);
				}
				if(resultVector[8].equals("0"))
					resultVector[8] = "下架";
				else if(resultVector[8].equals("1"))
					resultVector[8] = "上架";
				else if(resultVector[8].equals("2"))
				resultVector[8] = "缺货";
			} 
		} catch (Exception e) {
			e.printStackTrace();
			// TODO Auto-generated catch block
		}
		modelAndView.addObject("resultVector", resultVector);
		session.setAttribute("resultVector", resultVector);
		modelAndView.setViewName("modifyBusInfo"); 
		return modelAndView;
	}
	
	@RequestMapping("/ModifyBusInfo")
	public ModelAndView ModifyBusInfo(String g_name, String g_ly, String g_vid, String g_img, String g_simg,
			String g_label, String g_details, String g_num, String g_unit_price, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		modelAndView.setViewName("editBusUpInfo"); 
		
		String id = (String) session.getAttribute("id");
		String uuid = (String) session.getAttribute("uuid");
		
		CDB c1 = new CDB();
		c1.InitCon();
		String sql1 = "update goods set g_name='" + g_name + "',g_ly='" + g_ly +
				"',g_vid='" + g_vid + "',g_img='" + g_img + "',g_simg='" + g_simg +
				"',g_label='" + g_label + "',g_details='" + g_details +
				"',g_num='" + g_num + "',g_unit_price=" + g_unit_price + " where id=" + id;
		c1.executeUpdate(sql1);
		
		String sql2;
		String state_str = "";
		String state = (String) session.getAttribute("state");
		if(state.equals("0")){
			sql2 = "select * from goods where g_state=0 and s_i_uuid=" + uuid;
			state_str = "下架";
			modelAndView.setViewName("editBusDownInfo");
		}else if(state.equals("1")){
			sql2 = "select * from goods where g_state=1 and s_i_uuid=" + uuid;
			state_str = "上架";
			modelAndView.setViewName("editBusUpInfo");
		}else if(state.equals("2")){
			sql2 = "select * from goods where g_state=2 and s_i_uuid=" + uuid;
			state_str = "缺货";
			modelAndView.setViewName("editBusAbsenceInfo");
		}else{
			sql2="";
			System.out.print("error");
		}
		c1.executeQuery(sql2);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
				for(int i = 0;i < counter;i++){
					result[i][8] = state_str;
				}
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		return modelAndView;
	}
	
	@RequestMapping("/DownBusInfo")
	public ModelAndView DownBusInfo( String id, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		modelAndView.setViewName("editBusUpInfo"); 
		
		String uuid = (String) session.getAttribute("uuid");
		
		CDB c1 = new CDB();
		c1.InitCon();
		String sql1 = "update goods set g_state='0' WHERE id=" + id;
		c1.executeUpdate(sql1); 
		
		String sql2 = "select * from goods where g_state=1 and s_i_uuid=" + uuid;
		c1.executeQuery(sql2);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		modelAndView.setViewName("editBusUpInfo");
		return modelAndView;
	}
	
	@RequestMapping("/UpBusInfo")
	public ModelAndView UpBusInfo(String state, String id, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		modelAndView.setViewName("editBusUpInfo"); 
		
		String uuid = (String) session.getAttribute("uuid");
		
		CDB c1 = new CDB();
		c1.InitCon();
		
		String sql3 = "select * from goods where id=" + id;
		c1.executeQuery(sql3);
		try {
			if(c1.rs.next())
				if(Integer.parseInt(c1.rs.getString(10)) <= 0){
					modelAndView.addObject("alert_str", "商品数量大于0才能上架");
				}else{
					String sql1 = "update goods set g_state='1' WHERE id=" + id;
					c1.executeUpdate(sql1); 
				}
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String sql2;
		if(state.equals("0")){
			sql2 = "select * from goods where g_state=0 and s_i_uuid=" + uuid;
			modelAndView.setViewName("editBusDownInfo");
		}else if(state.equals("2")){
			sql2 = "select * from goods where g_state=2 and s_i_uuid=" + uuid;
			modelAndView.setViewName("editBusAbsenceInfo");
		}else{
			sql2="";
			System.out.print("error");
		}
		c1.executeQuery(sql2);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
				for(int i = 0;i < counter;i++){
					result[i][8]=(state.equals("0"))?"下架":"缺货";
				}
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		return modelAndView;
	}
	
	@RequestMapping("/AbsenceBusInfo")
	public ModelAndView AbsenceBusInfo(String state, String id, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		modelAndView.setViewName("editBusUpInfo"); 
		
		String uuid = (String) session.getAttribute("uuid");
		
		CDB c1 = new CDB();
		c1.InitCon();
		String sql1 = "update goods set g_state='2' WHERE id=" + id;
		c1.executeUpdate(sql1); 
		String sql2;
		if(state.equals("0")){
			sql2 = "select * from goods where g_state=0 and s_i_uuid=" + uuid;
			modelAndView.setViewName("editBusDownInfo");
		}else if(state.equals("1")){
			sql2 = "select * from goods where g_state=1 and s_i_uuid=" + uuid;
			modelAndView.setViewName("editBusUpInfo");
		}else{
			sql2="";
			System.out.print("error");
		}
		c1.executeQuery(sql2);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
				for(int i = 0;i < counter;i++){
					result[i][8] = (state.equals("0"))?"下架":"上架";
				}
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		return modelAndView;
	}
	
	@RequestMapping("/DeleteBusInfo")
	public ModelAndView DeleteBusInfo(String state, String id, HttpSession session)
	{
		ModelAndView  modelAndView = new ModelAndView();
		modelAndView.setViewName("editCarsInfo"); 
		String uuid = (String) session.getAttribute("uuid");
		
		CDB c1 = new CDB();
		c1.InitCon();
		String sql1 = "delete from goods where id=" + id;
		c1.executeUpdate(sql1); 
		
		String sql3 = "commit;";
		c1.executeUpdate(sql3);
		
		String sql2;
		String state_str = "";
		if(state.equals("0")){
			sql2 = "select * from goods where g_state=0 and s_i_uuid=" + uuid;
			state_str = "下架";
			modelAndView.setViewName("editBusDownInfo");
		}else if(state.equals("1")){
			sql2 = "select * from goods where g_state=1 and s_i_uuid=" + uuid;
			state_str = "上架";
			modelAndView.setViewName("editBusUpInfo");
		}else if(state.equals("2")){
			sql2 = "select * from goods where g_state=2 and s_i_uuid=" + uuid;
			state_str = "缺货";
			modelAndView.setViewName("editBusAbsenceInfo");
		}else{
			sql2="";
			System.out.print("error");
		}
		c1.executeQuery(sql2);
		int counter = 0;
		String[][] result = new String[100][12];
		try {
			while (c1.rs.next()) {
				for (int i = 1; i <= 12; i++) {
					result[counter][i - 1] = c1.rs.getString(i);
				}
				counter++;
				for(int i = 0;i < counter;i++){
					result[i][8] = state_str;
				}
			}
			if(counter > 0){
				counter--;
				session.setAttribute("flag", "true");
			}else
				session.setAttribute("flag", "false");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelAndView.addObject("result", result);
		modelAndView.addObject("counter", counter);
		return modelAndView;
	}
	
}
