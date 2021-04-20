package com.ko.eat.service;

import java.util.List;
import java.util.Map;

import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MemberVO;
import com.ko.eat.vo.SearchCriteria;

public interface BoardService {


	//게시글 작성
	public void write(BoardVO boardvo) throws Exception;
	
	public void writeContent(BoardVO boardVO) throws Exception;
	
	//게시물 목록조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	public List<BoardVO> listnew(SearchCriteria scri) throws Exception;
	public List<BoardVO> listold(SearchCriteria scri) throws Exception;
	public List<BoardVO> mypagelist(MemberVO vo) throws Exception;
	public List<BoardVO> listlike(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	//게시물 수정
	public void update(BoardVO boardvo) throws Exception;
	
	//게시물 삭제
	public void delete(int bno) throws Exception;
	public void deleteBLike(int bno) throws Exception;
	public void deleteBContent(int bno) throws Exception;

	
	//게시글 추천여부 검사
	public int checkLike(Map<String, Object> m) throws Exception;
	
	//게시글 추천
	public void addLike(Map<String, Object> m) throws Exception;
	
	//게시글 추천 제거
	public void deleteLike(Map<String, Object> m) throws Exception;
	
	//게시글 추천수
	public int countLike(int bno) throws Exception;
	
	//재료 검색 페이지
	public List<BoardVO>searchFood(SearchCriteria scri) throws Exception;

	

	





	
	
}