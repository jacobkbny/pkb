<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	.row{
		display:flex;
	}
	.col-md-2{
		margin:auto;
		position: absolute;
  		top: 40%;
  		left: 20%;
	}

	.btn{
		text-decoration: none;
		font-size:2rem;
		color:white;
		padding:10px 20px 10px 20px;
		margin:20px;
		display:inline-block;
		border-radius: 10px;
		transition: all 0.1s;
		text-shadow: 0px -2px rgba(0, 0, 0, 0.621);
	}
	.btn:active{
		transform: translateY(3px);
	}
	
	.btn.blue{
    
		background-color:rgba(0, 89, 255, 0.867);
		border-bottom:5px solid rgba(0, 89, 255, 0.738);
	}
    .btn.green{
    	
		background-color:green;
		border-bottom:5px solid rgb(6, 151, 6);
	}
    .btn.lightgreen{
    	
		background-color:lightgreen;
		border-bottom:5px solid rgb(154, 230, 154);
	}
    .btn.red{
    	
		background-color: rgb(255, 51, 24);
		border-bottom:5px solid rgb(245, 67, 44);
	}
	.btn.exit{
    	
		background-color: rgb(255, 51, 24);
		border-bottom:5px solid rgb(245, 67, 44);
	}
	.btn.blue:active{
		border-bottom:2px solid rgb(14, 14, 68);
	}

</style>
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



	<h2>고객 센터</h2>
	
	<br/><br/><br/><br/><br/>
	<div class="row" text-align="center">
	<div class="col-md-2">
		<table>
			<tr>
				<td>
    <a class="btn blue" href="/board/notice">공지사항</a>
				</td>
				<td>				
    <a class="btn green" href="/board/inquiry">1대1 문의하기</a>
				</td>
			</tr>
			<tr>
				<td>
						<c:if test="${member.power =='U'}">						
				    <a class="btn lightgreen" href="/member/enrollArtist">작가 등록 신청</a>
						</c:if>
						<c:if test="${member.power =='A'}">
					<a class="btn lightgreen" href="/member/enrollProduct">작품 등록 신청</a>	
						</c:if>
				    </td>
					    <td><a class="btn red" href="/member/exit">회원탈퇴</a></td>
					</tr>
			
		</table>
	</div>
</div>  
	<!--  
	<h1 align="center"> 게시판 </h1>
	<table>
		<tr>
			<td colspan="5" align="left">
				<button onclick="window.location='/board/write'">글작성</button>
			</td>
		</tr>
		<tr>
			<td>No.</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
		</tr>
		<%-- board : BoardVO 객체 담기는 변수 
			 items : 컨트롤러로부터 전달받은 List<BoardVO> 리스트 
					리스트의 요소 개수만큼 자동으로 반복하며, 하나씩 꺼내서 board변수에 체워줌 --%>
		<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno}</td>
				<td align="left"><a class="move" href="${board.bno}">${board.title}</a></td>
				<td>${board.writer}</td>
				<td><fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /> </td>
				<td><fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>	
		</c:forEach>
	</table>
	<br />
	-->
	
	
	
</body>
</html>