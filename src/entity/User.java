package entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * ʵ��bean 
 *   DB�е�һ�ű�  ---> Javaʵ��bean(pojo/JavaBean) 
 * @author liyan
 *
 */
public class User implements Serializable  // ���л��ӿ� 
{
	/**
	 * ����3��ע�ⶼ��jackson��jar�������
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	
	// ��ʾ�ڷ���json����ʱ,�� private String username;�ֶ�ȥһ������ name
	@JsonProperty("name")
	private String username;
	
	// ��ʾ����json����ʱ,���Դ��ֶ�   �����뱣������
    @JsonIgnore
    private String password;
    
	private String  phone;
	 
	private String address;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	private Date birthday;
	
	// alt + shift + s  �Զ����ɹ����� public getter/setter����   toString()
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
