package entity;

public class Address 
{
	// 省份
    private String province;
     
    // 市
    private String city;

	public Address() {
		super();
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Address [province=" + province + ", city=" + city + "]";
	}
	
	
}
