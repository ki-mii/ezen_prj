package com.kimi.mapper;

import com.kimi.model.MemberVO;

public interface MemberMapper {
	public void memberJoin(MemberVO member);
	
	public int idCheck(String memberId);

	public MemberVO memberLogin(MemberVO member);
}
