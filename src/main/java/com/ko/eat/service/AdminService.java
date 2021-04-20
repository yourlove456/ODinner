package com.ko.eat.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.eat.dao.AdminDAO;

@Service
public class AdminService {

	@Autowired AdminDAO adminDAO;
	
	public void test(String userId, String role) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("role", role);
		adminDAO.testt(map);
	}
}
