package kr.co.finalp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.finalp.dto.GalleryDTO;
import kr.co.finalp.dto.GalleryStartEnd;

@Repository
public class GalleryOracleDAO implements GalleryDao {

	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public List<GalleryDTO> selectAll(GalleryStartEnd galleryStartEnd) {
		return ss.selectList("kr.co.finalp.photoGallery_selectAll", galleryStartEnd);
	}

	@Override
	public GalleryDTO selectOne(int galleryno) {
		return ss.selectOne("kr.co.finalp.photoGallery_selectOne", galleryno);
	}

	@Override
	public int getTotal(GalleryStartEnd galleryStartEnd) {
		return ss.selectOne("kr.co.finalp.photoGallery_getTotal", galleryStartEnd);
	}

	@Override
	public void hitsUp(int galleryno) {
		ss.update("kr.co.finalp.gallery_hits", galleryno);

	}

	@Override
	public List<GalleryDTO> mainSelect() {
		return ss.selectList("kr.co.finalp.main_gallery_list");
	}

	// 추천 갯수
	@Override
	public int countLike(int galleryno) {
		return ss.selectOne("kr.co.finalp.count_like", galleryno);
	}

}
