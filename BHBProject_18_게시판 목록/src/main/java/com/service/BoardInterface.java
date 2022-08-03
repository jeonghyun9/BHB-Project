package com.service;

import java.util.List;

import com.dto.Board_LessorDTO;
import com.dto.Criteria;

public interface BoardInterface {
	
	Long register(Board_LessorDTO bldto);
	
	Board_LessorDTO get(Long bl_num);
	
	int modify(Board_LessorDTO bldto);
	
	int remove(Long bl_num);
	
	List<Board_LessorDTO> getList();
	
	List<Board_LessorDTO> getList(Criteria cri);

}
