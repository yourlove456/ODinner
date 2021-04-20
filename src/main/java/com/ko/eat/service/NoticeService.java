package com.ko.eat.service;

import java.util.List;

import com.ko.eat.vo.NoticeVO;
import com.ko.eat.vo.SearchCriteria;

public interface NoticeService {
      //게시글 작성
      public void noticeWrite(NoticeVO noticeVO) throws Exception;
      
      //게시글 목록 조회 
      public List<NoticeVO> noticeList(SearchCriteria scri) throws Exception;
      
      //게시글 총갯수
      public int noticeListCount(SearchCriteria scri) throws Exception;
      
      //게시물 조회
      public NoticeVO noticeRead(int bno) throws Exception;
      
      //게시글 수정
      public void noticeUpdate(NoticeVO noticeVO) throws Exception;
      
      //게시글 삭제
      public void noticeDelete(int bno) throws Exception;

}