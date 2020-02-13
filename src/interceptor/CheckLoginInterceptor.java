package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import entity.User;

public class CheckLoginInterceptor implements  HandlerInterceptor
{
	/**
	 * 在执行handler业务处理方法之前执行
	 * previous  --> pre
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		// 从session中获取用户信息
        User user = (User)request.getSession().getAttribute("user");
		
        // 判断用户的信息  如果用的信息没有user == null 代表用户没有登录 重定向到登录页面
		if (user == null)
		{
			// 重定向到登录页面
			response.sendRedirect(request.getContextPath() + "/showUserLogin");
			return false; // 胎死腹中
		}
		
		// user != null 代表用户输入的用户名和密码正确  拦截器CheckLoginInterceptor 就放行
		return true;
	}
	
	/**
	 * 在执行handler业务处理方法之后执行
	 */
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception 
	{
		System.out.println("handler业务方法处理结束.....");
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception
	{
		System.out.println("请求结束,响应即将到达.....");
	}

}
