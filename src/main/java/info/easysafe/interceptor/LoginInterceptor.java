package info.easysafe.interceptor;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import info.easysafe.domain.UserVO;


public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse resp,
			Object handler, ModelAndView modelAndView) throws Exception{
		
		System.out.println("entered loginInterceptor postHandle.");
		HttpSession session = req.getSession();
		
//		ModelMap modelMap = modelAndView.getModelMap();
		
		Object userVO = session.getAttribute("uvo");
		System.out.println("로긴 인터셉터 포스트핸들에서 session.getAttribute하고 userVO에 집어넣은 uvo :"+userVO);
		if(userVO != null) {
			session.setAttribute(LOGIN, userVO); 
			
			if(req.getParameter("useCookie") != null) {
				logger.warn("postHandle : remember me !! ");
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); //amy �� ����.
				System.out.println("postHandle 만들어진 쿠키 : " + loginCookie);
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7); 
				resp.addCookie(loginCookie);
			}
			
			Object dest = session.getAttribute("dest");
			System.out.println("dest Object get : "+dest);
//			if(dest!= null) {
//				resp.sendRedirect((String)dest);
//			}
			resp.sendRedirect(dest!= null ? (String)dest : "/index.do");
			//dest�� �����ϱ� index�� ������. 
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		
		HttpSession session = req.getSession();
		if(session.getAttribute(LOGIN)!= null) {
			System.out.println("로긴 인터셉터 prehandle, login data clear! ");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

}
