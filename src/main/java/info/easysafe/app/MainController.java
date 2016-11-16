package info.easysafe.app;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.ProductVO;
import info.easysafe.service.ChemService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class); 
	
	@Inject
	private ChemService service;
	
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome index! The client locale is {}.", locale);
		return "index";
	}

		
		@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
		
		return "redirect:/app/index";
	}
	
	@RequestMapping(value="/searchChem", method = RequestMethod.GET)
	@ResponseBody
	public List<ChemVO> searchChem (String key) throws Exception{
		//이름이 영문인지 구분하는 코드 필요!!! 그 경우가 아니면 한글로 판단.
		boolean iskor = false;
		  for(int i=0;i<key.length();i++){
		     if(Character.getType(key.charAt(i)) == 5) {
		    	 //한글인 경우 
		    	 iskor = true;
		     }
		  }
		  
		  List<ChemVO> list = null; 
		  if (iskor == true) {
			  //한글인 경우
			  list = service.listChemKorName(key);
			  
		  } else {
			 
		//	  list = service.listChemEngName(key);
			  System.out.println("한글아님."); //한글이 없는 경우
		  }
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/chemDetail", method = RequestMethod.GET)
	public ChemVO chemDetail(String name) throws Exception{
		
		boolean iskor = false;
		  for(int i=0;i<name.length();i++){
		     if(Character.getType(name.charAt(i)) == 5) {
		    	 //한글인 경우 
		    	 iskor = true;
		     }
		  }
		  
		 ChemVO chem = null; 
		  if (iskor == true) {
			  //한글인 경우
			  chem = service.readChemKorName(name);
			  
		  } else {
		//	  chem = service.readChemEngName(key);
			  System.out.println("한글아님."); //한글이 없는 경우
		  }
		return chem;
	}
	
	@ResponseBody
	@RequestMapping(value="/searchProduct", method = RequestMethod.GET)
	public List<ProductVO> searchProduct(String key) throws Exception{
		boolean iskor = false;
		  for(int i=0;i<key.length();i++){
		     if(Character.getType(key.charAt(i)) == 5) {
		    	 //한글인 경우 
		    	 iskor = true;
		     }
		  }
		  
		  List<ProductVO> list = null; 
		  if (iskor == true) {
			  //한글인 경우
			  list = service.listProductKorName(key);
			  
		  } else {
//			  list = service.listProductEngName(key);
			  System.out.println("한글아님."); //한글이 없는 경우
		  }
		  return list;
	}
	 

	
	@ResponseBody
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public ProductVO productDetail(String name) throws Exception{
		
		boolean iskor = false;
		  for(int i=0;i<name.length();i++){
		     if(Character.getType(name.charAt(i)) == 5) {
		    	 //한글인 경우 
		    	 iskor = true;
		     }
		  }
		  
		 ProductVO product = null; 
		  if (iskor == true) {
			  //한글인 경우
			  product = service.readProductKorName(name);
			  
		  } else {
			 
		//	  product = service.readProductEngName(key);
			  System.out.println("한글아님."); //한글이 없는 경우
		  }		
		  return product;
	}
	
	@ResponseBody
	@RequestMapping(value="/productDetailWUpc", method = RequestMethod.GET)
	public ProductVO productDetailWUpc(String upc) throws Exception{
		System.out.println(upc);
		return service.readUpc(upc);
	}
	
	
	@RequestMapping(value="/doA", method=RequestMethod.GET)
	public String doA(Locale locale, Model model) {
		System.out.println("doA! I am in Maincontroller. ");
		return "index";
	}
	
	@RequestMapping(value="/doB", method=RequestMethod.GET)
	public String doB(Locale locale, Model model) {
		System.out.println("doB! I am in Maincontroller.");
		model.addAttribute("result", "'result', added in doB method in MainController."); //모델에 result라는 이름이로 데이터를 주엇다. 
		
		return "index"; //리턴이 있으면 index.jsp를(WEB-INF/views/애 있는 ) 찾아가고 리턴이 없으면 value 안에 들어있는얘.jsp!!!!!를 찾아간다. 
	}
	
	
	 
}
