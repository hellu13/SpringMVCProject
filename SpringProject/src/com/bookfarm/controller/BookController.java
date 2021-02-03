package com.bookfarm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookfarm.beans.BookBean;
import com.bookfarm.beans.PageBean;
import com.bookfarm.beans.UserBean;
import com.bookfarm.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String main(@RequestParam(value= "page", defaultValue = "1") int page, 
					   Model model) {
		
		List<BookBean> bookList = bookService.getBookList(page);
		model.addAttribute("bookList", bookList);
		
		PageBean pageBean = bookService.getBookCnt(page);
		model.addAttribute("pageBean", pageBean);
		
		model.addAttribute("page", page);
		
		return "book/main";
	}
	
	@GetMapping("/read")
	public String read(@RequestParam("book_idx") int book_idx, Model model,
					   @RequestParam("page") int page) {
		
		BookBean readBookBean = bookService.getBookInfo(book_idx);
		model.addAttribute("readBookBean", readBookBean);
		model.addAttribute("book_idx", book_idx);
		model.addAttribute("loginUserBean", loginUserBean);
		model.addAttribute("page", page);
		
		return "book/read";
	}
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeBookBean") BookBean writeBookBean) {
		
		return "book/write";
	}
	
	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeBookBean") BookBean writeBookBean, BindingResult result) {
		if(result.hasErrors()) {
			return "book/write";
		}
		
		bookService.addBookInfo(writeBookBean);
		
		return "book/write_success";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("book_idx") int book_idx,
						 @RequestParam("page") int page,
						 @ModelAttribute("modifyBookBean") BookBean modifyBookBean,
						 Model model) {
		
		model.addAttribute("book_idx", book_idx);
		model.addAttribute("page", page);
		
		BookBean tempBookBean = bookService.getBookInfo(book_idx);
		
		modifyBookBean.setBook_writer_name(tempBookBean.getBook_writer_name());
		modifyBookBean.setBook_date(tempBookBean.getBook_date());
		modifyBookBean.setBook_subject(tempBookBean.getBook_subject());
		modifyBookBean.setBook_rate(tempBookBean.getBook_rate());
		modifyBookBean.setBook_price(tempBookBean.getBook_price());
		modifyBookBean.setBook_text(tempBookBean.getBook_text());
		modifyBookBean.setBook_file(tempBookBean.getBook_file());
		modifyBookBean.setBook_writer_idx(tempBookBean.getBook_writer_idx());
		modifyBookBean.setBook_idx(book_idx);
		
		return "book/modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyBookBean") BookBean modifyBookBean,
							 @RequestParam("page") int page,
							 BindingResult result,
							 Model model) {
		model.addAttribute("page", page);
		if(result.hasErrors()) {
			return "book/modify";
		}
		bookService.modifyBookInfo(modifyBookBean);
		return "book/modify_success";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("book_idx") int book_idx, Model model) {
		bookService.deleteBookInfo(book_idx);
		return "book/delete";
	}
	

}
