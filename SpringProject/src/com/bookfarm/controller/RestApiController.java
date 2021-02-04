package com.bookfarm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bookfarm.beans.BookBean;
import com.bookfarm.service.MainService;
import com.bookfarm.service.UserService;


@RestController
public class RestApiController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MainService mainService;

	
	@GetMapping("/user/checkUserIdExist/{user_id}")
	public String checkUserIdExist(@PathVariable String user_id) {
		
		boolean isOk = userService.checkUserIdExist(user_id);
		
		return isOk + "";
	}
	
	@GetMapping("/readData")
	public ResponseEntity<ArrayList<BookBean>> readData() {
		
		ArrayList<BookBean> list = mainService.getMainList();
		
		ResponseEntity<ArrayList<BookBean>> entry = new ResponseEntity<ArrayList<BookBean>>(list, HttpStatus.OK);
		
		return entry;
	}
}
