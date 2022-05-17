<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 판매 등록</title>
<!-- 네비css --><link rel="stylesheet" href="../resources/css/mypage/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
							
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
			<h1 align="center">SELL</h1>
	<table width="700" align="center">
		<tr>
			<td rowspan="3">
				<c:choose>
					<c:when test="${product.prod_tag == 'photo'}">
						<img src="<spring:url value='${product.prod_file}'/>" width="300" height="300" />
						<br />
					</c:when>
					<c:when test="${product.prod_tag == 'video'}">
						<video width="400" height="400" controls autoplay loop muted>
							<source src="<spring:url value='${product.prod_file}' />" type="video/mp4" />
						</video>
						
						<br />
					</c:when>
					<c:when test="${product.prod_tag == 'music'}">
						<audio src="<spring:url value='${product.prod_file}' />" controls autoplay></audio>
						<br />
						해당 작품은 오디오 작품으로 <br />이미지가 없습니다.
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
				
			</td>
			<td>
			<h2>작품명 : ${product.prod_name}</h2>
			<!--  <h4>소유자 : ${product.prod_dtl_own}</h4>-->
			
			
		</tr>
		<tr>
			<td>
			<!--	<h3>가격 : ${product.prod_dtl_price}</h3>-->
					
					
					<input  type="button" value="지정가 판매" onclick="openFix()"/> <!--지정가 판매 연결 -->
					<input  type="button" value="입찰 판매" onclick="openAsk()"/> <!-- 입찰 판매 연결 -->
				
				<h4>창작자 : ${product.prod_artist}</h4>
			</td>
		</tr>
		<tr>
			<td>
				<h2>작품상세</h2>
				 ${product.prod_descr} <br />
				<br />
				<button type="button" class="btn btn-secondary" onclick="window.location='/product/artistProd?prod_artist=${product.prod_artist}'"> 작가의 다른 작품 보기 </button> <!-- 작가페이지연결 -->
			</td>
		</tr>
	
	
	
	</table>
	<table width="700" align="center">
		<tr>
			<td>
				<h2>History</h2>
				
				
				
			</td>
		</tr>
	</table>
</body>
	<script type="text/javascript">
	var popupX = (window.screen.width / 2) - (200 / 2);
	var popupY= (window.screen.height /2) - (300 / 2);
	function openFix(){
		let url="/product/Fixsell?prod_name=${product.prod_name}&prod_artist=${product.prod_artist}&r=${r}";
		open(url,"Fixsell", 'status=no, height=700, width=600, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}
	function openAsk(){
		let url="/product/Asksell?prod_name=${product.prod_name}&prod_artist=${product.prod_artist}&r=${r}";
		open(url,"Asksell", 'status=no, height=700, width=600, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	}
	
	</script>
</html>