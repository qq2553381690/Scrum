package entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 实体bean 
 *   DB中的一张表  ---> Java实体bean(pojo/JavaBean) 
 * @author liyan
 *
 */
public class User implements Serializable  // 序列化接口 
{
	/**
	 * 以下3个注解都是jackson中jar包里面的
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	// 表示在返回json数据时,将 private String username;字段去一个别名 name
	@JsonProperty("name")
	private String username;
	
	// 表示返回json数据时,忽略此字段   起到密码保护作用
    @JsonIgnore
    private String password;
    
	private String  phone;
	 
	private String address;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	private Date birthday;
	
	// alt + shift + s  自动生成构造器 public getter/setter方法   toString()
	public User() {
		super();
	}

	public User(Integer id, String username, String password, String phone,
			String address) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.address = address;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", phone=" + phone + ", address=" + address + "]";
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
}
