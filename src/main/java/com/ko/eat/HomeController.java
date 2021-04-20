package com.ko.eat;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ko.eat.service.BoardService;
import com.ko.eat.service.KakaoService;
import com.ko.eat.service.MemberService;
import com.ko.eat.service.ReplyService;
import com.ko.eat.service.UploadFileService;
import com.ko.eat.service.httpConnection;
import com.ko.eat.vo.MemberVO;
import com.ko.eat.vo.PageMaker;
import com.ko.eat.vo.SearchCriteria;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);   
	   @Inject
	   BoardService service;
	   
	   @Inject
	   ReplyService replyService;
	   
	   @Inject MemberService memberService;
	   
	   @Autowired
	   private KakaoService kakaoService;
	   
	   @Autowired
	   UploadFileService imageService;
	   
	   httpConnection conn = httpConnection.getInstance();
	   
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @ModelAttribute("scri")SearchCriteria scri) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("fileList", imageService.getAllFileList());
		
		   //게시판 목록 조회
			   logger.info("list^^^^");
			   if(scri.getSearchList() != null) {
				   model.addAttribute("list", service.searchFood(scri));
			   }
			   else
				   model.addAttribute("list", service.listlike(scri));
			   
			   PageMaker pageMaker = new PageMaker();
			   pageMaker.setCri(scri);
			   
			   model.addAttribute("pageMaker", pageMaker);
		
		return "home";
	}	
	

	   //메인페이지 => 로그인페이지
	   @RequestMapping(value="/loginView", method= RequestMethod.GET)
	   public String mainToLogin() throws Exception{
		   logger.info("로그인창 ㄱㄱㄱ");
		  
		  return "member/loginView";
		   
	   }
	   
	   //메인페이지 => 게시판페이지
	   @RequestMapping( value="/boardList" ,method= RequestMethod.GET)
	   public String list(Model model, @ModelAttribute("scri")SearchCriteria scri)throws Exception{
		   logger.info("게시판 ㄱㄱㄱ");
		   
		   model.addAttribute("list", service.list(scri));
		   
		   PageMaker pageMaker = new PageMaker();
		   pageMaker.setCri(scri);
		   pageMaker.setTotalCount(service.listCount(scri));
		   
		   model.addAttribute("pageMaker", pageMaker);
		   
		   return "board/list";
	   }
	   
	   
	   @RequestMapping("/upload")
	   public String getImageList(Model model) {
		   model.addAttribute("fileList", imageService.getAllFileList());
		   return "home";
	   }

	    @RequestMapping("/login")
	    public String home(@RequestParam(value = "code", required = false) String code,  HttpServletRequest request, Model model, MemberVO VO) throws Exception{
	       
	    	//원래 있던 멤버인지 비교하기 위해 리스트를 가져옴
	    	List<String> kakaoCMember = memberService.memberListForKakao();
			model.addAttribute("kakaoCMember",kakaoCMember);
			model.addAttribute("fileList", imageService.getAllFileList());
	    	HttpSession session = request.getSession();
	    	
	    	System.out.println("#########" + code);
	        String access_Token = kakaoService.getAccessToken(code);
	        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
	        
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###userInfo#### : " + userInfo.get("email"));
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));    
			session.setAttribute("KakaoMember", userInfo); 
					
			String temp = (String) userInfo.get("email");
			String kakaoId = temp.substring(0,temp.indexOf("@"));
			System.out.println(kakaoId); 
			System.out.println(kakaoCMember); 
			
	 	   	Map<String, Object> RFK = new HashMap<>();
	 	   	RFK.put("userEmail", userInfo.get("email"));
	 	   	RFK.put("userName", userInfo.get("nickname"));
	 	   	RFK.put("userId", kakaoId);
	 	   
			if(!kakaoCMember.contains(kakaoId)) memberService.registerForKakao(RFK);; 
			if(kakaoCMember.contains(kakaoId)); 
 
			MemberVO login = memberService.KakaoLogin(RFK);
			
			if(login == null) session.setAttribute("member", null);
			else session.setAttribute("member", login);
			
	        return "home";
	    }
	    
	   
		@RequestMapping(value="/logout")
		public String access(HttpSession session) throws IOException {
			
			String access_token = (String)session.getAttribute("access_token");
			Map<String, String> map = new HashMap<String, String>();
			map.put("Authorization", "Bearer "+ access_token);
			
			String result = conn.HttpPostConnection("https://kapi.kakao.com/v2/user/logout", map).toString();
			System.out.println(result);
			
			session.invalidate();
			
			return "redirect:/";
		}
	   
	   
}
