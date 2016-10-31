package info.easysafe.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import info.easysafe.domain.ChemVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "redirect:/static/index.html";
	}
	
	@RequestMapping(value="/searchChem", method = RequestMethod.GET)
	public List<ChemVO> searchChem(String key) throws Exception{
		//�̸��� �������� �����ϴ� �ڵ� �ʿ�!!! �� ��찡 �ƴϸ� �ѱ۷� �Ǵ�. 
		
//		if (�̸��� �����̸�) {
//			�����˻�
//		} else{
//			�ѱ��� ��� �˻�.
//		}
		return null;
	}
	
//	@RequestMapping(value="/chemList", method = RequestMethod.GET)
//	public void chemList(){
//		
//	}
	
	@RequestMapping(value="/chemDetail", method = RequestMethod.GET)
	public ChemVO chemDetail(String name) throws Exception{
		
		return null;
	}
	
	
	
	@RequestMapping(value="/searchProduct", method = RequestMethod.GET)
	public void searchProduct(){
		
	}
	
//	@RequestMapping(value="/productList", method = RequestMethod.GET)
//	public void productLsit(){
//		
//	}
	
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public void productDetail(){
		
	}
}
