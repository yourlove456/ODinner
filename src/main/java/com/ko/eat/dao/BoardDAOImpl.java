package com.ko.eat.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MemberVO;
import com.ko.eat.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

   @Inject
   private SqlSession sqlSession;

   @Override
   public void write(BoardVO boardVO) throws Exception {
      sqlSession.insert("boardMapper.insert", boardVO);
   }
   
   public void writeContent(BoardVO boardVO) throws Exception{
	   sqlSession.insert("boardMapper.contentInsert", boardVO);
   }

   @Override
   public List<BoardVO> list(SearchCriteria scri) throws Exception {
      return sqlSession.selectList("boardMapper.listPage",scri);
   }
	@Override
	public List<BoardVO> listnew(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPagenew",scri);
	}
	@Override
	public List<BoardVO> listold(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listPageold",scri);
	}
	@Override
	public List<BoardVO> mypagelist(MemberVO vo) throws Exception {
	     return sqlSession.selectList("boardMapper.mypagelist", vo);
	   }
	@Override
	public List<BoardVO> listlike(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.listlike",scri);
	}

   @Override
   public int listCount(SearchCriteria scri) throws Exception {
      return sqlSession.selectOne("boardMapper.listCount",scri);
   }

   @Override
   public BoardVO read(int bno) throws Exception {
      return sqlSession.selectOne("boardMapper.read", bno);
   }

   @Override
   public void update(BoardVO boardVO) throws Exception {
      sqlSession.update("boardMapper.update", boardVO);
      sqlSession.update("boardMapper.contentUpdate", boardVO);
   }

   @Override
   public void delete(int bno) throws Exception {
      sqlSession.update("boardMapper.delete", bno);
   }
	@Override
	public void deleteBLike(int bno) throws Exception {
		sqlSession.delete("boardMapper.deleteBLike", bno);
	}

	@Override
	public void deleteBContent(int bno) throws Exception {
		sqlSession.delete("boardMapper.deleteBContent", bno);
	}
   
	@Override
	public int checkLike(Map<String, Object> m) throws Exception {
		return sqlSession.selectOne("boardMapper.checkLike", m);
	}
	
	@Override
	public void addLike(Map<String, Object> m) throws Exception {
		 sqlSession.insert("boardMapper.addLike", m);
	}
	
	@Override
	public void deleteLike(Map<String, Object> m) throws Exception {
		sqlSession.delete("boardMapper.deleteLike", m);
	}
	
	@Override
	public int countLike(int bno) throws Exception {
		return sqlSession.selectOne("boardMapper.countLike", bno);
	}

	@Override
	public List<BoardVO>searchFood(SearchCriteria scri) {
	if(scri.getSearchList() == null)
		return null;
	else
      return sqlSession.selectList("boardMapper.searchFood", scri);
   }
	
	@Override
	public void addSearch(String searchText) throws Exception {
		sqlSession.insert("boardMapper.addSearch", searchText);
	}

}