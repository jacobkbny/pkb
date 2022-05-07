<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MarketPlace</title>
	<!-- 네비css --><link rel="stylesheet" href="../resources/css/mypage/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
		<c:if test="${artist_pass =='D'}">
			<script type="text/javascript">
				alert("작가 승인 신청이 거절 되었습니다. 다시 신청해주세요");
			</script>
		</c:if>
						
	<header class="p-3 mb-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          
          <li><a href="/common/main" class="nav-link px-2 text-secondary">BTO_FIRE!!</a></li>
          <li><a href="/product/sell_list" class="nav-link px-2 text-black">MARKETPLACE</a></li>
          <li><a href="/artist/artistPage" class="nav-link px-2 text-black">ARTIST</a></li>
          <li><a href="/member/collection?prod_dtl_own=${nick}" class="nav-link px-2 text-black">MYNFT</a></li>
          <li><a href="/artist/artistRanking" class="nav-link px-2 text-black">RANKING</a></li>
          <li><a href="/board/notice" class="nav-link px-2 text-black">SUPPORT</a></li>
        </ul>

        

        <div class="text-end">
        	<c:if test="${sessionScope.memId != null}">
        		<form action="/member/logout" method="post">
        			<input type="submit" class="btn btn-light" value="로그아웃" />
        		</form>
        	<div align="right" display="inline">
       			<button onclick="window.location='/buyAuction'">경매 참여</button>
       			<button onclick="window.location='/member/mypage'">mypage</button>
       			<button onclick="window.location='/member/cashIn'">balance</button>
        	</div>
        	</c:if>
        	<c:if test="${sessionScope.memId == null}">
        		<button type="button" class="btn btn-light" onclick="window.location='/common/login'">로그인</button>
            <button type="button" class="btn btn-light" onclick="window.location='/common/signup'">회원가입</button>
        	</c:if>
        	
            
        </div>
      </div>
    </div>
  </header>

	<h1 align="center"> Market Place </h1>
	
	<table>
		<tr>
			<td rowspan="4">
			<h3>type</h3>
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_listCate?prod_tag=photo'">photo</button><br /><br />
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_listCate?prod_tag=video'">video</button><br /><br />
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_listCate?prod_tag=music'">music</button><br /><br />
				<button type="button" class="btn btn-outline-dark" onclick="window.location='/product/sell_list'">all</button><br /><br />
				<br /><br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
			<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>  
		<tr>
			<c:forEach var="product" items="${list}">
				<td>
					
					
					<c:choose>
						<c:when test="${product.prod_tag == 'photo'}">
							<a href="../product/sell?prod_no=${product.prod_no}&prod_name=${product.prod_name}&prod_artist=${product.prod_artist}">
								<img src="<spring:url value='${product.prod_file}'/>" width="150" height="150" />
								<br />
								${product.prod_name} (by ${product.prod_artist})
							</a>
							
						</c:when>
						<c:when test="${product.prod_tag == 'video'}">
							<a href="../product/sell?prod_no=${product.prod_no}&prod_name=${product.prod_name}&prod_artist=${product.prod_artist}">
								<video width="150" height="150" controls autoplay loop muted>
									<source src="<spring:url value='${product.prod_file}' />" type="video/mp4" />
								</video>
								<br />
								${product.prod_name} (by ${product.prod_artist})
							</a>
							
							
						</c:when>
						<c:when test="${product.prod_tag == 'music'}">
							<a href="../product/sell?prod_no=${product.prod_no}&prod_name=${product.prod_name}&prod_artist=${product.prod_artist}">
								<img src="<spring:url value='/img/audioThumb.jpg'/>" width="150" height="150" />
								<br />
								${product.prod_name} (by ${product.prod_artist})
							</a>
						</c:when>
						<c:otherwise>
							<h1>잘못된 태그</h1>
						</c:otherwise>
					</c:choose>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</c:forEach>
		</tr>	
	</table>
	<br />
		<script type="text/javascript">
			console.log(${session.memId});
		
		
		</script>
	
	
</body>
</html>