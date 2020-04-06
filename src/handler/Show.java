package handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Show {
	@RequestMapping("/PreLogin")    
	public String showPreLogin()
    {
    	return "preLogin";
    }
	
	@RequestMapping("/Login")    
	public String showLogin()
    {
    	return "login";
    }
	
	@RequestMapping("/BusManager")    
	public String showBusManager()
    {
    	return "busManager";
    }
	
	@RequestMapping("/PreReturn")
	public String PreReturn()
    {
    	return "busManager";
    }
	
	@RequestMapping("/PreBusAdd")
	public String PreBusAdd()
    {
    	return "addBusInfo";
    }
	
	@RequestMapping("/StuManager")
	public String StuManager()
    {
    	return "stuManager";
    }
	
	@RequestMapping("/TeaManager")
	public String TeaManager()
    {
    	return "teaManager";
    }
}
