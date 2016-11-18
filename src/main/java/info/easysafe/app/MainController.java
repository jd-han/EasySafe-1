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
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.ProductVO;
import info.easysafe.domain.UserVO;
import info.easysafe.service.ChemService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Inject
	private ChemService service;

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {
		logger.info("Welcome index! The client locale is {}.", locale);
//		UserVO uvo = new UserVO();
//		uvo.setUname("user01");
//		model.addAttribute("uvo", uvo);
		return "index";
	}

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		// Date date = new Date();
		// DateFormat dateFormat =
		// DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG,
		// locale);
		//
		// String formattedDate = dateFormat.format(date);
		//
		// model.addAttribute("serverTime", formattedDate );

		return "redirect:/index";
	}
	
	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView searchChem(String key, ModelAndView mv) throws Exception {
		System.out.println("서치켐.");
		boolean iskor = false;
		for (int i = 0; i < key.length(); i++) {
			if (Character.getType(key.charAt(i)) == 5) {
				// 한글인 경우.
				iskor = true;
			}
		}

		List<ChemVO> cList = null;
		List<ProductVO> pList = null;
		if (iskor == true) {
			cList = service.listChemKorName(key);
			pList = service.listProductKorName(key);
		} else {
			// list = service.listChemEngName(key);
			System.out.println("占쎈쐻占쎈뼩疫뀐옙占쎈툡占쎈솇占쎌굲."); // 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
		}
		mv.addObject("chemList", cList);
		mv.addObject("proList", pList);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/chemDetail.do", method = RequestMethod.GET)
	public ModelAndView chemDetail(String name, ModelAndView mv) throws Exception {
		System.out.println("�뜝�럡�뎽占쎄껀熬곣뫕留믣뜝�럡�돪 �뜝�럥援뜹뜝�럥�꽑�뜝�럩湲� : " + name);
		boolean iskor = false;
		for (int i = 0; i < name.length(); i++) {
			if (Character.getType(name.charAt(i)) == 5) {
				iskor = true;
			}
		}

		ChemVO chem = null;
		if (iskor == true) {
			chem = service.readChemKorName(name);

		} else {
			// chem = service.readChemEngName(key);
			System.out.println("占쎈쐻占쎈뼩疫뀐옙占쎈툡占쎈솇占쎌굲."); 
		}
		mv.addObject("chemResult", chem);
		return mv;
	}

	/*@ResponseBody
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public List<ProductVO> searchProduct(String key) throws Exception {
		boolean iskor = false;
		for (int i = 0; i < key.length(); i++) {
			if (Character.getType(key.charAt(i)) == 5) {
				// 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
				iskor = true;
			}
		}

		List<ProductVO> list = null;
		if (iskor == true) {
			// 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
			list = service.listProductKorName(key);

		} else {
			// list = service.listProductEngName(key);
			System.out.println("占쎈쐻占쎈뼩疫뀐옙占쎈툡占쎈솇占쎌굲."); // 占쎈쐻占쎈뼩繹먮씮�굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈짗占쎌굲 占쎈쐻占쎈짗占쎌굲占쎈쐻�뜝占�
		}
		return list;
	}*/

	@ResponseBody
	@RequestMapping(value = "/productDetail.do", method = RequestMethod.GET)
	public ModelAndView productDetail(String name, ModelAndView mv) throws Exception {

		boolean iskor = false;
		for (int i = 0; i < name.length(); i++) {
			if (Character.getType(name.charAt(i)) == 5) {
				iskor = true;
			}
		}

		ProductVO product = null;
		if (iskor == true) {
			product = service.readProductKorName(name);

		} else {

			// product = service.readProductEngName(key);
			System.out.println("占쎈쐻占쎈뼩疫뀐옙占쎈툡占쎈솇占쎌굲."); 
		}
		//System.out.println(product.getComponents());
		mv.addObject("productResult", product);
		String[] compos = product.getComponents().split(",");
		for(int i = 0 ; i < compos.length ; i++)
		{
			compos[i] = compos[i].trim();
			System.out.println(i + " �뵓怨뺣쐠占쎈윯 " + compos[i]);
		}
		mv.addObject("components", (String[])compos);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/productDetailWUpc.do", method = RequestMethod.GET)
	public ProductVO productDetailWUpc(String upc) throws Exception {
		System.out.println(upc);
		return service.readUpc(upc);
	}

}
