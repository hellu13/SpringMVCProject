package com.bookfarm.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bookfarm.beans.BookBean;
import com.bookfarm.mapper.BookMapper;

@Repository
public class BookDao {
	
	@Autowired
	private BookMapper bookMapper;
	
	public void addBookInfo(BookBean writeBookBean) {
		bookMapper.addBookInfo(writeBookBean);
	}
	
	public List<BookBean> getBookList() {
		return bookMapper.getBookList();
	}
	
	public BookBean getBookInfo(int book_idx) {
		return bookMapper.getBookInfo(book_idx);
	}
	
	public void modifyBookInfo(BookBean modifyBookBean) {
		bookMapper.modifyBookInfo(modifyBookBean);
	}

	public void deleteBookInfo(int book_idx) {
		bookMapper.deleteBookInfo(book_idx);
	}
}
