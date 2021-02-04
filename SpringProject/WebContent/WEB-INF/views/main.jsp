<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>책 Farm</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />

<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
window.onload = function() {
	var grid = new tui.Grid({
		el : document.getElementById('grid'),
		pageOptions: {
			perPage: 10,
			useClient: true
		},
		scrollX : false,
		scrollY : true,
		columns : [ {
			header : '#',
			name : 'book_idx'
		}, {
			header : '책이름',
			name : 'book_subject',
			filter : 'text'
		}, {
			header : '도서 상태',
			name : 'book_rate',
			filter : 'select'
		}, {
			header : '희망가',
			name : 'book_price',
			sortingType: 'asc',
	         sortable: true
		}, {
			header : '판매자',
			name : 'book_writer_name'
		} ]
	});
	
	$.ajax({
		url: "${root}readData",
		method: "GET",
		dataType: "JSON",
		success: function(result) {
			grid.resetData(result);
		}
	});
};


</script>


</head>
<body>
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<!-- 팝니다 최신순 -->
	<div class="container" style="margin-top: 100px">
	<h4 class="card-title">판매중인 도서 검색</h4>
	<hr>
		
		<div id="grid"></div>


	</div>

	<c:import url="/WEB-INF/views/include/bottom_info.jsp" />




</body>
</html>









