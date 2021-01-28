<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>책 Farm</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


</head>
<body>
<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
	<!-- 팝니다 최신순 -->
	<div class="container" style="margin-top: 100px">
		<div class="form-group row pull-right">
			<div class="col-xs-10">
				<input class="form-control" type="text" size="30">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" type="button">검색</button>
			</div>
		</div>
		<div id="grid"></div>
		<script type="text/javascript">
				const gridData = [
			  {
				book_idx: '0',
				book_subject: '자바 첫걸음',
			    book_price: '15000'
			  },
			  {
				book_idx: '1',
				book_subject: '스프링',
				book_price: '14000'    
			  },
			  {
				book_idx: '2',
				book_subject: '오라클',
				book_price: '16000'
			  },
			  {
				book_idx: '3',
				book_subject: '정보처리기사',
				book_price: '18000'
			  },
			  {
				book_idx: '4',
				book_subject: '객체지향',
				book_price: '13000'
			  }
			];
		
			  const grid = new tui.Grid({
		      el: document.getElementById('grid'),
		      data: gridData,
		      scrollX: false,
		      scrollY: false,
		      columns: [
		        {
		          header: '아이디',
		          name: 'book_idx'
		        },
		        {
		          header: '책이름',
		          name: 'book_subject'
		        },
		        {
		          header: '가격',
		          name: 'book_price'
		        }
		      ]
		    });
		</script>

	</div>
	
	<c:import url="/WEB-INF/views/include/bottom_info.jsp"/>
	

	

</body>
</html>









