package kr.co.finalp.dao;

import java.util.List;

import kr.co.finalp.dto.GalleryDTO;
import kr.co.finalp.dto.GalleryStartEnd;

public interface GalleryDao {

	public List<GalleryDTO> selectAll(GalleryStartEnd galleryStartEnd);
	public GalleryDTO selectOne(int galleryno);
	public int getTotal(GalleryStartEnd galleryStartEnd);
	public void hitsUp(int galleryno);
	
	public List<GalleryDTO> mainSelect();
	
}
