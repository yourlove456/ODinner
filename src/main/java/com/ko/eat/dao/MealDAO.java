package com.ko.eat.dao;

import java.util.List;

import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MealVO;
import com.ko.eat.vo.SearchCriteria;

public interface MealDAO {

	public List<MealVO> viewMealPlan(SearchCriteria scri) throws Exception;
	public List<BoardVO> viewMealPlanDetail(int mealId) throws Exception;
	public void newMealPlan(MealVO vo) throws Exception;
	public void addMealPlan(int mealId) throws Exception;
	public void updateMealPlan(MealVO vo) throws Exception;
	public void deleteMealPlan(int mealId) throws Exception;
	
}
