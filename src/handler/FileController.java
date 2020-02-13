package handler;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

// 整理包 ctrl + shift + o
@Controller
@RequestMapping("/file")
public class FileController
{
	// 当用户发送  http://localhost:8080/SpringMVC/file/showUpload
	// 时,跳转到 /WEB-INF/view/upload.jsp
	@RequestMapping("/showUpload")
    public String showUpload()
    {
    	return "addBusInfo";
    }
	
	@RequestMapping("/showUpload2")
	public ModelAndView showUpload2( HttpSession session)
    {
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("modifyBusInfo");
		String[] resultVector = (String[]) session.getAttribute("resultVector");
		modelandview.addObject("resultVector", resultVector);
    	return modelandview;
    }
	
	// http://localhost:8080/SpringMVC/file/showDownload
	@RequestMapping("/showDownload")
	public String showDownload()
	{
		return "download";
	}
	
	/**
	 * 文件下载的方式一(了解实际开发中不会用):
	 * 
	 * 在浏览器的操作中,凡是浏览器不认识的静态资源
	 * 浏览器都会默认做下载操作
	 * <a href="${pageContext.request.contextPath }/images/6.jpg">下载地址一</a>
	 * 这种方式非常不安全
	 */
	
	/**
	 * 文件下载方式二(通用)
	 * 以输出流的方式进行下载
	 * 
	 */
	@RequestMapping("/download2")
	public void download2(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException
	{
		String fileName = "6.jpg";
		
		// (1)解决要下载的文件的文件名乱码问题
		// 字符串的编码 : String ---> byte[]    fileName.getBytes()
		// 字符串的解码 : byte[] ---> String    String(byte[] bytes, String charsetName)
		// 编译期 UnsupportedEncodingException 
		fileName = new String(fileName.getBytes(), "ISO8859-1");
		
		String file = session.getServletContext().getRealPath(fileName);
		
		FileInputStream in = null;
		OutputStream out = null;
		try 
		{
			// (2) 我们需要用户看到的下载的文件名就是本来的文件名
			//     需要设置一个content-disposition
			//     content-disposition有2个 
			//        attachment: 表示以附件的方式下载文件
			//        inline:  表示打开文件
			response.setHeader("content-disposition", "attachment;fileName=" + fileName);
			
			// 文件的下载操作
			in = new FileInputStream(file);
			out = response.getOutputStream();
			
			byte[] b = new byte[1024];
			int len;
			
			// != -1表示文件一直在读取    == -1时表示文件已全部读取完成
			while ((len = in.read(b)) != -1)
			{
				// 将读取到的文件资源  写入输出流对象out中
				out.write(b, 0, len);
			}
		} catch (FileNotFoundException e) 
		{
			e.printStackTrace();
		} catch (IOException e) 
		{
			e.printStackTrace();
		} finally
		{
			// 手动关闭IO流资源  
			// 关闭的顺序  先使用的后关闭, 后使用的先关闭
			try 
			{
				if (out != null)
				{
					out.close();
				}
				out = null;   // 通知GC尽快的回收此资源
			} catch (IOException e)
			{
				e.printStackTrace();
			}
			
			try 
			{
				if (in != null)
				{
					in.close();
				}
				in = null;   // 通知GC尽快的回收此资源
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 文件下载方式三(推荐): 使用SpringMVC提供的文件下载(只能在SpringMVC框架内用)
	 */
	@RequestMapping("/download3")
	public ResponseEntity<byte[]> download3(HttpServletRequest request, HttpSession session) throws IOException
	{
		String fileName = "1.jpg";
		String realPath = session.getServletContext().getRealPath(fileName);
		
		File file = new File(realPath);
		
		// org.springframework.http.HttpHeaders
		HttpHeaders headers = new HttpHeaders();
		
		// 二进制流数据
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		
		// 文件下载的方式
		headers.setContentDispositionFormData("attachment", fileName);
		
		// new ResponseEntity(T body, MultiValueMap<String, String> headers, HttpStatus status)
		// T body  其中第一个参数:表示将要下载的文件  ---> 字节数组   FileUtils.readFileToByteArray(file);
		// MultiValueMap<String, String> headers 表示下载文件的方式
		// HttpStatus status  表示HTTP的状态是完成  HttpStatus.CREATED
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}
	
	// @RequestParam("file")中的file和upload.jsp页面中的文件<input type="file" name="file"> name="file"相对应
	@RequestMapping("/uploadMore")
	public String upload(@RequestParam("file") CommonsMultipartFile[] files, HttpSession session) throws IllegalStateException, IOException
	{
		if (files != null && files.length != 0)
		{
			for (CommonsMultipartFile file : files)
			{
				// 1.jpg
				String originalFilename = file.getOriginalFilename();
				System.out.println("原始文件名:" + originalFilename);
				
				System.out.println("文件类型:" + file.getContentType());
				
				System.out.println("文件大小:" + file.getSize());
				
				// 要上传的图片/文件 目的地
				String  realPath = session.getServletContext().getRealPath("/upload/");
				System.out.println(realPath);
				
				File f = new File(realPath);
				// 创建多层目录
				f.mkdirs();
				
				
				
				// "1.jpg"  ---> 1
			    // substring(int beginIndex, int endIndex)  [beginIndex,endIndex)
			    String prefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
			    
			    // "1.jpg"  ---> .jpg
			    String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
			    System.out.println(suffix);
			    
			    // 生成UUID, 保证文件名不会重复
			    String uuid = UUID.randomUUID().toString();
			    String fileNameOnly = prefix + uuid + suffix;
				
				// 做文件上传操作  file.transferTo(File file)
				// File(String parent, String child) 
				file.transferTo(new File(realPath, fileNameOnly));
				
				// 当我们文件上传成功之后 重定向到  upload.jsp页面
				// return "redirect:/file/showUpload";
				String path ="F:\\J2EEspaces4\\.metadata\\.me_tcat85\\webapps\\SpringMVC\\upload\\" + fileNameOnly;
				session.setAttribute("path", path);
				session.setMaxInactiveInterval(900);
			}
		}
		
		return "upload";
	}
	
	/**
	 *  单文件上传操作
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/upload")
	public String upload(@RequestParam("file") CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException
	{
		// 1.jpg
		String originalFilename = file.getOriginalFilename();
		System.out.println("原始文件名:" + originalFilename);
		
		System.out.println("文件类型:" + file.getContentType());
		
		System.out.println("文件大小:" + file.getSize());
		
		// 要上传的图片/文件 目的地
		request.getContextPath();
		System.out.println(request.getContextPath());
		String  realPath = "D:/apache-tomcat-7.0.65/webapps/SpringMVC/images/upload";
		session.setAttribute("realPath", realPath);
		System.out.println(realPath);
		
		File f = new File(realPath);
		// 创建多层目录
		f.mkdirs();
		
		// "1.jpg"  ---> 1
	    // substring(int beginIndex, int endIndex)  [beginIndex,endIndex)
	    String prefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
	    System.out.println(prefix);
	    
	    // "1.jpg"  ---> .jpg
	    String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
	    System.out.println(suffix);
	    
	    // 生成UUID, 保证文件名不会重复
	    String uuid = UUID.randomUUID().toString();
	    String fileNameOnly = prefix + uuid + suffix;
		
		// 做文件上传操作  file.transferTo(File file)
		// File(String parent, String child) 
		file.transferTo(new File(realPath, fileNameOnly));
		
		String path ="/upload/" + fileNameOnly;
		session.setAttribute("path", path);
		session.setMaxInactiveInterval(900);
		
		// 当我们文件上传成功之后 重定向到  upload.jsp页面
		return "redirect:/file/showUpload";
	}
	
	@RequestMapping("/upload2")
	public String upload2(@RequestParam("file2") CommonsMultipartFile file, HttpSession session, HttpServletRequest request) throws IllegalStateException, IOException
	{
		// 1.jpg
		String originalFilename = file.getOriginalFilename();
		System.out.println("原始文件名:" + originalFilename);
		
		System.out.println("文件类型:" + file.getContentType());
		
		System.out.println("文件大小:" + file.getSize());
		
		// 要上传的图片/文件 目的地
		request.getContextPath();
		System.out.println(request.getContextPath());
		String  realPath = "D:/apache-tomcat-7.0.65/webapps/SpringMVC/images/upload";
		session.setAttribute("realPath", realPath);
		System.out.println(realPath);
		
		File f = new File(realPath);
		// 创建多层目录
		f.mkdirs();
		
		// "1.jpg"  ---> 1
	    // substring(int beginIndex, int endIndex)  [beginIndex,endIndex)
	    String prefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
	    System.out.println(prefix);
	    
	    // "1.jpg"  ---> .jpg
	    String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
	    System.out.println(suffix);
	    
	    // 生成UUID, 保证文件名不会重复
	    String uuid = UUID.randomUUID().toString();
	    String fileNameOnly = prefix + uuid + suffix;
		
		// 做文件上传操作  file.transferTo(File file)
		// File(String parent, String child) 
		file.transferTo(new File(realPath, fileNameOnly));
		
		String path ="/upload/" + fileNameOnly;
		session.setAttribute("path", path);
		session.setMaxInactiveInterval(900);
		
		// 当我们文件上传成功之后 重定向到  upload.jsp页面
		return "redirect:/file/showUpload2";
	}
}
