package info.easysafe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//prehandle을 이용해 현재 사용자가 로그인한 상태인지를 체크하고 컨트롤러를 호출하게 할 것인지를 결정한다. 
public class AuthInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("login") == null) {
			logger.info("current user is not log-ined.");
			
			saveDest(req);
			
			resp.sendRedirect("/user/login");
			return false;
		}
		return true;
	}
	
	private void saveDest(HttpServletRequest req) {
		
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?"+query;
		}
		
		if (req.getMethod().equals("GET")) {
			logger.info("dest : " + (uri + query));
			req.getSession().setAttribute("dest", uri+query);
		}		
		if (req.getMethod().equals("POST")) {		//로그인 테스트 때문에 만들었다. 
			logger.info("dest : " + (uri + query));
			req.getSession().setAttribute("dest", "/app/index");
		}
	}
	
	
}
