package com.goott.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goott.domain.MemberVO;
import com.goott.service.MailSendService;
import com.goott.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@Inject
	private MailSendService mailSendService;
	@Inject
	MemberService memberService;
	
	
	@RequestMapping(value = "alert", method = RequestMethod.GET)
	public void alert() {
		log.info("경고 창 이동");
	}

	@RequestMapping(value = "agree", method = RequestMethod.GET)
	public void agreeGet() {
		log.info("약관 동의 get =================================");
	}
	
	
	/** 회원 가입 양식 작성 페이지 
	 * @param member_email_agree 이메일 수신 동의 여부 (y/n)
	 * @param model member_email_agree 저장
	 * */
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void joinGet(@RequestParam String member_email_agree, Model model) {
		log.info("회원 가입 get ===========================================");
		model.addAttribute("member_email_agree", member_email_agree);
	}
	/** 회원 가입 전 이메일 인증 체크 
	 * @param memberVO 회원 엔티티
	 * 
	 * */
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPost(MemberVO memberVO, Model model) {
		log.info("이메일 인증 처리 post ===========================================");
		//기본 프로필 이미지
		memberVO.setMember_profile_img_url("/resources/img/user/basic_profile.jpg");
		log.info(memberVO);
		model.addAttribute("member" , memberVO);
		//가입 신청 유저 이메일 주소로 메일 발송 , 생성된 랜덤 코드 리턴
		String code = mailSendService.joinEmail(memberVO.getMember_email());
		log.info("인증 메일 발송==============================================");
		model.addAttribute("code", code );
		return "auth_mail";
	}
	/**
	 * 이메일 인증 체크 후 회원가입 로직 실행할 메서드
	 * @param memberVO 회원 엔티티
	 * @return
	 */
	@RequestMapping(value = "joinSuccess", method = RequestMethod.POST)
	public String joinSuccessPost(MemberVO memberVO) {
		log.info("회원 가입 완료 post ============================================");
		log.info(memberVO);
		memberService.joinMember(memberVO);
		log.info("회원 가입 완료");
		return "home";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGet() {
		log.info("로그인 get ==============================================================");
	}
	
	/**
	 * 
	 * @param member_id 로그인 아이디
	 * @param member_pw 로그인 비밀번호
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginPost(@RequestParam String member_id, @RequestParam String member_pw , Model model, HttpServletRequest request) {
		log.info("로그인 post ==============================================================");
		
		
		log.info("로그인 시도 아이디 : " + member_id);
		
		String msg = memberService.loginCheck(member_id, member_pw);
		
		log.info("로그인 시도 결과 : " + msg);
		
		//로그인 성공 이라면 세션에 로그인 아이디 추가
		if(msg.equals("로그인 성공.")) {
			HttpSession session = request.getSession();
			session.setAttribute("login_id", member_id);	
			String login_auth = memberService.getUserAuth(member_id);
			//권한 저장
			session.setAttribute("login_auth", login_auth);
			//기존에 접속시도했던 주소가 있다면
			if(session.getAttribute("prior_uri") != null) {
				String prior_uri = session.getAttribute("prior_uri").toString();
				String query_string = session.getAttribute("query_string").toString();
				log.info("세션에 저장된 접속하려던 주소 : " + prior_uri);
				//세션에 이전 접속 주소 초기화
				session.removeAttribute("prior_uri");
				session.removeAttribute("query_string");
				//이전 접속 주소로 이동
				
				model.addAttribute("msg", member_id + "님 환영합니다.");
				model.addAttribute("url", prior_uri + "?" + query_string);
				
				return "alert";
//				return  "redirect:" + prior_uri + "?" + query_string;

			}
			//기존에 접속 시도 했던 주소가 없다면
			else {
				model.addAttribute("msg", member_id + "님 환영합니다.");
				model.addAttribute("url", "/");
				return "alert";
			}
		}
		//로그인 시도중 실패했다면 해당 텍스트 리턴
		else {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/login");
			return "alert";
		}
	}
	
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logOut(HttpServletRequest request) {
		//로그아웃 처리시 모든 세션 지우기
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	/**
	 * 
	 * @param map 검색할 아이디 담은 제이슨
	 * @return 검색 아이디 수
	 */
	@ResponseBody
	@RequestMapping(value = "checkDupIdAjax", method = RequestMethod.POST)
	public String checkDupIdAjax(@RequestBody Map<String, String> param) {
		log.info("아이디 중복 체크 ajax============================================");
		log.info(param);
		String member_id = param.get("id");
		String result = Integer.toString(memberService.checkDupId(member_id));
		return result;
	
	}
	/**
	 * 
	 * @param map 검색할 이메일 담은 제이슨
	 * @return 검색 이메일 수
	 */
	@ResponseBody
	@RequestMapping(value = "checkDupEmailAjax", method = RequestMethod.POST)
	public String checkDupEmailAjax(@RequestBody Map<String, String> param) {
		log.info("이메일 중복 체크 ajax============================================");
		log.info(param);
		String member_email = param.get("email");
		String result = Integer.toString(memberService.checkDupEmail(member_email));
		return result;
		
	}

	
	
}
