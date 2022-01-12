package kr.co.finalp.dto;

import java.util.HashMap;
import java.util.Map;

public class Gallery_PageUtill {
	public static Map<String, Object> getPageData(int totalNumber, int countPerPage, int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 총페이지 수 500%10 == 0 ? 500/10: 500?10+1
		int totalPage = (totalNumber % countPerPage == 0) ? totalNumber / countPerPage : totalNumber / countPerPage + 1;

		// 현재 페이지의 게시물 시작번호
		int startNo = (currentPage - 1) * 9 + 1;
		// 끝번호
		int endNo = (currentPage) * 9;

		// 시작 페이지번호
		int startPageNo = currentPage - 5 <= 0 ? 1 : currentPage - 5;
		// 끝페이지 번호
		int endPageNo = startPageNo + 10 >= totalPage ? totalPage : startPageNo + 10;

		// 이전페이지
		boolean prev = currentPage > 5 ? true : false;
		// 다음
		boolean next = currentPage + 5 >= totalPage ? false : true;
		
		// 맵객체에 담기
		map.put("currentPage", currentPage);
		map.put("totalPage", totalPage);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		map.put("startPageNo", startPageNo);
		map.put("endPageNo", endPageNo);
		map.put("prev", prev);
		map.put("next", next);
		
		return map;
	}
}
