package com.ko.eat.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ko.eat.dao.MealDAO;
import com.ko.eat.vo.BoardVO;
import com.ko.eat.vo.MealVO;
import com.ko.eat.vo.SearchCriteria;

@Service
public class MealServiceImpl implements MealService{

	@Inject MealDAO dao;
	@Override
	public List<MealVO> viewMealPlan(SearchCriteria scri) throws Exception {
		return dao.viewMealPlan(scri);
	}

	@Override
	public List<BoardVO> viewMealPlanDetail(int mealId) throws Exception {
		return dao.viewMealPlanDetail(mealId);
	}

	@Override
	public void newMealPlan(MealVO vo) throws Exception {
		dao.newMealPlan(vo);		
	}

	@Override
	public void addMealPlan(int mealId) throws Exception {
		dao.addMealPlan(mealId);				
	}

	@Override
	public void updateMealPlan(MealVO vo) throws Exception {
		dao.updateMealPlan(vo);		
	}

	@Override
	public void deleteMealPlan(int mealId) throws Exception {
		dao.deleteMealPlan(mealId);				
	}


}
