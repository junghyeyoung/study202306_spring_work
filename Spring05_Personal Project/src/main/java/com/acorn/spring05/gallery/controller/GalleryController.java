package com.acorn.spring05.gallery.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.spring05.gallery.dto.GalleryDto;
import com.acorn.spring05.gallery.service.GalleryService;

@Controller
public class GalleryController {
	
	@Autowired
	private GalleryService service;
	
	//갤러리 게시글의 num이 parameter get 방식으로 넘어온다
	//detail 페이지
	@RequestMapping("/gallery/detail")
	public String detail(HttpServletRequest request) {
		//서비스에 HttpServletRequest 객체를 전달해서 응답에 필요한 데이터가 담기도록 하고
	    service.getDetail(request);
	    //view page로 forward 이동해서 응답
	    return "gallery/detail";
	}
	
	//갤러리 사진 업로드 & DB 저장
	@RequestMapping(method = RequestMethod.POST, value = "/gallery/upload")
	public String upload(GalleryDto dto, HttpServletRequest request) {
		//form 에서 dto 로 데이터 받아옴
		//dto : caption, MultipartFile image 를 가지고 있다
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		return "gallery/upload";
	}
	//갤러리 사진 업로드 폼 페이지로 이동
	@RequestMapping("/gallery/upload_form")
	public String uploadform() {
		return "gallery/upload_form";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/gallery/ajax_upload")
	@ResponseBody
	public Map<String, Object> ajaxUpload(GalleryDto dto, HttpServletRequest request){
		//서비스를 이용해서 업로드 된 이미지를 저장하고
		service.saveImage(dto, request);
		//{"isSuccess", true} 형식의 json 문자열 응답
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	
	//갤러리 리스트 얻어오기
	@RequestMapping("/gallery/list")
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "gallery/list";
	}
}
