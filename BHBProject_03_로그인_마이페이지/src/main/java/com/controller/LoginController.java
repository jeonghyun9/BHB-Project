package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {
	
	@Autowired
	MemberService Service;
	
	@RequestMapping(value = "/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		
		MemberDTO dto = Service.login(map);
		
		
		if (dto!=null) {
			session.setAttribute("login", dto);
			System.out.println(dto);
			return "main";
		} else {
			model.addAttribute("mesg", "아이디 또는 비밀번호가 잘못되었습니다.");
			return "loginForm";
		}
		
	}
	
	@RequestMapping(value = "/loginCheck/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:../"; // main.jsp
    }
	


}
