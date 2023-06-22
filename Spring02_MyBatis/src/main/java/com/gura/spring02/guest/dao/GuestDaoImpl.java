package com.gura.spring02.guest.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring02.guest.dto.GuestDto;

//component scan
@Repository
public class GuestDaoImpl implements GuestDao {
	
	//mybatis 기반으로 DB 연동을 하기 위한 핵심 의존객체를 Dependency Injection 받는다.
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(GuestDto dto) {
		session.insert("guest.insert", dto);
		/*
			Mapper's namespace => guest
			sql's id => insert
			parameterType => GuestDto
		*/
	}

	@Override
	public void update(GuestDto dto) {
		session.update("guest.update", dto);
	
		
	}

	@Override
	public void delete(GuestDto dto) {
		session.delete("guest.delete", dto);
		
	}

	@Override
	public GuestDto getData(int num) {
		return session.selectOne("guest.getData", num);
		/*
		 	Mapper's namespace => guest
		 	sql's id => getData
		 	parameterType => int
		 	resultType => GuestDto
		*/
	}

	@Override
	public List<GuestDto> getList() {
		return session.selectList("guest.getList");
		/*
	 	Mapper's namespace => guest
	 	sql's id => getList
	 	parameterType => X
	 	resultType => GuestDto
	*/
	}
}
