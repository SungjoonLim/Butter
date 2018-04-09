package edu.iot.butter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberController {
	@Autowired
	MemberService service;

	@RequestMapping("/list")
	public void list(@RequestParam(value = "page", defaultValue = "1")
		int page, Model model) throws Exception {
		// 목록 및 페이지 정보 추출
		Pagination pagination = service.getPagination(page);
		List<Member> list = service.getList(pagination);
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("list",list);
		
	}
}