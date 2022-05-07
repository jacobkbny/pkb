<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>	
<body>			
			<c:if test="${sessionScope.memId != null}">
				<script type="text/javascript">
					alert("이미 로그인 하셨습니다.");
					window.location='/product/sell_list';
				</script>
			
			</c:if>


		<c:if test="${sessionScope.memId == null}"> 
		
				
				
				
				
				<c:if test="${result ==0 }">
				<script type="text/javascript">
					alert("아이디 혹은 비밀번호가 틀렸습니다. 다시 입력해주세요");
					history.go(-1);
				</script>
				</c:if>			
			
			<c:if test="${pref_result ==1}">
				<script type="text/javascript">
					alert("관심분야가 저장이 완료되었습니다. 로그인후 관심분야 작품들을 만나보실수 있습니다.");			
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
			
			
			
			
					<br/><br/><br/>
					<h2 align="center"> BTOF </h2>
		<form action="/common/login" method="post" name="login_form" onsubmit="return check()">
			<div style="margin-top : 250px " align="center">
			<table>
					<tr>
						<td>
									ID																
						</td>					
					</tr>
					
					<tr>
						<td>
								<input type="text" id="id"name="id"/>																
						</td>					
					</tr>
						</table>
							<br/><br/>
						<table>
					<tr>
						<td>
									PW																
						</td>					
					</tr>
					
					<tr>
						<td>
								<input type="password" id="pw" name="pw"/>																
						</td>					
					</tr>
			</table>	
						<br/><br/>
						<a href="/common/findID">forgot ID? </a>
							<br/>
						<a href="/common/findPw">forgot password? </a>
							<br/>
								<%@ include file="login_google.jsp" %>
								<%@ include file="login_kakao.jsp" %>
								<br/><br/>
					<button type="submit" name="login_btn" style="height:60px;width:auto;"> 로그인</button>
						<br/>
						
					<a href="/common/signup">don't have account? Register here</a>	
			</div>
		</form>
			<script type="text/javascript">
			function check(){
				let inputs = document.login_form;
				//console.log(inputs);//폼태그 잘 가져왔는지 체크
				if(!inputs.id.value){//값이 없으면
					alert("아이디를 입력하세요");
					return false;
				}
				if(!inputs.pw.value){
					alert("비밀번호를 입력하세요");
					return false;
				}
				
			}
			</script>
			</c:if>

</body>
</html>