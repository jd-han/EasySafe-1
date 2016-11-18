package info.easysafe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//prehandle�� �̿��� ���� ����ڰ� �α����� ���������� üũ�ϰ� ��Ʈ�ѷ��� ȣ���ϰ� �� �������� �����Ѵ�. 
public class AuthInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("login") == null) {
			logger.info("current user is not log-ined.");
			System.out.println("로그인 되지 않은 상태에서 로그인을 요하는 페이지에 접근함. -AuthIntercepter");
			
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
		if (req.getMethod().equals("POST")) {		
			logger.info("dest : " + (uri + query));
			req.getSession().setAttribute("dest", "/app/index");
		}
	}
	
	
}
