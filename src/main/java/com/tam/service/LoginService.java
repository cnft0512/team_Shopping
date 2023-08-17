package com.tam.service;

import com.tam.model.MemberVO;

public interface LoginService {
  
	// 로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;

	// 관리자 여부 확인
	public MemberVO adminCk(MemberVO member) throws Exception;
	
}

