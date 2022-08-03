package com.controller;

import java.awt.Container;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.BookMarkDTO;
import com.dto.Goods_MP_DTO;
import com.dto.LessorDTO;
import com.dto.MemberDTO;
import com.service.GoodsService;
import com.service.LessorService;

@Controller
public class ReservationController {
	
	@Autowired
	GoodsService service;
	@Autowired
	LessorService service2;
	
	 @RequestMapping("/loginCheck/reserve")
		public String reserve(@RequestParam("num") int num,  RedirectAttributes xxx) {

			BookMarkDTO bDTO= service.bookMarkByNum(num); //장바구니 정보가져오기 
		 	MemberDTO mDTO = new MemberDTO();
		    String userid = bDTO.getLessorid();
		    LessorDTO lDTO=service2.lessorOffer(userid);
			xxx.addFlashAttribute("bDTO", bDTO); //request에 카트정보저장	
			xxx.addFlashAttribute("lDTO", lDTO);
			return "redirect:../reserve"; //servlet-context에 등록
		}

}
