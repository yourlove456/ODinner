package com.ko.eat.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ko.eat.dao.BoardDAO;
import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MemberVO;
import com.ko.eat.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{

   
   @Inject
   private BoardDAO dao;
   
   //게시글 작성
   @Override
   public void write(BoardVO boardVO) throws Exception {
      dao.write(boardVO);
   }
   @Override
   public void writeContent(BoardVO boardVO) throws Exception{
	   dao.writeContent(boardVO);
   }
   
   // 게시물 목록 조회
   @Override
   public List<BoardVO> list(SearchCriteria scri) throws Exception {
      return dao.list(scri);
   }
   @Override
   public List<BoardVO> listnew(SearchCriteria scri) throws Exception {
	   return dao.listnew(scri);
   }
   @Override
   public List<BoardVO> listold(SearchCriteria scri) throws Exception{
	   return dao.listold(scri);
   }
   @Override
   public List<BoardVO> mypagelist(MemberVO vo) throws Exception {
	   return dao.mypagelist(vo);
   }
   @Override
   public List<BoardVO> listlike(SearchCriteria scri) throws Exception {
	   return dao.listlike(scri);
   }
   
   // 게시물 총갯수
   @Override
   public int listCount(SearchCriteria scri) throws Exception {
      return dao.listCount(scri);
   }
   
   //게시물 조회
   @Override
   public BoardVO read(int bno) throws Exception {
      return dao.read(bno);
   }
   
   //게시물 수정
   @Override
   public void update(BoardVO boardVO) throws Exception {
         dao.update(boardVO);
   }
   
   //게시물 삭제
   @Override
   public void delete(int bno) throws Exception {
      dao.delete(bno);
   }
   @Override
   public void deleteBLike(int bno) throws Exception {
	   dao.deleteBLike(bno);
   }
   @Override
   public void deleteBContent(int bno) throws Exception {
	   dao.deleteBContent(bno);
   }
   
   @Override
   public int checkLike(Map<String, Object> m) throws Exception {
   	return dao.checkLike(m);
   }

   @Override
   public void addLike(Map<String, Object> m) throws Exception {
	   dao.addLike(m);
   }

   @Override
   public void deleteLike(Map<String, Object> m) throws Exception {
	  dao.deleteLike(m);
   }

   @Override
   public int countLike(int bno) throws Exception {
	   return dao.countLike(bno);
   }
   
   @Override
	public List<BoardVO>searchFood(SearchCriteria scri) throws Exception{
      return dao.searchFood(scri);
   }



}