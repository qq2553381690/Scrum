package command;

import java.util.List;

public class FormCommand
{
    // form.jspҳ���е��û���:<f:input path="name" />���Ӧ
    private String name;
    
    private String password;
    
    private Integer id;  // int(Ĭ��ֵ:0) VS Integer(������  Ĭ��ֵ:null)

    private List<String> favor;
    
    private String gender;
    
    private String month;
    
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}

	public String getPassword() 
	{
		return password;
	}

	public void setPassword(String password) 
	{
		this.password = password;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id) 
	{
		this.id = id;
	}

	public List<String> getFavor() {
		return favor;
	}

	public void setFavor(List<String> favor)
	{
		this.favor = favor;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender) 
	{
		this.gender = gender;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	
	   
   
}
