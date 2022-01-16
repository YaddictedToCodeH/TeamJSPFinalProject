package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.GalleryDTO;
import kr.co.finalp.dto.GalleryStartEnd;

public interface GalleryDao {
	// 전체 리스트
	public List<GalleryDTO> selectAll(GalleryStartEnd galleryStartEnd);
	// 한개
	public GalleryDTO selectOne(int galleryno);
	//토탈갯수
	public int getTotal(GalleryStartEnd galleryStartEnd);
	// 조회수증가
	public void hitsUp(int galleryno);
	// 메인용 리스트
	public List<GalleryDTO> mainSelect();
	// 좋아요 갯수
	public int countLike(int galleryno);
	
	
	// 관리자페이지에서 insert용
	public void galleryInsert(GalleryDTO dto);
	public void filesInsert(GalleryDTO dto);
	
	// 관리자 수정용
	public void galleryUpdate(GalleryDTO dto);
	public void filesUpdate(GalleryDTO dto);
	
	// 관리자 삭제용
	public void galleryDelete(int galleryno);
	public void filesDelete(int galleryno);
}
