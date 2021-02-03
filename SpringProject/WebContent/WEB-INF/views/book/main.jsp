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

<!-- 게시글 리스트 -->
<div class="container" style="margin-top:100px">
	<div class="card shadow">
		<div class="card-body">
			<h4 class="card-title">최근 등록 도서</h4>
			<table class="table table-hover" id='board_list'>
				<thead>
					<tr>
						<th class="text-center d-none d-md-table-cell">글번호</th>
						<th class="w-30">도서명</th>
						<th class="text-center d-none d-md-table-cell">상태</th>
						<th class="text-center d-none d-md-table-cell">희망가</th>
						<th class="text-center d-none d-md-table-cell">판매자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='obj' items="${bookList }">
						<tr>
							<td class="text-center d-none d-md-table-cell">${obj.book_idx }</td>
							<td><a href='${root }book/read?book_idx=${obj.book_idx}&page=${page}'>${obj.book_subject }</a></td>
							<td class="text-center d-none d-md-table-cell">${obj.book_rate }</td>
							<td class="text-center d-none d-md-table-cell">${obj.book_price }</td>
							<td class="text-center d-none d-md-table-cell">${obj.book_writer_name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
				
				 	<c:choose>
				 	<c:when test="${pageBean.prevPage <=0 }">
				 	<li class="page-item disabled">
						<a href="#" class="page-link">이전</a>
					</li>
				 	</c:when>
				 	<c:otherwise>
				 	<li class="page-item">
						<a href="${root }book/main?page=${pageBean.prevPage}" class="page-link">이전</a>
					</li>
				 	</c:otherwise>
				 	</c:choose>
					
					
					<c:forEach var="idx" begin="${pageBean.min }" end="${pageBean.max }">
					<c:choose>
					<c:when test="${idx == pageBean.currentPage }">
					<li class="page-item active">
						<a href="${root }book/main?page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }book/main?page=${idx}" class="page-link">${idx }</a>
					</li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					
					<c:otherwise>
					<li class="page-item">
						<a href="${root }book/main?page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
			
			<div class="d-block d-md-none">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<a href="#" class="page-link">이전</a>
					</li>
					<li class="page-item">
						<a href="#" class="page-link">다음</a>
					</li>
				</ul>
			</div>
			
			<div class="text-right">
				<a href="${root }book/write" class="btn btn-primary">도서 등록</a>
			</div>
			
		</div>
	</div>
</div>

<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</body>
</html>






