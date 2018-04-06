package edu.iot.butter.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.iot.butter.model.Member;
import edu.iot.butter.service.MemberService;

@Controller
@RequestMapping("/member")
public class ProfileController {
	@Autowired
	MemberService service;
	
	@RequestMapping("/profile")
	public void profile(HttpSession session,
						Model model) throws Exception {
		Member m = (Member)session.getAttribute("USER");
		Member member = service.getMember(m.getUserId());
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public void editForm(HttpSession session,
							Model model) throws Exception {
		Member m = (Member)session.getAttribute("USER");
		Member member = service.getMember(m.getUserId());
		model.addAttribute("member",member);
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editSubmit(@Valid Member member,
								BindingResult result,
								HttpSession session) throws Exception {
		if(result.hasErrors()) return "member/edit";
		//정보수정처리
		if(!service.update(member)) { //실패의경우
			result.reject("updateFail","비밀번호가 일치하지 않습니다.");
			return "member/edit";
		}
		session.setAttribute("USER", member);
		return "redirect:profile";
	}
	
	@RequestMapping("/changePassword")
	public void changePassword(Model model) {
		
	}
	
	
	@RequestMapping("/quit")
	public void quit(Model model) {
		
	}
	
	
	
}
