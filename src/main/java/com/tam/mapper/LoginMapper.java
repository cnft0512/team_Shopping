package com.tam.mapper;

import com.tam.model.MemberVO;

public interface LoginMapper {
	
	// 로그인
	public MemberVO memberLogin(MemberVO member);
	
	// 관리자 여부 확인
	public MemberVO adminCk(MemberVO member);

}
