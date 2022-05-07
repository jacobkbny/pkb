<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 작품 등록 신청 페이지</title>
		<<!-- 네비css --><link rel="stylesheet" href="../resources/css/mypage/main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>	

			
			<c:if test="${sessionScope.memId == null}">
				<script type="text/javascript">
					alert("로그인후 이용 가능합니다.");
					window.location="/common/login";
				</script>
			</c:if>
			
			<c:if test="${result == -1 }">
				<script type="text/javascript">
					alert("작가 등록 먼저 신청후 가능합니다");
					window.location="/member/enrollArtist";
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

				

	<!-- 상단 네비-->
	<%-- include file="/WEB-INF/views/common/nav.jsp" --%>
	 
	<!-- 중앙 -->
	<!-- 중앙 상단 / 좌 / 우 
	
	
	
	<div id="wrap">
	    <main class="body_inner">
	        <section id="main_top" class="main_inner"><h3>작가등록 신청 페이지</h3></section>
	        <section id="main_left" class="main_inner">
	        	<h3>Collection</h3>
	        	<h4>판매상태</h4>
	        	<input type="checkbox" name="all">전체보기<br/>
	        	<input type="checkbox" name="onsale">판매중<br/>
	        	<input type="checkbox" name="notsale">미판매
	        	
					        	
	        	
	        </section>
	        <section id="main_right" class="main_inner">
	-->        	
	        	<h4 style="display: none;"><a href="">작품등록 신청폼</a></h4>
	        	<form action="/member/enrollProductPro" method="post" name="inputForm" enctype="multipart/form-data" onsubmit="return check()">
	        	<!--  어드민으로 보내기  -->
				<!-- 
	        		비밀번호 확인<br/>
	        		<input type="password" name="pwCheck"> <br/>
 				-->
	        		등록할 작품명<br/>
	        		<input type="text" name="prod_name" id="prod_name" width="250px"> 
	        		<!-- <button onclick="window/location='member/artistNCheck'">중복확인</button> -->
	        		<select name="prod_tag">
    					<option value="">작품종류</option>
					    <option value="photo">사진</option>
					    <option value="video">동영상</option>
					    <option value="audio">오디오</option>
					</select>
	        		<hr/>
	        		<!--  나중에 세션으로 받아옴 -->
	        		<div class="formInnerWrap">
						<div class="left item">
	        				작품파일  업로드  
						</div>
						<div class="right item">
							<p>※ 승인심사 후에 작품이 marketplace에 등록이 가능합니다</p>
							<input type="file" name="file" id="file" />
						</div>	        		
	        		</div>
	        			<hr/>
	        			<div>  분할 갯수</div>
	        				<input type="text" name="prod_div" id="pieces">
	        					<br/>
	        					<h5> 수수료 발생 : 분할 갯수당 10000원이 부과됩니다.</h5>
	       				<div>  <input type="text" name="fees" id="fees" disabled></div>
	       					<hr/>
	        				
	        			<div>     가격   </div>
		        		
	       				<div>  <input type="text" name="prod_price" id="price"> </div>
	       					<br/>
	        			
	        		<!--  
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				포트폴리오 URL 
						</div>
						<div class="right item">
							<p>※ 심사 받을 포트폴리오의 링크 추가</p>
							<input type="text" name="portfolio_url" />
							
						</div>	        		
	        		</div>
			        		-->
							<!-- button으로 하면 form에 연결된요청으로 들어감 -->
	        		<hr />
	        		작품소개 <br />
	        		<textarea rows="10" cols="45" name="prod_descr" id="content"></textarea>		
	 						       		
	        		<div class="right">
		        		<input type="submit" value="신청하기" />
		        		<input type="reset" value="reset" />
		        		<input type="button" value="취소" onclick="window.location='history.goback(-1)'" />
	        		</div>
	        	</form>
<!-- 
	        </section>
	    </main>
	</div> -->
	<!-- 푸터 -->
				
	<%-- include file="/WEB-INF/views/common/footer.jsp" --%>
	
	<script>
		// class : .class값 
		// id : #id값
		$(function(){
			function func(){
				let pieces =document.getElementById('pieces').value;
				let fees = pieces*10000;
				console.log(fees);
				$("#fees").val("fees:"+fees);
			}
			$("#pieces").change(function(){
					func();
			});
		});	
	</script>
		<script type="text/javascript">
			function check(){
				let inputs = document.inputForm;
				if(!inputs.prod_name.value){
					alert("작품명을 입력하세요.");
					return false;
				}
				
				if(!inputs.file.value){
					alert("파일을 업로드하세요.");
					return false;
				}
				
				if(!inputs.pieces.value){
					alert("분할갯수를 입력하세요.");
					return false;
				}
				
				if(!inputs.price.value){
					alert("가격을 입력하세요.");
					return false;
				}
				
				if(!inputs.content.value){
					alert("작품설명을 입력하세요.");
					return false;
				}
				
				
			}
		
		
		</script>
</body>
</html>