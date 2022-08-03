package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;

	public void memberAdd(MemberDTO m) {
		
		dao.memberAdd(m);
		System.out.println(m);
		
	}

	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = dao.login(map);
		System.out.println(map);
		return dto;
	}

	public MemberDTO myPage(String userid) {
		MemberDTO dto = dao.myPage(userid);
		System.out.println(dto);
		return dto;
	}

}
