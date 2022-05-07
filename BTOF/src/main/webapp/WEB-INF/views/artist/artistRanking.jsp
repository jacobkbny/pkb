<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<style>
	th,td{padding:10px;}
	table{border-spacing:5px;}
	div{float:left; text-align: center;}
	</style>
	<meta charset="UTF-8">
	<<!-- 네비css --><link rel="stylesheet" href="../resources/css/mypage/main.css">
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


	<ul>
		<li><a href="/common/main">BTO_FIRE!!</a></li>
	</ul>
	<br />
	<h1 align="center"> Ranking </h1>

		<tr>
			<td colspan="6" align="left">
				<!-- <button onclick="/board/content?artist_name=${prod_artist}">작가페이지로이동</button>  -->
			</td>
		</tr>
		
	<div>
		<h2>HOT ARTIST</h2>
		<table border="1">
	
			<c:forEach var="artistRankListByLikes" items="${artistRankList}" varStatus="status">
			<tr align="left">
				<th rowspan="3">${status.count}</th>
				<th >${artistRankListByLikes.artist_name}</th>
				<td ><input type="button" value="작가페이지로이동" onclick="window.location='/artist/artistPage?artist_name=${artistRankListByLikes.artist_name}'"/></td>
				<td colspan="2" align="right"><input type="button" value="구매하러가기" onclick="window.location='/product/product_detail?prod_no=${artistRankListByLikes.prod_no}'"></td>
			</tr>

			<tr >
				<td align="right">작가 URL</td>
				<td align="right">작가소개</td>
				<td align="center">대표작품</td>
				<td colspan="2" align="right">작품소개</td>
			</tr>
			<tr>
				<td >${artistRankListByLikes.artist_url}</td>
				<td >${artistRankListByLikes.artist_introd}</td>
				<td > <img src="<spring:url value='${artistRankListByLikes.prod_file}'/>" width="100" height="100" />
					<c:choose>
					    <c:when test="${artistRankListLikes[status.index] eq 0}"> <!-- likecheck가0이면 빈하트-->
					        <img src="/resources/imgs/emptyheart.png" 
					             class="btn_like" data-prodno="${artistRankListByLikes.prod_no}" align="left" style="cursor:pointer; width: 20px;">
					    </c:when>
					    <c:otherwise> <!-- likecheck가1이면 빨간 하트-->
					        <img src="/resources/imgs/filledheart.png" 
					              class="btn_like" data-prodno="${artistRankListByLikes.prod_no}" align="left" style="cursor:pointer; width: 20px;">
					    </c:otherwise>
					</c:choose>
				 </td>
				<td >${artistRankListByLikes.prod_descr}</td>
			</tr>
			</c:forEach>
		</table>
	</div>	

		
		
	<div>
		<h2>최신 리스트</h2>
		<table  border="1">
			<%--
			<c:forEach var="RankingNum" items="${RankingNum}">
			<tr>
				<th>${RankingNum}</th>
			</tr>
			</c:forEach>  --%>
			
			<c:forEach var="artistListByStartDay" items="${artistListByStartDay}" varStatus="status">
				<tr align="left">
					<th>${status.count}</th>
					<th colspan="2">${artistListByStartDay.artist_name}</th>
					<td align="right"><input type="button" value="작가페이지로이동" onclick="window.location='/artist/artistPage?artist_name=${artistListByStartDay.artist_name}'"/></td>
					<td colspan="2" align="right"><input type="button" value="구매하러가기"/ onclick="window.location='/product/detail?prod_no=${artistListByStartDay.prod_name}'"></td>
				</tr>
				<tr>
					<td>작가명</td>
					<td>작가이미지</td>
					<td>작품명</td>
					<td>대표작</td>
					<td>작품소개</td>
				</tr>
				
			
			<!-- 시작 시간 순서대로 랭킹리스트 -->
				<tr>
					<td>${artistListByStartDay.artist_name}</td>
					<td align="left"><a href="/board/content?prod_num=${artistListByStartDay.artist_introd}">${artistListByStartDay.prod_name}</a></td>
					<td><img src="<spring:url value='${artistListByStartDay.prod_file}'/>" width="100" height="100" /></td> <%-- 업로드 파일불러오는거 추가해야함! --%>
					<td><img src="<spring:url value='${artistListByStartDay.prod_file}'/>" width="100" height="100" />
						
						<c:choose>
					    <c:when test="${artistListByStartDayLikes[status.index] eq 0}"> <!-- likecheck가0이면 빈하트-->
					        <img src="/resources/imgs/emptyheart.png" 
					             class="btn_like" data-prodno="${artistListByStartDay.prod_no}" align="left" style="cursor:pointer; width: 20px;">
					    </c:when>
					    <c:otherwise> <!-- likecheck가1이면 빨간 하트-->
					        <img src="/resources/imgs/filledheart.png" 
					              class="btn_like" data-prodno="${artistListByStartDay.prod_no}" align="left" style="cursor:pointer; width: 20px;">
					    </c:otherwise>
					</c:choose>
					</td> <%-- 업로드 파일불러오는거 추가해야함! --%>
					<td>${artistListByStartDay.prod_descr}</td>
				</tr>	
			</c:forEach>
		</table>
	</div>	
		
	<script>
/*  */
 	$(document).ready(function(){ 
		
	 
	
/* 좋아요 버튼 눌렀을떄 */
		$(".btn_like").click(function() { 
			var idVal = "${sessionScope.memId}";
			var imgTag = $(this);
			var prod_noVal = $(this).data("prodno");
			console.log(idVal);
			console.log(prod_noVal);
		    $.ajax({
		     	type : "POST",  
				url : "/member/rank_likes",       
		        data : {id:idVal , prod_no : prod_noVal}, //받아온 프로덕트넘버와 유저 아이디.
		        success : function(data) {
		            console.log("data : " + data);
		            console.log(data);
	                if(data == '-1'){
	                    alert("좋아요 오류");
	                }
	                else{
	                    if(data == '1'){
	                    	imgTag.attr("src","/resources/imgs/emptyheart.png");
	                    }
	                    else if (data == '0'){
	                    	imgTag.attr("src","/resources/imgs/filledheart.png" );
	                    }
	                }
	                location.reload(true);
		        },
		        error : function(e){
		                alert("통신 에러");
		                console.log(e);
		        }
			});//ajax
		}); // click
	
 	});// ready
	 
 </script>	
		
	
	

	



	


</body>
</html>