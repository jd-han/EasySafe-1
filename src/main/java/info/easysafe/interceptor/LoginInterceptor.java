package info.easysafe.interceptor;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
			Object handler, ModelAndView modelAndView ) throws Exception{
		
		HttpSession session = req.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		
		Object userVO = modelMap.get("userVO");
		
		if(userVO != null) {
			logger.info("새로운 로그인 성공. ");
			session.setAttribute(LOGIN, userVO); //userController에서 userVO를 담아 둔 상태이므로 HttpSession에 저장한다. 
			//resp.sendRedirect("/app/index");
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
