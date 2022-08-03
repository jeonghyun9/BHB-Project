package com.controller;

import java.io.UTFDataFormatException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO dto) {
		service.memberUpdate(dto);
		System.out.println(dto);
		return "main";
		
	}
	
	
	@RequestMapping(value = "/loginCheck/myPage")
	public String myPage(HttpSession session) {
		
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid =  dto.getUserid();
		dto =  service.myPage(userid);
		System.out.println(dto);
		session.setAttribute("login", dto);
		return "redirect:../myPage";
		
	}
	

	

	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO m, Model model ) {
		service.memberAdd(m);
		model.addAttribute("success", "회원가입성공");
		System.out.println(m);
		return "main"; // main.jsp
		
	}

			
		
	@RequestMapping(value = "/idDuplicateCheck", produces = "text/plain;charset=UTF-8") // 한글처리
    public @ResponseBody String idDuplicatedCheck(@RequestParam("id") String userid) {
        MemberDTO dto = service.myPage(userid);

        System.out.println("아이디 체크 : " + dto);
        String mesg = "아이디는 4~10자리로 입력해주세요";

        if (userid.length() >= 4 && userid.length() <= 10) {
            mesg = "아이디 사용가능";
            if (dto != null) {
                mesg = "이미 사용중인 아이디 입니다";
            }
        }

        return mesg;

    }
		
	
		
		
}
