package com.acorn.spring05.gallery.dao;

import java.util.List;

import com.acorn.spring05.gallery.dto.GalleryDto;

public interface GalleryDao {
	//갤러리 목록
	public List<GalleryDto> getList(GalleryDto dto);
	//갤러리 글의 갯수
	public int getCount();
	//갤러리 글 추가
	public void insert(GalleryDto dto);
	//갤러리 글 정보 얻어오기
	public GalleryDto getData(int num);
	//갤러리 글 하나 정보 얻어오기
	public GalleryDto getData(GalleryDto dto);
}
