<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!-- 상단 메뉴 부분 -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top shadow-lg">
	<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="white" class="bi bi-book" viewBox="0 0 16 16">
  			<path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
	</svg>
	&nbsp;
	<a class="navbar-brand" href="${root }main">책 Farm</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navMenu">
		<ul class="navbar-nav">
			<!--<li class="nav-item"><a href="main" class="nav-link">팝니다</a></li>-->
			<c:forEach var="obj" items="${topMenuList }">
			<li class="nav-item">
				<a href="${root }board/main?board_info_idx=${obj.board_info_idx}" class="nav-link">${obj.board_info_name }</a>
			</li>
			</c:forEach>
		</ul>

		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a href="${root }user/login" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="${root }user/join" class="nav-link">회원가입</a></li>
			<li class="nav-item"><a href="${root }user/modify" class="nav-link">정보수정</a></li>
			<li class="nav-item"><a href="${root }user/logout" class="nav-link">로그아웃</a></li>
		</ul>
	</div>
</nav>