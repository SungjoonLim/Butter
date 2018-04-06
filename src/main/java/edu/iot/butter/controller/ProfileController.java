package edu.iot.butter.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.iot.butter.service.MemberService;

@Controller
@RequestMapping("/member")
public class ProfileController {
	@Autowired
	MemberService service;
	
	@RequestMapping("/profile")
	public void profile(HttpSession session, Model model) {
		model.addAttribute("member",session.getAttribute("USER"));
	}
	
	
	
	
}
