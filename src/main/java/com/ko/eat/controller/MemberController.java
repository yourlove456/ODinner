package com.ko.eat.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ko.eat.service.AdminService;
import com.ko.eat.service.MemberService;
import com.ko.eat.vo.MemberVO;
import com.ko.eat.vo.PageMaker;
import com.ko.eat.vo.SearchCriteria;

@Controller
@RequestMapping("/member/*")
public class MemberController{
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject MemberService service;
	@Autowired AdminService adminService;
	
	
	// 아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="/idChk", method = RequestMethod.POST)
		public int idChk(MemberVO vo) throws Exception {
			int result = service.idChk(vo);
			return result;
		}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception{
		logger.info("getRegister==========");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception{
		logger.info("postRegister==========");
		service.memberRegister(vo);
		return "redirect:/loginView";
	}

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void getLogin() throws Exception{
		logger.info("getLogin==========");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String postLogin(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("postLogin==========");
		
		HttpSession session = request.getSession();
		MemberVO login = service.memberLogin(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
		}
		else {
			session.setAttribute("member", login);
		}
		
		
		
		return "redirect:/loginView";
	}
	
	@RequestMapping(value= "/loginView", method = RequestMethod.GET)
	public String loginView() throws Exception{
		return "member/loginView";
	}

	   
	@RequestMapping(value="/admin", method= RequestMethod.GET)
	public String admin(Model model) throws Exception{
		 logger.info("관리자 모드 온");
		 List<MemberVO> admin = service.memberList();
		  model.addAttribute("admin",admin);
		  return "member/admin";
	   }
	   
	@RequestMapping(value = "/admin/role/{userId}/{role}")
	public String changeRole(@PathVariable String userId, @PathVariable String role) {
		adminService.test(userId,role);
	    return "redirect:/member/admin";
	}
	
	@RequestMapping(value="/manager", method= RequestMethod.GET)
	public String manager(Model model) throws Exception{
		 logger.info("매니저 모드 온");
		 List<MemberVO> admin = service.memberList();
		  model.addAttribute("admin",admin);
		  return "member/manager";
	   }
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getLogout(HttpSession session) throws Exception{
		logger.info("getLogin==========");

		session.invalidate();
		
		return "redirect:/"; //자신의 화면에 있고 싶으면 null
	}
	
	
	@RequestMapping(value= "/memberUpdateView", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "member/memberUpdateView";
	}
	
	
	@RequestMapping(value="/memberUpdate", method= RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		
		service.memberUpdate(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "member/memberDeleteView";
	}
	
	@RequestMapping( value="/memberDelete", method= RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getUserPass();
		String voPass = vo.getUserPass();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
		}
		
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
	}

}
