package com.gura.spring04.gallery.dao;

import java.util.List;

import com.gura.spring04.gallery.dto.GalleryDto;

public interface GalleryDao {
	//갤러리 목록
	public List<GalleryDto> getList(GalleryDto dto);
	//갤러리 글의 갯수
	public int getCount();
	//갤러리 글 추가
	public void insert(GalleryDto dto);
	//갤러리 글 정보 얻어오기
	public GalleryDto getData(int num);
	//키워드를 활용한 글정보 얻어오기 (키워드에 부합하는 글중에서 이전들, 다음글 의 글번호도 얻어올 수 있도록)
	public GalleryDto getData(GalleryDto dto);
}
