package info.easysafe.app;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/history")
public class HistoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(HistoryController.class); 
	
	@RequestMapping(value="/history.do", method = RequestMethod.GET)
	public void mainView () throws Exception{
		logger.info("history Page 진입");
	}
}
