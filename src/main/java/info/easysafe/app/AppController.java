package info.easysafe.app;

import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import info.easysafe.domain.ChemVO;
import info.easysafe.domain.NoticeVO;
import info.easysafe.domain.ProductVO;
import info.easysafe.service.ChemService;

@Controller
@RequestMapping("/app")
public class AppController {
private static final Logger logger = LoggerFactory.getLogger(AppController.class); 
	
	@Inject
	private ChemService service;
	
	@ResponseBody
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public List<NoticeVO> listAllNotice (Model model) throws Exception{
		logger.info("공지사항 리스트 보기");
		return service.listNotice();
	}
		
	@RequestMapping(value="/searchChem.do", method = RequestMethod.GET)
	@ResponseBody
	public List<ChemVO> searchChem (String key, Model model) throws Exception{
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
			 
			  System.out.println("�ѱ۾ƴ�."); //�ѱ��� ���� ���
		  }
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/chemDetail.do", method = RequestMethod.GET)
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
	@RequestMapping(value="/searchProduct.do", method = RequestMethod.GET)
	public List<ProductVO> searchProduct(String key) throws Exception{
		logger.info("searchProduct.do : "+key);
		List<ProductVO> list = null; 
		list = service.listProductKorName(key);
		return list;
/*		boolean iskor = false;
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
		  return list;*/
	}
	 
	

	
	@ResponseBody
	@RequestMapping(value="/productDetail.do", method = RequestMethod.GET)
	public ProductVO productDetail(String name) throws Exception{
		logger.info("productDetail.do : "+name);
		return service.readProductKorName(name);
/*		boolean iskor = false;
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
		  return product;*/
	}
	
	@ResponseBody
	@RequestMapping(value = "/productDetailWUpc.do", method = RequestMethod.GET)
	public ProductVO productDetailWUpc(String upc) throws Exception {
		logger.info("productDetailWUpc : "+upc);
		return service.readUpc(upc);
	}
	
	@ResponseBody
	@RequestMapping(value = "/productListSelectByUpc.do", method = RequestMethod.GET)
	public List<ProductVO> productListSelectByUpc(String upc) throws Exception {
		logger.info("productListSelectByUpc : "+upc);
		return service.productListSelectByUpc(upc);
	}
	
	@ResponseBody
	@RequestMapping(value="/getAvg.do", method=RequestMethod.GET)
	public ChemVO getAverageByName(String korkey) throws Exception {
		System.out.println("이름으로 Average 찾기");
		return service.readChemKorName(korkey);
	}
	
	@ResponseBody
	@RequestMapping(value="/getProductWCompo.do", method=RequestMethod.GET)
	public List<ProductVO> getProductWCompo(String compo) throws Exception{
		System.out.println("component로 product 찾기");
		return service.listProductWCompo(compo);
	}
	
	// 메일 발송 기능
	@RequestMapping(value="/emailSend.do", method=RequestMethod.POST)
	public void emailSendPost(@RequestParam("emailTo")String toAddr, @RequestParam("emailSubject")String esubject, @RequestParam("emailContent")String econtent) throws Exception {
/*
		SimpleEmail  email = new SimpleEmail();
		
		email.setHostName("www.easysafe.info");
		email.setSmtpPort(25);
		email.setFrom("admin@easysafe.info", "Administrator");
		email.setSSL(true);
		email.setAuthentication("savio", "savio");
		
		email.addTo(toAddr, "고객님");
		email.setSubject(esubject);
		email.setMsg(econtent);
		
		email.send();
*/
        // 메일 관련 정보
        String host = "www.easysafe.info";	// mail server hostname
        final String username = "savio";	// username for SMTP
        final String password = "savio";	// password for SMTP
        int port=25;	// SMTP port number
        
        System.out.println("email address to : " + toAddr);
        System.out.println("email subject : " + esubject);
        System.out.println("email content : " + econtent);
         
        // 메일 내용
        String recipient = toAddr;
        String subject = esubject;
        String body = econtent;
         
        Properties props = System.getProperties();
         
        
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "false");
        props.put("mail.smtp.ssl.trust", host);
          
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug
          
        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("admin@easysafe.info"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);
	}
	
	
	@RequestMapping(value="/emailSend.do", method=RequestMethod.GET)
	public String emailSendGet() throws Exception {
		return "email";
	}

}
