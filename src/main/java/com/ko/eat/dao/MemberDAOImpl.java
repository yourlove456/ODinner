package com.ko.eat.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ko.eat.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject SqlSession sql;

	
	@Override
	public List<MemberVO> memberList() throws Exception {
		return sql.selectList("memberMapper.memberList");
	}

	@Override
	public void memberRegister(MemberVO vo) throws Exception {
		sql.insert("memberMapper.memberRegister", vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpdate", vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberMapper.memberDelete", vo);
		
	}

	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.memberLogin", vo);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}

	@Override
	public void registerForKakao(Map<String, Object> rFK) throws Exception {
		sql.insert("memberMapper.registerForKakao", rFK);
	}
	
	@Override
	public MemberVO KakaoLogin(Map<String, Object> rFK) throws Exception {
		return sql.selectOne("memberMapper.KakaoLogin", rFK);
	}

	@Override
	public List<String> memberListForKakao() throws Exception {
		return sql.selectList("memberMapper.memberListForKakao");
	}

}
