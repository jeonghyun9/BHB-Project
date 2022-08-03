package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Goods_MP_DTO;
import com.dto.Goods_YP_DTO;

@Repository
public class GoodsDAO {
	@Autowired
	SqlSessionTemplate template;
	public List<Goods_MP_DTO> goodsListMP(String room) {
		List<Goods_MP_DTO> list=template.selectList("GoodsMPMapper.goodsList",room);
		return list;
	}

	public List<Goods_YP_DTO> goodsListYP(String room) {
		List<Goods_YP_DTO> list=template.selectList("GoodsYPMapper.goodsList",room);
		return list;
	}

	public List<Goods_MP_DTO> goodsListMP() {
		List<Goods_MP_DTO> list = template.selectList("GoodsMPMapper.goodsListMP");
		return list;
	}

	public List<Goods_YP_DTO> goodsListYP() {
		List<Goods_YP_DTO> list = template.selectList("GoodsYPMapper.goodsListYP");
		return list;
	}

	public List<Goods_MP_DTO> goodsListMP_Loc(String location) {
		List<Goods_MP_DTO> list = template.selectList("GoodsMPMapper.goodsListMP_Loc", location);
		return list;
	}

	public List<Goods_YP_DTO> goodsListYP_Loc(String location) {
		List<Goods_YP_DTO> list = template.selectList("GoodsYPMapper.goodsListYP_Loc", location);
		return list;
	}

}
