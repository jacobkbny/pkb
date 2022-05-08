<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Enroll Artist</title>

					<div>
		        	<h4 style="display: none;">작가등록신청폼</h4>
	        	<!--  어드민으로 보내기  -->
				<!-- 
	        		비밀번호 확인<br/>
	        		<input type="password" name="pwCheck"> <br/>
 				-->
	        		등록할 작가명<br/>
	        		<input type="text" name="artist_name" id="nick" width="250px" value="${artist.artist_name}" disabled/> 
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				본인 인증 첨부서류 
						</div>
						<div class="right item">
							<p>※ 주민등록증, 운전면허증, 여권 등 법적 효력이 있는 신분증만 유효합니다.</p>
							<input type="file" name="img" ${artist.artist_id} disabled />
						</div>	        		
	        		</div>
	        		<hr/>
	        		<div class="formInnerWrap">
						<div class="left item">
	        				포트폴리오 URL 
						</div>
						<div class="right item">
							<p>※ 심사 받을 포트폴리오의 링크 추가</p>
							<input type="text" name="artist_url" value="${artist.artist_url}" disabled /><!-- button으로 하면 form에 연결된요청으로 들어감 -->
						</div>	        		
	        		</div>
	        		<hr />
	        		자기소개 <br />
	        		<textarea rows="10" cols="45" name="artist_introd" disabled>${artist.artist_introd}</textarea>		
	        			
	        		<button type="submit" onclick="window.location='/admin/artist_result?artist_name=${artist.artist_name}&result=1'"> 승인</button>	
	        		<button type="submit" onclick="window.location='/admin/artist_result?artist_name=${artist.artist_name}&result=2'"> 거절</button>	
	        			
			</div>
	        				
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