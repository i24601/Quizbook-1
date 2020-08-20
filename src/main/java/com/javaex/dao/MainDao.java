package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.MainVo;
import com.javaex.vo.UserVo;

@Repository
public class MainDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//유저정보 가져오기
	public UserVo getUser(String id) {
		System.out.println("MainDao:getUser");
		
		UserVo userVo = sqlSession.selectOne("user.getUser", id);
		return userVo;
	}
	
	//세트가져오기(아이디포함)
	public List<MainVo> getSetList(int userNo) {
		System.out.println("MainDao:getSetList");
		
		List<MainVo> setList = sqlSession.selectList("set.selectSetList", userNo);
		
		
		return setList;
		
	}

}