package handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import command.FormCommand;
import entity.User;

@Controller
@RequestMapping("/form")
public class FormController 
{
	@RequestMapping("/show")
	public String show(FormCommand fromCommand)
	{
		// 设置 form.jsp页面中的所有默认值
		
		fromCommand.setName("xiaofeng");
		fromCommand.setPassword("123456");
		fromCommand.setId(100);
		
		// 爱好有多个: 数组(不能动态的添加元素) 或者  集合(可以动态的添加数据)
		List<String> favorList = new ArrayList<String>();
		// 往List中添加值
		favorList.add("1");
		favorList.add("2");
		favorList.add("3");
		favorList.add("4");
		fromCommand.setFavor(favorList);
		
		fromCommand.setGender("2");  // 默认男  和 form.jsp页面中的 <f:radiobutton path="gender" value="1" label="男" /> 相对应
		
		
		fromCommand.setMonth("2");
		
		return "form";
	}
	
	// @ModelAttribute 在Controller中的所有方法执行之前调用  加载数据用
	// @ModelAttribute(key) 和 form.jsp中的<f:checkboxes items="${key }" path="favors"/> items属性值相对应
	@ModelAttribute("favorsMap")
	public Map<String, String> loadFavors()
	{
		Map<String, String> favors = new TreeMap<String, String>();
		
		// 往Map中添加数据用put
		favors.put("1", "吃");
		favors.put("2", "喝");
		favors.put("3", "嫖");
		favors.put("4", "赌");
		
		return favors;
	}
	
	@ModelAttribute("userList")
	public List<User> LoadUser()
	{
		List<User> userList = new ArrayList<User>();
		
		User user1 = new User();
		user1.setId(1);
		user1.setUsername("admin");
		
		
		User user2 = new User();
		user2.setId(2);
		user2.setUsername("alice");
		
	
		
		userList.add(user1);
		userList.add(user2);
		
		return userList;
	}
	
	@ModelAttribute("monthList")
	public List<String> loadMonth()
	{
		List<String> mList = new ArrayList<String>();
		
		mList.add("1");
		mList.add("2");
		mList.add("3");
		mList.add("4");
		
		return mList;
	}
	
	
	@RequestMapping("/submit")
    public String submit(FormCommand fromCommand)
    {
		System.out.println("name:" + fromCommand.getName());
		System.out.println("password:" + fromCommand.getPassword());
		System.out.println("hidden:" + fromCommand.getId());
		System.out.println("favorList:" + fromCommand.getFavor());
		
		System.out.println("gender:" + fromCommand.getGender());
		
		System.out.println("month:" + fromCommand.getMonth());
		
    	return "redirect:show";  // 重定向到form.jsp页面
    }
}
