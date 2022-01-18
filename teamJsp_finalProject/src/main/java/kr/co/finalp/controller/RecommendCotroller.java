package kr.co.finalp.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.finalp.dao.RecommendDAO;
import kr.co.finalp.dto.RecommendDTO;

@Controller
public class RecommendCotroller {

	@Autowired
	RecommendDAO dao;
			
	public void setDao(RecommendDAO dao) {
		this.dao = dao;
	}
	

	// @ResponseBody / @RequestBody 확인필수 보내고, 받는다. !
	
	@ResponseBody
	@RequestMapping(value = "/member/recommend", method = RequestMethod.POST)
	public int recomControl(@RequestBody RecommendDTO reqDto , Model model, Principal principal) {									
		String id= principal.getName();
		int galleryno = reqDto.getGalleryno();
		
		RecommendDTO dto = new RecommendDTO();
		dto.setId(id);
		dto.setGalleryno(galleryno);
		// 추천체크
		RecommendDTO recomDto = dao.selectRecomOne(dto);
		
		// 임시값
		int res = 2;
		// dto가 비어 있으면 insert로 추천 추가 
		if(recomDto == null) {
			res = dao.insertLike(dto);
			return res;
		
		// 존재했을때 다시 클릭시 삭제
		}else if(recomDto != null) {
			res = dao.deleteLike(recomDto.getRecomno());
			return res + 1;
		}
		
	
		return res;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/member/recommendFan", method = RequestMethod.POST)
	public int recomControlFan(@RequestBody RecommendDTO reqDto , Model model, Principal principal) {									
		String id= principal.getName();
		int fanno = reqDto.getFanno();
		
		RecommendDTO dto = new RecommendDTO();
		dto.setId(id);
		dto.setFanno(fanno);
		// 추천체크
		RecommendDTO recomDto = dao.selectFanRecomOne(dto);
		
		// 임시값
		int res = 2;
		// dto가 비어 있으면 insert로 추천 추가 
		if(recomDto == null) {
			res = dao.insertLikeFan(dto);
			return res;
		
		// 존재했을때 다시 클릭시 삭제
		}else if(recomDto != null) {
			res = dao.deleteLike(recomDto.getRecomno());
			return res + 1;
		}
		
	
		return res;
		
	}
}
		

		
		
		
	