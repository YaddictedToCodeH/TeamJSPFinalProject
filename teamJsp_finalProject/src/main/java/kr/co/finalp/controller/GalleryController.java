package kr.co.finalp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.finalp.dao.GalleryDao;
import kr.co.finalp.dao.RecommendDAO;
import kr.co.finalp.dto.GalleryDTO;
import kr.co.finalp.dto.GalleryStartEnd;
import kr.co.finalp.dto.Gallery_PageUtill;
import kr.co.finalp.dto.RecommendDTO;
import kr.co.finalp.dto.Video_PageUtill;
import lombok.extern.slf4j.Slf4j;

@Controller
public class GalleryController {

	@Autowired
	GalleryDao dao;

	@Autowired
	RecommendDAO rdao;

	public void setDao(GalleryDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/gallery")
	public ModelAndView photo(@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "galleryCategoryNo", defaultValue = "1") int galleryCategoryNo,
			@RequestParam(name = "sort_order", defaultValue = "latest_order") String sort_order, Model model) {

		GalleryStartEnd galleryStartEnd = new GalleryStartEnd();
		galleryStartEnd.setGalleryCategoryNo(galleryCategoryNo);
		galleryStartEnd.setSort_order(sort_order);

		/** 총 게시물 수 */
		int totalNumber = dao.getTotal(galleryStartEnd);

		// 페이지당 게시물수
		int countPerPage = 9;

		// 총 페이지 수
		Map<String, Object> map = Gallery_PageUtill.getPageData(totalNumber, countPerPage, currentPage);
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");

		// 카테고리 저장
		// : 하단, 페이징처리에 카테고리를 기억하기 위함.
		map.put("category", galleryCategoryNo);

		// : 페이징 , 시작, 종료 저장
		galleryStartEnd.setStartNo(startNo);
		galleryStartEnd.setEndNo(endNo);

		/** 데이터 전체 출력 */
		List<GalleryDTO> list = dao.selectAll(galleryStartEnd);

		// 화면 출력을 위한 값 저장
		model.addAttribute("map", map);
		model.addAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("photoGallery"); // 어떤 jsp 를 부를지 정하는 부분.

		return mav;
	}

	@RequestMapping("/photoGalleryDetail")
	public String photoeDetail(@RequestParam("galleryno") int galleryno, Model model, HttpSession session,
			HttpServletRequest req) {

		GalleryDTO dto = dao.selectOne(galleryno);
		model.addAttribute("dto", dto);

		// 조회수 증가
		dao.hitsUp(galleryno);

		// session 아이디 test용------------------------------------테스트 끝나고 지우기
//		String testId = "test"; 
//		session = req.getSession();
//		session.setAttribute("id", testId);
		// --------------------------------------------------------

		// 좋아요 수
		int countLike = dao.countLike(galleryno);
		model.addAttribute("count", countLike);

		String id = (String) session.getAttribute("id");

		// 로그인 되어 있다면 추천기능 사용 가능
		if (id != null) {
			RecommendDTO rdto = new RecommendDTO();
			rdto.setId(id);
			rdto.setGalleryno(galleryno);

			RecommendDTO recom = rdao.selectRecomOne(rdto);

			model.addAttribute("recom", recom);
		}

		return "photoGalleryDetail";
	}

	@RequestMapping("/videoGallery")
	public ModelAndView video(@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(name = "galleryCategoryNo", defaultValue = "4") int galleryCategoryNo,
			@RequestParam(name = "sort_order", defaultValue = "latest_order") String sort_order, Model model) {

		GalleryStartEnd galleryStartEnd = new GalleryStartEnd();
		galleryStartEnd.setGalleryCategoryNo(galleryCategoryNo);
		galleryStartEnd.setSort_order(sort_order);

		/** 총 게시물 수 */
		int totalNumber = dao.getTotal(galleryStartEnd);

		// 페이지당 게시물수
		int countPerPage = 6;

		// 총 페이지 수
		Map<String, Object> map = Video_PageUtill.getPageData(totalNumber, countPerPage, currentPage);
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");

		// 카테고리 저장
		// : 하단, 페이징처리에 카테고리를 기억하기 위함.
		map.put("category", galleryCategoryNo);

		// : 페이징 , 시작, 종료 저장
		galleryStartEnd.setStartNo(startNo);
		galleryStartEnd.setEndNo(endNo);

		/** 데이터 전체 출력 */
		List<GalleryDTO> list = dao.selectAll(galleryStartEnd);

		// 화면 출력을 위한 값 저장
		model.addAttribute("map", map);
		model.addAttribute("list", list);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoGallery"); // 어떤 jsp 를 부를지 정하는 부분.

		return mav;
	}

	@RequestMapping("/videoGalleryDetail")
	public String videoDetail(@RequestParam("galleryno") int galleryno, Model model, HttpSession session) {

		GalleryDTO dto = dao.selectOne(galleryno);
		model.addAttribute("dto", dto);

		// 조회수 증가
		dao.hitsUp(galleryno);

		// 좋아요 수
		int countLike = dao.countLike(galleryno);
		model.addAttribute("count", countLike);

		String id = (String) session.getAttribute("id");

		// 로그인 되어 있다면 추천기능 사용 가능
		if (id != null) {
			RecommendDTO rdto = new RecommendDTO();
			rdto.setId(id);
			rdto.setGalleryno(galleryno);

			RecommendDTO recom = rdao.selectRecomOne(rdto);

			model.addAttribute("recom", recom);
		}

		return "videoGalleryDetail";
	}

}
