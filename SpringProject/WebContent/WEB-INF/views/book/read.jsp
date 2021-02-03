<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	


<!-- 상단 메뉴 부분 -->
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="card shadow">
				<div class="card-body">
					<div class="form-group">
						<label for="book_writer_name">판매자</label>
						<input type="text" id="book_writer_name" name="book_writer_name" class="form-control" value="${readBookBean.book_writer_name}" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="book_subject">도서명</label>
						<input type="text" id="book_subject" name="book_subject" class="form-control" value="${readBookBean.book_subject}" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="book_rate">상태</label>
						<input type="text" id="book_rate" name="book_rate" class="form-control" value="${readBookBean.book_rate}" disabled="disabled"/>
					</div>
					<div class="form-group">
						<label for="book_price">희망가</label>
						<input type="text" id="book_price" name="book_price" class="book_price" value="${readBookBean.book_price}" disabled="disabled"/>
					</div>
					
					<div class="form-group">
						<label for="book_text">내용</label>
						<textarea id="book_text" name="book_text" class="form-control" rows="10" style="resize:none" disabled="disabled">${readBookBean.book_text}</textarea>
					</div>
							<div class="form-group">
						<label for="book_date">작성날짜</label>
						<input type="text" id="book_date" name="book_date" class="form-control" value="${readBookBean.book_date}" disabled="disabled"/>
					</div>
					<c:if test="${readContentBean.content_file != null }">
					<div class="form-group">
						<label for="book_file">첨부 이미지</label>
						<img src="${root}upload/${readBookBean.content_file}" width="100%"/>						
					</div>
					</c:if>
					<div class="form-group">
						<div class="text-right">
							<a href="${root }book/main" class="btn btn-primary">목록보기</a>
							<c:if test="${loginUserBean.user_idx == readBookBean.book_writer_idx }">
							<a href="${root }book/modify?book_idx=${book_idx}" class="btn btn-info">수정하기</a>
							<a href="${root }book/delete?book_idx=${book_idx}" class="btn btn-danger">삭제하기</a>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>


<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>

</body>
</html>
