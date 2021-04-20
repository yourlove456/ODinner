package com.ko.eat.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ko.eat.service.NoticeService;
import com.ko.eat.vo.NoticeVO;
import com.ko.eat.vo.PageMaker;
import com.ko.eat.vo.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class NoticeController {
   private static final Logger logger =LoggerFactory.getLogger(NoticeController.class);
       
   @Inject
   NoticeService noticeService;
   
   //게시판 글 작성 화면
   @RequestMapping(value="/noticeWriteView", method= RequestMethod.GET)
    public void noticeWriteView() throws Exception{
      logger.info("writerView~~~");
   }
   
   //게시판 글 작성
   @RequestMapping(value="/noticeWrite", method= RequestMethod.POST)
   public String noticeWrite(NoticeVO noticeVO) throws Exception{
      logger.info("write ##");
      
      noticeService.noticeWrite(noticeVO);
      
      return "redirect:/board/noticeList";
   }
   
   //게시판 목록 조회
   @RequestMapping( value="/noticeList" ,method= RequestMethod.GET)
   public String noticeList(Model model, @ModelAttribute("scri")SearchCriteria scri)throws Exception{
      logger.info("list^^^^");
      
      model.addAttribute("noticeList", noticeService.noticeList(scri));
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(scri);
      pageMaker.setTotalCount(noticeService.noticeListCount(scri));
      
      model.addAttribute("pageMaker", pageMaker);
      
      return "board/noticeList";
   }
   
   //게시판 조회
   @RequestMapping(value="/noticeReadView", method= RequestMethod.GET)
   public String noticeRead(NoticeVO noticeVO, @ModelAttribute("scri")SearchCriteria scri, Model model)throws Exception{
      logger.info("read read read");
      
      model.addAttribute("noticeRead", noticeService.noticeRead(noticeVO.getBno()));
      model.addAttribute("scri", scri);
      
      return "board/noticeReadView";
   }
   
   //게시판 수정뷰
   @RequestMapping(value="/noticeUpdateView", method= RequestMethod.GET)
   public String noticeUpdateView(NoticeVO noticeVO, @ModelAttribute("scri") SearchCriteria scri,Model model) throws Exception{
      logger.info("updateView &&&");
      
      model.addAttribute("noticeUpdate", noticeService.noticeRead(noticeVO.getBno()));
      model.addAttribute("scri", scri);
      
      return "board/noticeUpdateView";
   }
   //게시판 수정
   @RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
   public String noticeUpdate(NoticeVO noticeVO, @ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr)throws Exception{
      logger.info("update up up up");
      
      noticeService.noticeUpdate(noticeVO);
      
      rttr.addAttribute("page", scri.getPage());
      rttr.addAttribute("perPageNum", scri.getPerPageNum());
      rttr.addAttribute("searchType", scri.getSearchType());
      rttr.addAttribute("keyword", scri.getKeyword());
      
      return "redirect:/board/noticeList";
   }
   
   //게시판 삭제
   @RequestMapping(value="/noticeDelete", method= RequestMethod.POST)
   public String noticeDelete(NoticeVO noticeVO, @ModelAttribute("scri")SearchCriteria scri, RedirectAttributes rttr) throws Exception{
      logger.info("delete del del del~~~");
      
      noticeService.noticeDelete(noticeVO.getBno());
      
      rttr.addAttribute("page",scri.getPage());
      rttr.addAttribute("perPageNum",scri.getPerPageNum());
      rttr.addAttribute("searchType",scri.getSearchType());
      rttr.addAttribute("keyword",scri.getKeyword());
      
      return "redirect:/board/noticeList";
   }
}