package com.tam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.mapper.LoginMapper;
import com.tam.model.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginMapper memberMapper;

	// 로그인
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		
		return memberMapper.memberLogin(member);
	}

	// 관리자 여부 확인
	@Override
	public MemberVO adminCk(MemberVO member) throws Exception {
		
		return memberMapper.adminCk(member);
	}


}

