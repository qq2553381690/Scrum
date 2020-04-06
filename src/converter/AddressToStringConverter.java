package converter;

import org.springframework.core.convert.converter.Converter;
import entity.Address;

/**
 * 1.自定义转换器要实现一个接口Converter<Address, String>
 *      Converter接口中带泛型:
 *           第一个参数:转换前是什么类型
 *           第二个参数:转换后是什么类型
 *  
 * @author liyan
 *
 */
public class AddressToStringConverter implements Converter<Address, String>
{
	// Address对象   --->  "江苏-扬州" String
	@Override
	public String convert(Address address) 
	{
		if (address == null)
		{
			return null;
		}
		
		return address.getProvince() + "-" + address.getCity();
	}

}
