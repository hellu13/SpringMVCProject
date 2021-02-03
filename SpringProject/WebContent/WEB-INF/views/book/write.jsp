<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
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
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form:form action="${root }book/write_pro" method="post" modelAttribute="writeBookBean" enctype="multipart/form-data">
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
								<form:label path="upload_file">첨부 이미지</form:label>
								<form:input type='file' path='upload_file' class="form-control" accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button class='btn btn-primary'>등록하기</form:button>
								</div>
							</div>

						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />

</body>
</html>
