package com.kimi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kimi.model.MemberVO;
import com.kimi.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/member")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {
		log.info("회원가입 페이지 진입");
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO member) throws Exception {
//		log.info("join 진입");
		
		String rawPw = ""; //인코딩 전 비번
		String encodePw = "";
		
		rawPw = member.getMemberPw();
		encodePw = pwEncoder.encode(rawPw); // 비번 인코딩
		member.setMemberPw(encodePw); //인코딩된 비번 member객체에 다시 저장
		
		/*회원가입 쿼리 실행*/
		memberservice.memberJoin(member);
		
//		log.info("join service 성공");
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		log.info("로그인 페이지 진입");
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
//		System.out.println("login 메서드 진입");
//		System.out.println("전달된 데이터 : " + member);
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		
		MemberVO lvo = memberservice.memberLogin(member);
		
		if(lvo != null) {  //일치하는 아이디 존재시
			
			rawPw = member.getMemberPw(); //사용자 제출한 비번
			encodePw = lvo.getMemberPw(); //db에 저장된 인코딩된 비번
			
			if(true == pwEncoder.matches(rawPw, encodePw)) { //일치여부판단
				
				lvo.setMemberPw("");
				session.setAttribute("member", lvo);
				return "redirect:/main";
				
			}else {
				
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login";
			}
			
		}else {
			
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login";
		}
		
	}
	
	/* 메인페이지 로그아웃 */
	@RequestMapping(value="logout.do", method=RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception{
		
		log.info("logoutMainGET 메서드 진입");
		
		HttpSession session = request.getSession();
		
		session.invalidate(); //세션 전체를 무효화하는 invalidate
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.POST)
	@ResponseBody //ajax로 서버요청하기때문에
	public void logoutPOST(HttpServletRequest request) throws Exception{
		log.info("비동기 로그아웃 메서드 진입");
		HttpSession session = request.getSession();
		session.invalidate();
	}
	
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
//		log.info("memberIdChk() 진입");
		
		int result = memberservice.idCheck(memberId);
		
		log.info("결과값 = " + result);
		
		if(result != 0) {
			return "fail"; //중복 아이디 존재
		} else {
			return "success";
		}
	}
}
