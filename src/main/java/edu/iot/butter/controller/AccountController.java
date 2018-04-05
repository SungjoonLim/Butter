package edu.iot.butter.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
								BindingResult result) {
		log.info(login.toString());
		if(result.hasErrors()) {
			return "account/login";
		}
		
		Member member = service.checkLogin(login);
		if(member == null) {
			result.reject("loginFail","아이디나 비밀번호가 맞지 않습니다.");
			return "account/login";
		}
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
								BindingResult result) throws Exception {
		log.info(member.toString());
		if(result.hasErrors()) {
			return "account/join";
		}
		if(!service.add(member)) {
			return "account/join";
		}
		return "redirect:/";
	}
	

}
