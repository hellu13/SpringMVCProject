package com.bookfarm.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookfarm.beans.BoardInfoBean;
import com.bookfarm.mapper.TopMenuMapper;

@Repository
public class TopMenuDao {
	
	@Autowired
	private TopMenuMapper topMenuMapper;
	
	public List<BoardInfoBean> getTopMenuList() {
		List<BoardInfoBean> topMenuList = topMenuMapper.getTopMenuList();
		
		return topMenuList;
	}

}
