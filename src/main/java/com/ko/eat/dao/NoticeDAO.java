package com.ko.eat.dao;

import java.util.List;

import com.ko.eat.vo.NoticeVO;
import com.ko.eat.vo.SearchCriteria;

public interface NoticeDAO {

   //게시글 작성
      public void noticeWrite(NoticeVO noticevo) throws Exception;
      
      //게시물 목록조회
      public List<NoticeVO> noticeList(SearchCriteria scri) throws Exception;
      
      //게시물 총 갯수
      public int noticeListCount(SearchCriteria scri) throws Exception;
      
      //게시물 조회
      public NoticeVO noticeRead(int bno) throws Exception;
      
      //게시물 수정
      public void noticeUpdate(NoticeVO noticevo) throws Exception;
      
      //게시물 삭제
      public void noticeDelete(int bno) throws Exception;

   }