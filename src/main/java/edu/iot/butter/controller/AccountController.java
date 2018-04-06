package edu.iot.butter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AccountController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm(Login login) {
		return "account/login";
	}

	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginSubmit(@Valid Login login,
								BindingResult result,
								HttpSession session) throws Exception {
		log.info(login.toString());
		if(result.hasErrors()) return "account/login";

		Member member = service.checkLogin(login);
		/*if(member == null) {
			result.reject("loginFail","아이디나 비밀번호가 맞지 않습니다.");
			return "account/login";
		}*/
		session.setAttribute("USER", member);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck",method=RequestMethod.GET)
	public boolean checkId(@RequestParam("userId")String userId) {
		try {
			return service.checkId(userId);
		}catch(Exception e) {
			e.printStackTrace();
			return true;
		}
	}
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm(Member member) {
		return "account/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinSubmit(@Valid Member member,
								BindingResult result,
								RedirectAttributes ra) throws Exception {
		log.info(member.toString());
		if(result.hasErrors()) return "account/join";
		
		service.add(member);
		ra.addFlashAttribute("member", member);
		return "redirect:/join_success";
	}
	
	/*@ExceptionHandler({SQLException.class, DataAccessException.class})
	public String handleError() {
		return "error/database_error";
	}*/
	
	@ExceptionHandler(LoginFailException.class)
	public String handleLoginError(HttpServletRequest request,
									Exception e) {
		request.setAttribute("login", new Login());
		request.setAttribute("error", e.getMessage());
		return "account/login";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping(value="/join_success", method=RequestMethod.GET)
	public String join_success(HttpSession session) {
		return "account/join_success";
	}
	
	

}
