package com.jing.experiment.news.intercept;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


public class LoginIntercept implements HandlerInterceptor{

	/**
	 * 用filter登陆拦截
	 */
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		PrintWriter out = arg1.getWriter();  
        out.println("<html>");      
        out.println("<script>");      
        out.println("window.open ('"+arg0.getContextPath()+"admin/index.jsp','_top')");      
        out.println("</script>");      
        out.println("</html>");    
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		if(null != arg2){
		//	System.out.println(JSONObject.toString("222222", arg2));
		}
		
		String url = request.getRequestURI();  
		System.out.println("----" + url);
//		if(url.indexOf("news_list") >= 0) {
//			return true;
//		}
//		HttpSession session = request.getSession(false);
//		if(null != session){
//			String username = (String) session.getAttribute("username");
//			if(null != username) {
//				return true; 
//			}
//		}
		//arg1.sendRedirect(request.getContextPath() + "/index.jsp");
		//request.getRequestDispatcher("/index.jsp").forward(request, arg1); 
		 PrintWriter out = arg1.getWriter();  
	        out.println("<html>");      
	        out.println("<script>");      
	        out.println("window.open ('"+request.getContextPath()+"/index.jsp','_top')");      
	        out.println("</script>");      
	        out.println("</html>");    
		return false;
	}

}
