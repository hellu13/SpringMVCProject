package com.bookfarm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bookfarm.beans.BookBean;
import com.bookfarm.beans.UserBean;
import com.bookfarm.service.BookService;

public class CheckBookWriterInterceptor implements HandlerInterceptor {
	
	private UserBean loginUserBean;
	private BookService bookService;
	
	public CheckBookWriterInterceptor(UserBean loginUserBean, BookService bookService) {
		// TODO Auto-generated constructor stub
		this.loginUserBean = loginUserBean;
		this.bookService = bookService;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		String str1 = request.getParameter("book_idx");
		int book_idx = Integer.parseInt(str1);
		
		BookBean currentBookBean = bookService.getBookInfo(book_idx);
		if(currentBookBean.getBook_writer_idx() != loginUserBean.getUser_idx()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/book/not_writer");
			return false;
		}
		return true;
	}

}
