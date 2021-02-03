package com.bookfarm.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bookfarm.beans.BookBean;
import com.bookfarm.beans.UserBean;
import com.bookfarm.dao.BookDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class BookService {
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Autowired
	private BookDao bookDao;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	private String saveUploadFile(MultipartFile upload_file) {
		
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	public void addBookInfo(BookBean writeBookBean) {
		
		MultipartFile upload_file = writeBookBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			writeBookBean.setBook_file(file_name);
		}
			
			writeBookBean.setBook_writer_idx(loginUserBean.getUser_idx());
			
			bookDao.addBookInfo(writeBookBean);
		
	}
	
	public List<BookBean> getBookList() {
		
		return bookDao.getBookList();
	}
	
	public BookBean getBookInfo(int book_idx) {
		return bookDao.getBookInfo(book_idx);
	}
	
	public void modifyBookInfo(BookBean modifyBookBean) {
		
		MultipartFile upload_file = modifyBookBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifyBookBean.setBook_file(file_name);
		}
		bookDao.modifyBookInfo(modifyBookBean);
	}
	
	public void deleteBookInfo(int book_idx) {
		bookDao.deleteBookInfo(book_idx);
	}

}
