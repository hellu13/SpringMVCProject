<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<script>
	alert("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다")
	location.href="${root}user/login?isFail=true"
</script>