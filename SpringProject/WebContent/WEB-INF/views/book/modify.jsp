<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
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
					<form:form action="${root }book/modify_pro" method="post" modelAttribute="modifyBookBean" enctype="multipart/form-data">
					<form:hidden path="book_idx"/>
					<input type="hidden" name="page" value="${page }"/>
						<div class="form-group">
							<form:label path="book_writer_name">판매자</form:label>
							<form:input path="book_writer_name" class='form-control' readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="book_date">작성날짜</form:label>
							<form:input path="book_date" class='form-control' readonly='true'/>
						</div>
						<div class="form-group">
							<form:label path="book_deal_status">도서상태</form:label>
							<form:select path="book_deal_status" class="form-select">
								<form:option value="판매중" label="판매중"/>
								<form:option value="거래중" label="거래중"/>
								<form:option value="거래완료" label="거래완료"/>
							</form:select>
						</div>			
						<div class="form-group">
							<form:label path="book_subject">도서명</form:label>
							<form:input path="book_subject" class='form-control' />
							<form:errors path='book_subject' style='color:red' />
						</div>
						<div class="form-group">
							<form:label path="book_rate">도서상태</form:label>
							<form:input path="book_rate" class='form-control' />
							<form:errors path='book_rate' style='color:red' />
						</div>
						
						<div class="form-group">
							<form:label path="book_price">희망가</form:label>
							<form:input path="book_price" class='form-control' />
							<form:errors path='book_price' style='color:red' />
						</div>
						<div class="form-group">
							<form:label path="book_text">내용</form:label>
							<form:textarea path="book_text" class="form-control" rows="10" style="resize:none" />
							<form:errors path='book_text' style='color:red' />
						</div>
						<div class="form-group">
							<form:label path="book_file">첨부 이미지</form:label>
							<c:if test="${modifyBookBean.book_file != null }">
							<img src="${root }upload/${modifyBookBean.book_file}" width="100%"/>	
							<form:hidden path="book_file"/>
							</c:if>
							<form:input type='file' path='upload_file' class="form-control" accept="image/*" />
						</div>
						<div class="form-group">
							<div class="text-right">
								<form:button class='btn btn-primary'>수정완료</form:button>
								<a href="${root }book/read?book_idx=${book_idx}&page=${page}" class="btn btn-info">취소</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<!-- Footer -->
<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
</body>
</html>
