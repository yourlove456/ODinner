package com.ko.eat.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ko.eat.service.BoardService;
import com.ko.eat.service.MealService;
import com.ko.eat.service.ReplyService;
import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MealVO;
import com.ko.eat.vo.MemberVO;
import com.ko.eat.vo.PageMaker;
import com.ko.eat.vo.ReplyVO;
import com.ko.eat.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger =LoggerFactory.getLogger(BoardController.class);
       
   @Inject
   BoardService service;
   
   @Inject
   ReplyService replyService;
   
   @Inject
   MealService mealService;
  
   
   //寃뚯떆�뙋 湲� �옉�꽦 �솕硫�
   @RequestMapping(value="/writeView", method= RequestMethod.GET)
    public String writeView() throws Exception{
	   logger.info("writerView~~~");
	   return "board/writeView";
   }
   
   
   //寃뚯떆�뙋 湲� �옉�꽦
   @RequestMapping(value="/write", method= RequestMethod.POST)
   public String write(BoardVO boardVO, MultipartHttpServletRequest mtfRequest) throws Exception{
	   logger.info("write ##");
	   
	   List<String> mfList = new ArrayList<String>();
	   
	   String path = "C:\\spring_0218\\spring_workspace\\duck123\\src\\main\\webapp\\resources\\images\\recipe_image\\";
	   
	      for(int i = 0; i <16; i ++) {
	          MultipartFile mf = null;
	          mf = mtfRequest.getFile("file" + i);
	          
	          
	          if(mf.isEmpty()||mf.equals(null)) {
	             mfList.add("0");
	             continue;
	          }
	          
	          String originFileName =  "b"+ i + "_" +System.currentTimeMillis()+ "_"+ mf.getOriginalFilename();
	          String saveFile = path + originFileName;
	          
	          mfList.add(originFileName);

	          try {
	             mf.transferTo(new File(saveFile));
	          }catch(Exception e) {
	             e.printStackTrace();
	          }
	       }

	   boardVO.setImgFile(mfList);

	   service.write(boardVO);
	   service.writeContent(boardVO);
	   
	   return "redirect:/board/list";
   }
   
   //寃뚯떆�뙋 紐⑸줉 議고쉶
   @RequestMapping( value="/list" ,method= RequestMethod.GET)
   public String list(Model model, @ModelAttribute("scri")SearchCriteria scri)throws Exception{
	   logger.info("list^^^^");
	   if(scri.getSearchList() != null) {
		   model.addAttribute("list", service.searchFood(scri));
	   }
	   else
		   model.addAttribute("list", service.list(scri));
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(scri);
	   pageMaker.setTotalCount(service.listCount(scri));
	   
	   model.addAttribute("pageMaker", pageMaker);
	   
	   return "board/list";
   }
   
	@RequestMapping( value="/mypage" ,method= RequestMethod.GET)
	public String mypage(MemberVO vo, Model model, HttpSession session, @ModelAttribute("scri")SearchCriteria scri) throws Exception{
	      MemberVO member = (MemberVO) session.getAttribute("member");
	      
	      model.addAttribute("member", member);
	      model.addAttribute("list", service.mypagelist(member));
	      
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setCri(scri);
	      pageMaker.setTotalCount(service.listCount(scri));
	      model.addAttribute("pageMaker", pageMaker);
	      
	      return "board/mypage";
	   }  
	
   //理쒖떊�닚 �젙�젹
   @RequestMapping(value="/newdate")
   public String newdate(Model model, @ModelAttribute("scri")SearchCriteria scri)throws Exception{
	   logger.info("list^^^^");
	   if(scri.getSearchList() != null) {
		   model.addAttribute("list", service.searchFood(scri));
	   }
	   else
		   model.addAttribute("list", service.listnew(scri));
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(scri);
	   pageMaker.setTotalCount(service.listCount(scri));
	   
	   model.addAttribute("pageMaker", pageMaker);
	   
	   return "board/list";
   }
   
   //�삤�옒�맂�닚 �젙�젹
   @RequestMapping(value="/olddate")
   public String olddate(Model model, @ModelAttribute("scri")SearchCriteria scri)throws Exception{
	   logger.info("list^^^^");
	   if(scri.getSearchList() != null) {
		   model.addAttribute("list", service.searchFood(scri));
	   }
	   else
		   model.addAttribute("list", service.listold(scri));
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(scri);
	   pageMaker.setTotalCount(service.listCount(scri));
	   
	   model.addAttribute("pageMaker", pageMaker);
	   
	   return "board/list";
   }
   
   //寃뚯떆�뙋 議고쉶
   @RequestMapping(value="/readView", method= RequestMethod.GET)
   public String read(BoardVO boardVO, @ModelAttribute("scri")SearchCriteria scri, Model model)throws Exception{
	   logger.info("read read read");
	   
	   model.addAttribute("read", service.read(boardVO.getBno()));
	   model.addAttribute("scri", scri);
	   
	   List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
	   model.addAttribute("replyList", replyList);
	   
	   
	   return "board/readView";
   }
    
   //寃뚯떆�뙋 �닔�젙酉�
   @RequestMapping(value="/updateView", method= RequestMethod.GET)
   public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception{
	   logger.info("updateView &&&");
	   
	   model.addAttribute("update", service.read(boardVO.getBno()));
	   model.addAttribute("scri", scri);
	   
	   return "board/updateView";
   }
   //寃뚯떆�뙋 �닔�젙
   @RequestMapping(value="/update", method=RequestMethod.POST)
   public String update(BoardVO boardVO, @ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr)throws Exception{
	   logger.info("update up up up");
	   
	   service.update(boardVO);
	   
	   rttr.addAttribute("page", scri.getPage());
	   rttr.addAttribute("perPageNum", scri.getPerPageNum());
	   rttr.addAttribute("searchType", scri.getSearchType());
	   rttr.addAttribute("keyword", scri.getKeyword());
	   
	   return "redirect:/board/list";
   }
   
   //寃뚯떆�뙋 �궘�젣
   @RequestMapping(value="/delete", method= RequestMethod.POST)
   public String delete(BoardVO boardVO, @ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	   logger.info("delete del del del~~~");
	   
	   service.delete(boardVO.getBno()); //�빐�떦 寃뚯떆湲� �궘�젣
	   
	   rttr.addAttribute("page",scri.getPage());
	   rttr.addAttribute("perPageNum",scri.getPerPageNum());
	   rttr.addAttribute("searchType",scri.getSearchType());
	   rttr.addAttribute("keyword",scri.getKeyword());
	   
	   return "redirect:/board/list";
   }
   
   //�뙎湲� �옉�꽦
   @RequestMapping(value="/replyWrite", method=RequestMethod.POST)
   public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	   logger.info("reply Write reply reply reply");
	   
	   replyService.writeReply(vo);
	   
	   rttr.addAttribute("bno", vo.getBno());
	   rttr.addAttribute("page", scri.getPage());
	   rttr.addAttribute("perPageNum", scri.getPerPageNum());
	   rttr.addAttribute("searchType", scri.getSearchType());
	   rttr.addAttribute("keyword", scri.getKeyword());
	   
	   return "redirect:/board/readView";
   }
   
   //�뙎湲� �닔�젙 GET
   @RequestMapping(value="/replyUpdateView", method= RequestMethod.GET)
   public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception{
	   logger.info("reply Write get get");
	   
	  model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
	  model.addAttribute("scri",scri);
	  
	  return "board/replyUpdateView";
	   
   }
   
   //�뙎湲� �닔�젙POST
   @RequestMapping(value="/replyUpdate", method=RequestMethod.POST)
   public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	   logger.info("reply Write post post post");
	   
	   replyService.updateReply(vo);
	   
	   
	   rttr.addAttribute("bno", vo.getBno());
	   rttr.addAttribute("page", scri.getPage());
	   rttr.addAttribute("perPageNum", scri.getPerPageNum());
	   rttr.addAttribute("searchType", scri.getSearchType());
	   rttr.addAttribute("keyword", scri.getKeyword());
	   
	   return "redirect:/board/readView";
   }
   
   //�뙎湲� �궘�젣 GET
   @RequestMapping(value="/replyDeleteView", method=RequestMethod.GET)
   public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model)throws Exception{
	   logger.info("reply Delete D D D D");
	   
	   model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
	   model.addAttribute("scri", scri);
	   
	   return "board/replyDeleteView";
   }
   
   //�뙎湲� �궘�젣
   @RequestMapping(value="/replyDelete", method=RequestMethod.POST)
   public String replyDelete(ReplyVO vo,SearchCriteria scri, RedirectAttributes rttr )throws Exception{
	   logger.info("reply Delete Del Del @@@");
	   
	   replyService.deleteReply(vo);
	   
	   rttr.addAttribute("bno", vo.getBno());
	   rttr.addAttribute("page", scri.getPage());
	   rttr.addAttribute("perPageNum", scri.getPerPageNum());
	   rttr.addAttribute("searchType", scri.getSearchType());
	   rttr.addAttribute("keyword", scri.getKeyword());
	   
	   return "redirect:/board/readView";
	   
   }
   
   //�옱猷뚮줈 寃��깋
   @RequestMapping(value = "/search", method = RequestMethod.GET)
   public String search(Model model, @ModelAttribute SearchCriteria scri) throws Exception {
      logger.info("searchFood==========");          //SearchCriteria : �궡�슜�쑝濡� 寃��깋, �젣紐⑹쑝濡� 寃��깋 (寃��깋 湲곗�)
      model.addAttribute("search", service.searchFood(scri));
	   
      return "board/search";
   }
   
   
   // 異붿쿇�닔 �뾽�뜲�씠�듃
   @RequestMapping(value="/updateLike", method= RequestMethod.POST)
   public String likeUpdate(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   
	   Map<String, Object> m = new HashMap<>();
	   m.put("userId", request.getParameter("userId"));
	   m.put("bno", request.getParameter("bno"));

	   int result = service.checkLike(m);
		
	   if(result == 0){ // 異붿쿇�븯吏� �븡�븯�떎硫� 異붿쿇 異붽�
			service.addLike(m);
	   }else{ // 異붿쿇�쓣 �븯���떎硫� 異붿쿇 �궘�젣
			service.deleteLike(m);
	   }
	return null;
   }
   // 異붿쿇�닔 寃��깋
   @RequestMapping(value="/countLike", method= RequestMethod.GET)
   public String likeCount(BoardVO boardVO, HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
				
		out.println(service.countLike(bno));
		out.close();
		
		return null;
   }

	//�떇�떒 由ъ뒪�듃 蹂닿린
	@RequestMapping(value="/mealPlan", method= RequestMethod.GET)
	public String mealView(MealVO mealVO, Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request) throws Exception{
		logger.info("mealPlan==============");
		model.addAttribute("scri", scri);
		model.addAttribute("meal", mealService.viewMealPlan(scri));
		return "board/mealPlan";
	}

	//�깉 �떇�떒 留뚮뱾湲�
	@RequestMapping(value="/newMeal", method = RequestMethod.POST)
	public String newMeal(MealVO mealVo, Model model) throws Exception{
		logger.info("new meal plan=========");
		mealService.newMealPlan(mealVo);
		return "redirect:/board/mealPlan";
	}

	//�떇�떒 �렪吏�
	@RequestMapping(value = "/myMealView", method = RequestMethod.GET)
	public String myMeal(MealVO mealVO, Model model) throws Exception{
		logger.info("my meal view ========");
		return "board/myMealView";
	}
	 
	 
}