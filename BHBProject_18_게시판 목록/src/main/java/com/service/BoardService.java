package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dto.Board_LessorDTO;
import com.dto.Board_NoticeDTO;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service

@RequiredArgsConstructor
@ToString
public class BoardService {
	@Autowired
	BoardDAO dao;

	public List<Board_NoticeDTO> noticeList() {
		List<Board_NoticeDTO> list = dao.noticeList();
		return list;
	}

	public Board_NoticeDTO boardNotice(int num) {
		Board_NoticeDTO bdto=dao.boardNotice(num);
		return bdto;
	}


	public List<Board_LessorDTO> boardLessorList() {
		List<Board_LessorDTO> list=dao.boardLessorList();
		return list;
	}

	public Board_LessorDTO boardLessor(int num) {
		Board_LessorDTO ldto=dao.boardLessor(num);
		return ldto;
	}

	public void writeAction(Board_LessorDTO m) {
		
		dao.writeAction(m);
	}

	public int boardLessorCount() {
		int n=dao.boardLessorCount();
		return n;
	}

	public int boardNoticeCount() {
		int n=dao.boardNoticeCount();
		return n;
	}

}
