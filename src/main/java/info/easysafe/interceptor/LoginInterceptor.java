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
		System.out.println(userVO);
		if(userVO != null) {
			System.out.println("새로운 로그인 성공. ");
			logger.info("새로운 로그인 성공. ");
			session.setAttribute(LOGIN, userVO); //userController에서 userVO를 담아 둔 상태이므로 HttpSession에 저장한다. 
			//resp.sendRedirect("/app/index");
			
			if(req.getParameter("useCookie") != null) {
				logger.info("remember me~~");
				logger.warn("remember me 체크됨. ");
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); //amy 를 저장.
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7); //일주일이다. 
				resp.addCookie(loginCookie);
			}
			
			Object dest = session.getAttribute("dest");
			resp.sendRedirect(dest!= null ? (String)dest : "/app/index");
			//dest가 없으니까 index로 보낸다. 
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		
		HttpSession session = req.getSession();
		if(session.getAttribute(LOGIN)!= null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}

}
