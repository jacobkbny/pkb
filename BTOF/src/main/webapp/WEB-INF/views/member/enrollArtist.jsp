<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Enroll Artist</title>
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
			<c:if test="${sessionScope.memId == null}">
				<script type="text/javascript">
					alert("로그인후 이용 가능합니다.");
					window.location="/common/login";
				</script>
			</c:if>
	
			<c:if test="${result == -1}">
				<script type="text/javascript">
					alert("이미 작가로 신청되셨습니다.");
					history.go(-1);
				</script>
			</c:if>
	
		
	
	        	<h4 style="display: none;"><a href="">작가등록신청폼</a></h4>
	        	<form action="/member/enrollArtistPro" method="post" enctype="multipart/form-data" name="enrollArtist" onsubmit="return check()">
	        	<!--  어드민으로 보내기  -->
				<!-- 
	        		비밀번호 확인<br/>
	        		<input type="password" name="pwCheck"> <br/>
 				-->
	        		등록할 작가명<br/>
	        		<input type="text" name="artist_name" id="nick" width="250px"> 
	        		<input type="text" name="check" id="check" disabled/>
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				본인 인증 첨부서류 
						</div>
						<div class="right item">
							<p>※ 주민등록증, 운전면허증, 여권 등 법적 효력이 있는 신분증만 유효합니다.</p>
							<input type="file" name="img" />
						</div>	        		
	        		</div>
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				포트폴리오 URL 
						</div>
						<div class="right item">
							<p>※ 심사 받을 포트폴리오의 링크 추가</p>
							<input type="text" name="artist_url" /><!-- button으로 하면 form에 연결된요청으로 들어감 -->
						</div>	        		
	        		</div>
	        		<hr />
	        		자기소개 <br />
	        		<textarea rows="10" cols="45" name="artist_introd"></textarea>		
	        		
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
	function check(){
		let inputs = document.enrollArtist;
		//console.log(inputs);//폼태그 잘 가져왔는지 체크
		if(!inputs.artist_name.value){//값이 없으면
			alert("작가활동명을 입력하세요");
			return false;
		}
		if(!inputs.portfolio_url.value){
			alert("포트폴리오 url을 입력하세요");
			return false;
		}
		if(!inputs.content.value){
			alert("자기소개를 입력하세요");
			return false;
	}
	}

	</script>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#nick").change(function(){ 
				let nickVal = $("#nick").val();
				console.log(nickVal);
				$.ajax({
					type : "post",
					url : "/member/ajaxArtistNick",
					data : {nick : nickVal},
					success : function(result){
						console.log("요청 성공!");
						console.log("Result : " +result);
						$("#check").val(result);
						
					},
					error : function(e){
						console.log("에러발생!");
						console.log(e);
					}
				});
			});
		});
		
		
		</script>
	
	
</body>
</html>