 package com.mapper;

import java.util.List;

import com.dto.Board_LessorDTO;
import com.dto.Criteria;
 
public interface BoardLessorMapper {

	public List<Board_LessorDTO> getList();
	
	void insert(Board_LessorDTO bldto);
	
	void insertSelectkey(Board_LessorDTO nldto);
	
	Board_LessorDTO read(Long bl_num);
	
	int delete(Long bl_num);
	
	int update(Board_LessorDTO bldto);
	
	List<Board_LessorDTO> getListWithPaging(Criteria cri);
	
}
