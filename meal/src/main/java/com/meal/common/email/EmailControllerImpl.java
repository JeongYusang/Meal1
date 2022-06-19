package com.meal.common.email;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.common.controller.BaseController;
import com.meal.member.service.MemberService;
import com.meal.member.vo.MemberVO;
import com.meal.seller.service.SellerService;
import com.meal.seller.vo.SellerVO;

@Controller("EmailController")
@RequestMapping("/Email")
public class EmailControllerImpl extends BaseController {
	private static final Logger logger = LoggerFactory.getLogger(EmailControllerImpl.class);

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SellerService sellerService;
	@Autowired
	BCryptPasswordEncoder passwordEncode;
	// private 부분 처리 ( 난수 )

	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	// email 인증
	@ResponseBody
	@RequestMapping(value = "/IDemail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public Map<String,Object> FindID(@RequestParam String name, @RequestParam String email, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Map<String,Object> ResultMap = new HashMap<String,Object>();
		try {


			//이메일을 적지 않았을경우 분기
			if (email == null || email == "" ||name == null || name=="") {
				String message = "정보를 입력해주세요.";
				ResultMap.put("message", message);

			} 
				// @로 들어간 email 쪼개주기
				String[] rep = email.split("@");
				String email1 = rep[0];
				String email2 = rep[1];
				logger.info("==========================");
				logger.info("name = " + name);
				logger.info("email = " + email);
				logger.info("email1 = " + email1);
				logger.info("email2 = " + email2);
				logger.info("==========================");
				
				
				HashMap<String , Object> map = new HashMap<String,Object>();
				map.put("name", name);
				map.put("email1", email1);
				map.put("email2", email2);
				
				String id = "";
				
				
				id = memberService.FindId(map);
				if (id != null && id !="") {
					String message= "일반 회원";
					ResultMap.put("id", id);
					ResultMap.put("message", message);
					return ResultMap;
				}
				id= sellerService.FindId(map);
				if(id != null && id !="") {
					String message = "판매자";
					ResultMap.put("id", id);
					ResultMap.put("message", message);
					return ResultMap;
				}
				String Errmessage= "해당 정보의 회원이 없습니다.";
				ResultMap.put("Errmessage", Errmessage);
				return ResultMap;
		} catch (Exception e) {

			String Errmessage= "형식을 지켜주세요.";
			ResultMap.put("Errmessage", Errmessage);
			return ResultMap;
		}

	}

	// 회원가입 발송 이메일(인증키 발송)
	@ResponseBody
	@RequestMapping(value = "/emailtest.do", method = { RequestMethod.POST, RequestMethod.GET })
	public Map<String, Object> mailSendWithUserKey( @RequestParam String email,	HttpServletRequest request,HttpServletResponse response) {

		String key = getKey(false, 20);
		// String name = (String) map.get("name");
		// String email = (String) map.get("email");
		Map<String, Object> map = new HashMap<String, Object>();
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '너도 요리할 수 있어!' 입니다!</h2><br><br>" +  "<br><h2>해당 키 의 값은</h2>" + "<h1>" + key + "</h1>"
				+ "<br><br><br>(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[너도요 본인인증] 회원가입 인증 메일입니다.", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		
			String message = "해당 이메일로 전송이 완료되었습니다.";
		
			map.put("key", key);
			map.put("message", message);
			return map;
		} catch (MessagingException e) {
			e.printStackTrace();
			String message = "오류가 발생하였습니다.";
			map.put("message", message);
			return map;
		}
	}

	// 아작스 사용컨트롤러
	// 비밀번호찾기(인증페이지 발송)
	@ResponseBody
	// @ResponseBody를 하지않을경우 해당부분에 관하여 AJAX에서 정보를 받아오지 못함
	@RequestMapping(value = "/FindPW.do", method = { RequestMethod.POST, RequestMethod.GET })
	public Map<String, Object> FindPWResult(@RequestParam String id, @RequestParam String email,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
	
		logger.info("===================================");
		logger.info("email = " + email);
		logger.info("id = " + id);
		logger.info("주소 = " + request.getContextPath());
		logger.info("===================================");

		// 이부분에 (멤버/셀러) 아이디와 이메일의 유효성을 찾을수 있는 메소드 삽입.
		String[] rep = email.split("@");
		String email1 = rep[0];
		String email2 = rep[1];
		HashMap<String, Object> FindPwMap = new HashMap<String, Object>();
		FindPwMap.put("id", id);
		FindPwMap.put("email1", email1);
		FindPwMap.put("email2", email2);

		MemberVO memberVO = (MemberVO) memberService.FindPW(FindPwMap);
		SellerVO sellerVO = (SellerVO) sellerService.FindPW(FindPwMap);

		try {
			if (memberVO != null || sellerVO != null) {

				MimeMessage mail = mailSender.createMimeMessage();
				String htmlStr = "<h2>안녕하세요 '너도 요리할 수 있어' 입니다!</h2><br><br>" + "<h3>" + id + "님</h3>" + "<a href='"
						+ "http://localhost:8080" + request.getContextPath() + "/Email/FindPwResult.do?id=" + id
						+ "'>" + "<p>인증하기 버튼을 누를경우 비밀번호 변경창으로 이동합니다. </p></a>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
				mail.setSubject("[본인인증] " + id + "님의 인증메일입니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(email));
				mailSender.send(mail);
				String message = "해당 이메일로 비밀번호 변경요청이 발송되었습니다.";
				resultMap.put("message", message);

				return resultMap;
			} else {
				String message = "해당하는 정보가 없습니다.";
				resultMap.put("message", message);
				return resultMap;
			}

		} catch (MessagingException e) {
			e.printStackTrace();
			String result = "이메일 형식을 지켜주세요.";
			resultMap.put("result", result);
			return resultMap;
		}

	}

	// 이메일내의 버튼 클릭시 들어오는 메소드 !
	@RequestMapping(value = "/FindPwResult.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FindPwResult(@RequestParam String id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = memberService.decode(id);
		SellerVO sellerVO = sellerService.decode(id);
		if (memberVO != null) {
			mav.addObject("memberVO", memberVO);

		} else if (sellerVO != null) {
			mav.addObject("sellerVO", sellerVO);
		}
		mav.setViewName("/email/PwView");
		// 비밀번호 변경창으로 이동
		return mav;
	}

	// 비밀번호 변경창에서 들어오는 메소드
	
	@RequestMapping(value = "/FindPwLastResult.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView FindPwLastResult(@RequestParam String id,@RequestParam String pw, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = memberService.decode(id);
		SellerVO sellerVO = sellerService.decode(id);

		String encodePW = passwordEncode.encode(pw);
		if (memberVO != null) {
		
			memberVO.setU_pw(encodePW);
			memberService.updateMember(memberVO);
			mav.addObject("memberVO", memberVO);

		} else if (sellerVO != null) {
			sellerVO.setS_pw(encodePW);
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("id", id);
			map.put("pw", encodePW);
			
			sellerService.updateSeller(map);
			mav.addObject("sellerVO", sellerVO);
		}
		String message ="비밀번호 변경이 완료되었습니다.";
		mav.addObject("message", message);
		mav.setViewName("/main/loginForm");
		return mav;
	}

}
