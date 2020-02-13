package converter;

import org.springframework.core.convert.converter.Converter;
import entity.Address;

/**
 * 1.自定义转换器要实现一个接口Converter
 *      Converter接口中带泛型(考点):
 *           第一个参数:转换前是什么类型
 *           第二个参数:转换后是什么类型
 *           
 *           
 *  
 * @author liyan
 *
 */
public class StringToAddressConverter implements Converter<String, Address>
{
	// "江苏-南京"  ---> Address对象
	@Override
	public Address convert(String text)
	{
		if (text == null || "".equals(text))
		{
			return null;
		}
		
		// "江苏-南京"  --> {"江苏","南京"}
		String[] splitStr = text.split("-");
		
		Address address = new Address();
		address.setProvince(splitStr[0]);
		address.setCity(splitStr[1]);
		
		return address;
	}
	
}
