package com.ko.eat.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ko.eat.vo.NoticeVO;
import com.ko.eat.vo.SearchCriteria;


@Repository
public class NoticeDAOImpl implements NoticeDAO{
   
   @Inject
   private SqlSession sqlSession;

   @Override
   public void noticeWrite(NoticeVO noticevo) throws Exception {
       sqlSession.insert("noticeMapper.noticeWrite", noticevo);
      
   }

   @Override
   public List<NoticeVO> noticeList(SearchCriteria scri) throws Exception {
       return sqlSession.selectList("noticeMapper.listPage",scri);
   }

   @Override
   public int noticeListCount(SearchCriteria scri) throws Exception {
       return sqlSession.selectOne("noticeMapper.noticeListCount",scri);
   }

   @Override
   public NoticeVO noticeRead(int bno) throws Exception {
       return sqlSession.selectOne("noticeMapper.noticeRead", bno);
   }

   @Override
   public void noticeUpdate(NoticeVO noticevo) throws Exception {
      sqlSession.update("noticeMapper.noticeUpdate", noticevo);
      
   }

   @Override
   public void noticeDelete(int bno) throws Exception {
      sqlSession.delete("noticeMapper.noticeDelete", bno);
      
   }

}