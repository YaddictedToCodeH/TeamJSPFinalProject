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

	@Override
	public int countLike(int galleryno) {
		return ss.selectOne("kr.co.finalp.count_like", galleryno);
	}

	@Override
	public void galleryInsert(GalleryDTO dto) {
		ss.insert("kr.co.finalp.admin_gallery_insert",dto);
	}

	@Override
	public void filesInsert(GalleryDTO dto) {
		ss.insert("kr.co.finalp.admin_files_insert",dto);
	}

	@Override
	public void galleryUpdate(GalleryDTO dto) {
		ss.update("kr.co.finalp.admin_gallery_update", dto);
	}

	@Override
	public void filesUpdate(GalleryDTO dto) {
		ss.update("kr.co.finalp.admin_files_update", dto);
	}

	@Override
	public void galleryDelete(int galleryno) {
		ss.delete("kr.co.finalp.admin_gallery_delete", galleryno);
	}

	@Override
	public void filesDelete(int galleryno) {
		ss.delete("kr.co.finalp.admin_files_delete", galleryno);		
	}

}
