package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.PropertiesPersister;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import entity.User;

/**
 * SpringMVC 拦截器 (Interceptor)
 *    
 *    1.拦截器的概念:
 *        用于handler业务处理之前  或者  之后 或者 响应到达之前  执行拦截handler业务处理方法
 *    
 *    2.拦截器的使用
 *        1.创建一个Java类   implements  HandlerInterceptor接口
 *             实现此接口中的三个方法:
 *                preHandle(用的最多)      : 在执行handler业务处理方法之前执行
 *                postHandle              : 在执行handler业务处理方法之后执行
 *                afterCompletion(很少用)  : 在执行handler业务处理之后,响应到达之前执行
 *                
 *         2.在SpringMVC核心配置文件中  配置拦截器 <mvc:interceptors>
 *             <!-- 需要拦截谁 -->
               <mvc:mapping path="/log/*" />
               
               <!-- 不拦截谁  exclude 表示排除  -->
               <mvc:exclude-mapping path="/log/find"/>
               
               <!-- 拦截器是谁 -->
               <bean class="interceptor.LogInterceptor"></bean>
 *         
 * @author liyan
 *
 */
public class LogInterceptor  implements  HandlerInterceptor
{
	/**
	 * 在执行handler业务处理方法之前执行
	 * previous  --> pre
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		
		System.out.println("preHandle::" + request.getRequestURL() );
		if(request.getRequestURI().indexOf("showUserLogin")==-1 
				&& request.getRequestURI().indexOf("jpg") == -1
				&& request.getRequestURI().indexOf("login2")==-1 
				&& request.getRequestURI().indexOf("addCarsInfo")==-1
				&& request.getRequestURI().indexOf("editCarInfo")==-1
				&& request.getRequestURI().indexOf("modifyCarInfo")==-1
				&& request.getRequestURI().indexOf("success2")==-1
				&& request.getRequestURI().indexOf("PreAdd")==-1
			&& request.getRequestURI().indexOf("PreEdit")==-1
			&& request.getRequestURI().indexOf("PreModify")==-1
			&& request.getRequestURI().indexOf("PreReturn")==-1
					&& request.getRequestURI().indexOf("DeleteCarsInfo")==-1
					&& request.getRequestURI().indexOf("AddCarsInfo")==-1
					&& request.getRequestURI().indexOf("ModifyCarsInfo")==-1
			
			)
		{
			//
			Object userInfo=request.getSession().getAttribute("username");
			if(userInfo==null)
			{
				//response.sendRedirect(request.getContextPath()+"/login2");
				request.getRequestDispatcher("/WEB-INF/view/login2.jsp").forward(request, response);
				return false;
			}
			
		}
		// request.getRemoteAddr() 
		System.out.println(request.getRemoteAddr() + "访问了" + handler);
		
		// System.out.println("handler所在的运行时类:" + handler.getClass());
		
		// 如果返回值  为true 表示放行, 执行下一个组件(可能是下一个拦截器  也有可能是handler业务方法)
		// 如果返回值  为false 表示流程中断  胎死腹中(拦截器没有放行) 
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
