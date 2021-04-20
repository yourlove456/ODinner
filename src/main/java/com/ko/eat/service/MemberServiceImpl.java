package com.ko.eat.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ko.eat.dao.MemberDAO;
import com.ko.eat.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject MemberDAO memberDAO;
	
	@Override
	public void memberRegister(MemberVO vo) throws Exception {
		memberDAO.memberRegister(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		memberDAO.memberUpdate(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		memberDAO.memberDelete(vo);
		
	}

	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		return memberDAO.memberLogin(vo);
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		return memberDAO.memberList();
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		return memberDAO.idChk(vo);
	}

	@Override
	public void registerForKakao(Map<String, Object> rFK) throws Exception {
		memberDAO.registerForKakao(rFK);
	}

	@Override
	public MemberVO KakaoLogin(Map<String, Object> rFK) throws Exception {
		return memberDAO.KakaoLogin(rFK);
	}

	@Override
	public List<String> memberListForKakao() throws Exception {
		return memberDAO.memberListForKakao();
	}

}
