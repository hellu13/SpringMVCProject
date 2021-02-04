package com.bookfarm.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookfarm.beans.BookBean;
import com.bookfarm.dao.BookDao;

@Service
public class MainService {
	
	@Autowired
	private BookDao bookDao;
	
	public ArrayList<BookBean> getMainList() {
		return bookDao.getMainList();
	}

}
