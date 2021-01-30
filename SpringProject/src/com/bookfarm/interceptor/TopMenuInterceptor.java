package com.bookfarm.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bookfarm.beans.BoardInfoBean;
import com.bookfarm.beans.UserBean;
import com.bookfarm.service.TopMenuService;

public class TopMenuInterceptor implements HandlerInterceptor{
	
	// 인터셉터 클래스는 빈을 자동주입 받지 못한다
	// 따라서 인터셉터를 등록하는 클래스에서 빈을 주입받은 후 생성자로 넘겨준다
	private TopMenuService topMenuService;
	private UserBean loginUserBean;
	
	public TopMenuInterceptor(TopMenuService topMenuService, UserBean loginUserBean) {
		this.topMenuService = topMenuService;
		this.loginUserBean = loginUserBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		List<BoardInfoBean> topMenuList = topMenuService.getTopMenuList();
		request.setAttribute("topMenuList", topMenuList);  // request 영역에 저장
		request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}
	

}
