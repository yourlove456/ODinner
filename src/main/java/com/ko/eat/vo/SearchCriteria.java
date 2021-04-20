package com.ko.eat.vo;

import java.util.ArrayList;
import java.util.List;


public class SearchCriteria extends Criteria {
	
	private String searchType="";
	private String keyword="";
	private ArrayList<String> searchList;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public ArrayList<String> getSearchList() {
		return searchList;
	}
	public void setSearchList(ArrayList<String> searchList) {
		this.searchList = searchList;
	}
}
