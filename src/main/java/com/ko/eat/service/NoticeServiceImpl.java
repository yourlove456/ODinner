package com.ko.eat.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ko.eat.dao.NoticeDAO;
import com.ko.eat.vo.NoticeVO;
import com.ko.eat.vo.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {

   @Inject
   private NoticeDAO dao;

   @Override
   public void noticeWrite(NoticeVO noticeVO) throws Exception {
       dao.noticeWrite(noticeVO);
      
   }

   @Override
   public List<NoticeVO> noticeList(SearchCriteria scri) throws Exception {
       return dao.noticeList(scri);
   }

   @Override
   public int noticeListCount(SearchCriteria scri) throws Exception {
       return dao.noticeListCount(scri);
   }

   @Override
   public NoticeVO noticeRead(int bno) throws Exception {
       return dao.noticeRead(bno);
   }

   @Override
   public void noticeUpdate(NoticeVO noticeVO) throws Exception {
       dao.noticeUpdate(noticeVO);
      
   }

   @Override
   public void noticeDelete(int bno) throws Exception {
      dao.noticeDelete(bno);
      
   }
}