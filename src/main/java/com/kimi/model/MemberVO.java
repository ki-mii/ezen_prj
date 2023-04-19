package com.kimi.model;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberTel;
	private String memberMail;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private int adminCk;
	private int regDate;
	
	
}
