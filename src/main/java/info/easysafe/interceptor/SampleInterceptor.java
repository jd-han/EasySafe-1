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
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{ //마지막 핸들러는 현재 실항하려는 메소드 자체를 의미한다. 현재 실행되는 컨트롤러를 파악하거나 추가적인 메소드를 싱행하는 등의 작업이 가능하다. 
		System.out.println("...........................................pre-handle! ");
			
		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		
		System.out.println("bean is : " +method.getBean());
		System.out.println("And the Method is : " + methodObj);
		
		return true;
	}

	
	//포스트핸들은 컨트롤러 메소드 실행이 끝나고 아직 화면처리는 안된상태다. 
	//예를 들면 컨트롤러에서 model객체에 결과데이터를 저장하고 인터셉터로 postHandle해서 HttpSession에 결과를 담으면 컨트롤러에서 httpSession을 처리안해도된다. 
	@Override 
	public void postHandle(HttpServletRequest req, HttpServletResponse resp, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println(" ............................................post handle!");
		 
		Object result = modelAndView.getModel().get("result");
		
		if ( result != null) {											//"result"라는 이름으로 하나의 문자열이 보관중인데 그걸 추출해서 HttpSession 에 추가한다. 
			req.getSession().setAttribute("result", result);			//jsp 에서, ${result} 이렇게 프린트 할 수 있다. page session="false"를 삭제 한 후 사용한다. 
			resp.sendRedirect("/app/doA");
		}
	}
}

