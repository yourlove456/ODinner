package com.ko.eat.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MealVO;
import com.ko.eat.vo.SearchCriteria;

@Repository
public class MealDAOImpl implements MealDAO{

	
	@Inject SqlSession sqlSession;
	
	@Override
	public List<MealVO> viewMealPlan(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("mealMapper.viewMeal", scri);
	}

	@Override
	public List<BoardVO> viewMealPlanDetail(int mealId) throws Exception {
		return sqlSession.selectList("mealMapper.viewMealDetail", mealId);
	}

	@Override
	public void newMealPlan(MealVO vo) throws Exception {
		sqlSession.insert("mealMapper.newMeal", vo);
	}

	@Override
	public void addMealPlan(int mealId) throws Exception {
		sqlSession.insert("mealMapper.addMeal", mealId);
	}

	@Override
	public void updateMealPlan(MealVO vo) throws Exception {
		sqlSession.update("mealMapper.updateMeal", vo);
	}

	@Override
	public void deleteMealPlan(int mealId) throws Exception {
		sqlSession.delete("mealMapper.deleteMeal", mealId);
	}


}
