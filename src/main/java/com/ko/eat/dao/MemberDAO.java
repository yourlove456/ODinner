package com.ko.eat.dao;

import java.util.List;
import java.util.Map;

import com.ko.eat.vo.MemberVO;

public interface MemberDAO {
	
	
	public List<MemberVO> memberList() throws Exception;
	public void memberRegister(MemberVO vo) throws Exception;
	public void memberUpdate(MemberVO vo) throws Exception;
	public void memberDelete(MemberVO vo) throws Exception;
	public MemberVO memberLogin(MemberVO vo) throws Exception;
	public int idChk (MemberVO vo) throws Exception;
	public void registerForKakao(Map<String, Object> rFK) throws Exception;
	public MemberVO KakaoLogin(Map<String, Object> rFK) throws Exception;
	public List<String> memberListForKakao() throws Exception;
}
