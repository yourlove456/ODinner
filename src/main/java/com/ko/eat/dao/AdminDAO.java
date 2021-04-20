package com.ko.eat.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	public void testt(HashMap<String, Object> map) {
		String sql = "update sr_member set verify=? where userid=?";
		jdbcTemplate.update(sql, map.get("role"), map.get("userId"));
	}
}
