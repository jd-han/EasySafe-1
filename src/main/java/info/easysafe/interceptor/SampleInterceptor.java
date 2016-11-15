package info.easysafe.interceptor;

import java.lang.reflect.Method;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SampleInterceptor extends HandlerInterceptorAdapter{
		
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{ //������ �ڵ鷯�� ���� �����Ϸ��� �޼ҵ� ��ü�� �ǹ��Ѵ�. ���� ����Ǵ� ��Ʈ�ѷ��� �ľ��ϰų� �߰����� �޼ҵ带 �����ϴ� ���� �۾��� �����ϴ�. 
		System.out.println("...........................................pre-handle! ");
			
		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		
		System.out.println("bean is : " +method.getBean());
		System.out.println("And the Method is : " + methodObj);
		
		return true;
	}

	
	//����Ʈ�ڵ��� ��Ʈ�ѷ� �޼ҵ� ������ ������ ���� ȭ��ó���� �ȵȻ��´�. 
	//���� ��� ��Ʈ�ѷ����� model��ü�� ��������͸� �����ϰ� ���ͼ��ͷ� postHandle�ؼ� HttpSession�� ����� ������ ��Ʈ�ѷ����� httpSession�� ó�����ص��ȴ�. 
	@Override 
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println(" ............................................post handle!");
		 
		Object result = modelAndView.getModel().get("result");
		
		if ( result != null) {											//"result"��� �̸����� �ϳ��� ���ڿ��� �������ε� �װ� �����ؼ� HttpSession �� �߰��Ѵ�. 
			req.getSession().setAttribute("result", result);			//jsp ����, ${result} �̷��� ����Ʈ �� �� �ִ�. page session="false"�� ���� �� �� ����Ѵ�. 
			resp.sendRedirect("/app/doA");
		}
	}
}

