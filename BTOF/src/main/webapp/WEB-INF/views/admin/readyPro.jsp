<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 등록 승인 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:if test="${uuid_res == 1}">
	<script type="text/javascript">
		alert("작품 등록 승인 처리 되었습니다");
		window.location='/admin/main';
	</script>
	</c:if>


	<h2>readyPro 페이지</h2>
	
	
	
	
	
</body>
</html>