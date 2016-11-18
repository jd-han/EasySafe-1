package info.easysafe.app;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.KeywordVO;
import info.easysafe.service.KeywordService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class KeywordController {

	private static final Logger logger = LoggerFactory.getLogger(KeywordController.class);

	@Inject
	private KeywordService service;

	@RequestMapping(value = "/keyword", method = RequestMethod.GET)
	public ModelAndView keywordList(String key, ModelAndView mv) throws Exception {
		
		boolean iskor = false;
		for (int i = 0; i < key.length(); i++) {
			if (Character.getType(key.charAt(i)) == 5) {
				// �ѱ��� ���
				iskor = true;
			}
		}
		List<KeywordVO> kList = null; 
		
		if (iskor == true) {
			kList = service.listKeywordKorName(key);
		} else {
			// list = service.listChemEngName(key);
			System.out.println("�ѱ۾ƴ�."); // �ѱ��� ���� ���
		}
		mv.addObject("kList", kList);
		return mv;
	}	
}
