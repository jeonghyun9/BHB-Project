package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.Goods_MP_DTO;
import com.dto.Goods_YP_DTO;

@Service
public class GoodsService {
@Autowired
GoodsDAO dao;
	public List<Goods_MP_DTO> goodsListMP(String room) {
		List<Goods_MP_DTO> list=dao.goodsListMP(room);
		return list;
	}
	
	public List<Goods_YP_DTO> goodsListYP(String room) {
		List<Goods_YP_DTO> list=dao.goodsListYP(room);
		return list;
	}

	public List<Goods_MP_DTO> goodsListMP() {
		List<Goods_MP_DTO> list = dao.goodsListMP();
		return list;
	}

	public List<Goods_YP_DTO> goodsListYP() {
		List<Goods_YP_DTO> list = dao.goodsListYP();
		return list;
	}

	public List<Goods_MP_DTO> goodsListMP_Loc(String location) {
		List<Goods_MP_DTO> list = dao.goodsListMP_Loc(location);
		return list;
	}

	public List<Goods_YP_DTO> goodsListYP_Loc(String location) {
		List<Goods_YP_DTO> list = dao.goodsListYP_Loc(location);
		return list;
	}

	
}
