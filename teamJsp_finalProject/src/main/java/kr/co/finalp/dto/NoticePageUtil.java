package kr.co.finalp.dto;

import java.util.HashMap;
import java.util.Map;

public class NoticePageUtil {
	
	public static Map<String, Object> getPageData(int totalNumber, int countPerPage,  int currentPage){
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 총 페이지수
		int totalPage = (totalNumber%countPerPage==0)? totalNumber/countPerPage:totalNumber/countPerPage+1;
		
		// 현제 페이지의 게시물 시작 번호
		int startNo = (currentPage-1) * countPerPage + 1;
		
		// 현재 페이지의 게시물 끝 번호 
		int endNo = (currentPage) * countPerPage;
		
		// 시작 페이지 번호
		int startPageNo = currentPage-5 <=0 ? 1:currentPage-5; 
		
		// 끝 페이지 번호
		int endPageNo = startPageNo + 10 >= totalPage? totalPage : startPageNo+10;
		
		// 이전
		boolean prev = currentPage > 1 ? true:false;
		
		//다음 
		boolean next = currentPage+1 > endPageNo ? false:true;
		
		// 맵 객체에 담기
		
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
	
	public static Map<String, Object> getTotal(int totalNumber,int noticeno){
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean prev = noticeno > 1 ? true:false;
		boolean next = noticeno+1 > totalNumber ? false : true;
		
		map.put("totalNumber", totalNumber);
		map.put("prev", prev);
		map.put("next", next);
		
		return map;
	}
}
