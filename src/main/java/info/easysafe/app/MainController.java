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
	@ResponseBody
	public List<ChemVO> searchChem (String key) throws Exception{
		//�̸��� �������� �����ϴ� �ڵ� �ʿ�!!! �� ��찡 �ƴϸ� �ѱ۷� �Ǵ�.
		boolean iskor = false;
		  for(int i=0;i<key.length();i++){
		     if(Character.getType(key.charAt(i)) == 5) {
		    	 //�ѱ��� ��� 
		    	 iskor = true;
		     }
		  }
		  
		  List<ChemVO> list = null; 
		  if (iskor == true) {
			  //�ѱ��� ���
			  list = service.listChemKorName(key);
			  
		  } else {
			 
		//	  list = service.listChemEngName(key);
			  System.out.println("�ѱ۾ƴ�."); //�ѱ��� ���� ���
		  }
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/chemDetail", method = RequestMethod.GET)
	public ChemVO chemDetail(String name) throws Exception{
		
		boolean iskor = false;
		  for(int i=0;i<name.length();i++){
		     if(Character.getType(name.charAt(i)) == 5) {
		    	 //�ѱ��� ��� 
		    	 iskor = true;
		     }
		  }
		  
		 ChemVO chem = null; 
		  if (iskor == true) {
			  //�ѱ��� ���
			  chem = service.readChemKorName(name);
			  
		  } else {
		//	  chem = service.readChemEngName(key);
			  System.out.println("�ѱ۾ƴ�."); //�ѱ��� ���� ���
		  }
		return chem;
	}
	
	@ResponseBody
	@RequestMapping(value="/searchProduct", method = RequestMethod.GET)
	public List<ProductVO> searchProduct(String key) throws Exception{
		boolean iskor = false;
		  for(int i=0;i<key.length();i++){
		     if(Character.getType(key.charAt(i)) == 5) {
		    	 //�ѱ��� ��� 
		    	 iskor = true;
		     }
		  }
		  
		  List<ProductVO> list = null; 
		  if (iskor == true) {
			  //�ѱ��� ���
			  list = service.listProductKorName(key);
			  
		  } else {
//			  list = service.listProductEngName(key);
			  System.out.println("�ѱ۾ƴ�."); //�ѱ��� ���� ���
		  }
		  return list;
	}
	 

	
	@ResponseBody
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public ProductVO productDetail(String name) throws Exception{
		
		boolean iskor = false;
		  for(int i=0;i<name.length();i++){
		     if(Character.getType(name.charAt(i)) == 5) {
		    	 //�ѱ��� ��� 
		    	 iskor = true;
		     }
		  }
		  
		 ProductVO product = null; 
		  if (iskor == true) {
			  //�ѱ��� ���
			  product = service.readProductKorName(name);
			  
		  } else {
			 
		//	  product = service.readProductEngName(key);
			  System.out.println("�ѱ۾ƴ�."); //�ѱ��� ���� ���
		  }		
		  return product;
	}
	
	@ResponseBody
	@RequestMapping(value="/productDetailWUpc", method = RequestMethod.GET)
	public ProductVO productDetailWUpc(String upc) throws Exception{
		System.out.println(upc);
		return service.readUpc(upc);
	}
	
	
	 
}
