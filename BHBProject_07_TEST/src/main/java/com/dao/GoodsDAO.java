package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BookMarkDTO;
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

	public void goodsMPAdd(Goods_MP_DTO mpdto) {
		int n=template.insert("GoodsMPMapper.goodsMPAdd",mpdto);
		
	}

	public void goodsYPAdd(Goods_YP_DTO ypdto) {
		int n=template.insert("GoodsYPMapper.goodsYPAdd",ypdto);
	}

	public int goodsMPCount() {
		int n=template.selectOne("GoodsMPMapper.goodsMPCount");
		return n;
	}

	public int goodsYPCount() {
		int n=template.selectOne("GoodsYPMapper.goodsYPCount");
		return n;
	}

	public Goods_YP_DTO goodsRetrieveYP(String gCode) {
		 Goods_YP_DTO ypdto=template.selectOne("GoodsYPMapper.goodsRetrieveYP",gCode);
		return ypdto;
	}

	public Goods_MP_DTO goodsRetrieveMP(String gCode) {
		Goods_MP_DTO mpdto=template.selectOne("GoodsMPMapper.goodsRetrieveMP",gCode);
		return mpdto;
	}

//	public List<BookMarkDTO> Bookmark(String userid) {
//		List<BookMarkDTO> list = template.selectList("BookMarkMapper.bookMarkList", userid);
//		return list;
//	}

	public void bookMarkAdd(BookMarkDTO bookMarkDTO) {
		int n = template.insert("BookMarkMapper.bookMarkAdd", bookMarkDTO);
		
	}

	public void bookMarkDelete(int num) {
		// TODO Auto-generated method stub
		int n = template.delete("BookMarkMapper.bookMarkDel", num);
		
	}

	public List<BookMarkDTO> bookmark(String userid) {
		List<BookMarkDTO> list = template.selectList("BookMarkMapper.bookMarkList", userid);
		return list;
	}

}
