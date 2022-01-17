package kr.co.finalp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.finalp.dao.GalleryDao;
import kr.co.finalp.dto.GalleryDTO;
import kr.co.finalp.dto.GalleryStartEnd;
import kr.co.finalp.dto.Gallery_PageUtill;

@Controller
public class Admin_GalleryController {

	@Autowired
	GalleryDao dao;
	
	public void setDao(GalleryDao dao) {
		this.dao = dao;
	}
	
	// 관리자 갤러리관리 목록 리스트
	@RequestMapping(value = {"/admin/gallery"})
	public String adminGallery(@RequestParam(name = "currentPage", defaultValue = "1")int currentPage,
							   @RequestParam(name = "galleryCategoryNo", defaultValue = "1")int galleryCategoryNo,
							   Model model) {
		GalleryStartEnd gse = new GalleryStartEnd();
		gse.setGalleryCategoryNo(galleryCategoryNo);
		
		// 총게시물수
		int totalNumber = dao.getTotal(gse);
		// 페이지당 게시물수
		int countPerPage = 10;
		
		// 총페이지 수
		Map<String, Object> map = Gallery_PageUtill.getPageData(totalNumber, countPerPage, currentPage);
		int startNo = (int) map.get("startNo");
		int enddNo = (int) map.get("endNo");
		
		// 페이징시 카테고리 기억하기 위함
		map.put("category", galleryCategoryNo);
		
		// 페이징 시작, 종료 저장
		gse.setStartNo(startNo);
		gse.setEndNo(enddNo);
		
		// 갤러리 리스트 출력
		List<GalleryDTO> list = dao.selectAll(gse);
		
		// 화면 출력 위한 값 model로 저장
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		
		
		return "admin_gallery";
	}
	
	// 갤러리 작성
	@GetMapping("/admin/writeGallery")
	public String writeForm() {
		return "admin_galleryWrite";
	}
	@PostMapping("/admin/writeGallery")
	public String writeGallery(@ModelAttribute GalleryDTO dto) {
		dao.galleryInsert(dto);
		dao.filesInsert(dto);			
		return "redirect:/admin/gallery";
	}
	
	// 갤러리 수정
	@GetMapping("/admin/modifyGallery")
	public String modifyForm(@RequestParam("galleryno")int galleryno, Model model) {
		GalleryDTO dto = dao.selectOne(galleryno);
		model.addAttribute("dto", dto);
		return "admin_galleryModify";
	}
	@PostMapping("/admin/modifyGallery")
	public String modifyGallery(@ModelAttribute GalleryDTO dto) {
		dao.galleryUpdate(dto);
		dao.filesUpdate(dto);
		return "redirect:/admin/gallery";
	}
	
	@RequestMapping("/admin/deleteGallery")
	public String deleteGallery(HttpServletRequest req) {
		String[] gallerynoList = req.getParameterValues("galleryno");
				
		for(int i = 0; i < gallerynoList.length; i++) {
			dao.galleryDelete(Integer.parseInt(gallerynoList[i]));
			dao.filesDelete(Integer.parseInt(gallerynoList[i]));
		}		
		return "redirect:/admin/gallery";
	}
	
		
	
}
