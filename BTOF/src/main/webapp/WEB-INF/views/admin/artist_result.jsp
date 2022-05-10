<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<c:if test="${result == 1}">
		<script type="text/javascript">
			alert("작가 승인 신청 처리 되었습니다.");
			window.location="/admin/main";
		</script>
	</c:if>
	<c:if test="${result == 2}">
		<script type="text/javascript">
			alert("작가 거절 신청 처리 되었습니다.");
			window.location="/admin/main";
		</script>
	</c:if>
</body>
</html>