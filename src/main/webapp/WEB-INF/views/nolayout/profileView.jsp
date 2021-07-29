<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
.narrowWidth1 {
	width: 60%;
}
.narrowWidth2 {
	width: 100%;
}
.thumbnail {
	height: 200px;
	width: 200px;
	margin-top: 15px;
}
.btn_SM {
	width: 90%;
	height: 40px;
	border: none;
	background: #242526;
	color: #eee;
	font-size: 18px;
	text-align: center;
}
.profileDiv{
	height: 10vh;
}
.reviewDiv{
	height: 20vh;
	margin-top: 330px;
}
.glyphicon-heart{
	font-size: 22px;
	color: red;
}
.glyphicon-heart:hover {
	text-decoration: none;
	color: red;
}
.glyphicon-heart-empty{
	font-size: 22px;
	color: #000000;
}
.glyphicon-heart-empty:hover{
	text-decoration: none;
	color: red;
}
.glyphicon-envelope {
	font-size: 15px;
	color: #3243A8;
}
.glyphicon-envelope:hover {
	text-decoration: none;
	color: black
}
</style>
</head>
<body>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
		alert("탈퇴한 회원입니다.")
		self.close();
	</script>
	</c:if>

	<c:if test="${result == 1 }">
		<div align="center">
				<h3 class="">${member.MB_nickName }님의 프로필
					<span>
						<c:if test="${favo > 0 }">
								<td colspan="2">
									<a class="glyphicon glyphicon-heart" 
									aria-hidden="true"
									href="deleteFv.do?MB_numG=${sessionScope.MB_num }&MB_numT=${member.MB_num}&MB_nickName=${member.MB_nickName}"></a>
								</td>
						</c:if>
						<c:if test="${favo == 0 }">
							<td colspan="2">
								<a class="glyphicon glyphicon-heart-empty" aria-hidden="true"
									href="addFv.do?MB_numG=${sessionScope.MB_num }&MB_numT=${member.MB_num}&MB_nickName=${member.MB_nickName}"></a>
								</td>									
							</c:if>
						
					</span>
				</h3>
			<div class="profileDiv">
				<div class="narrowWidth1">
					<div id="img_box">
						<img alt="" src="${path }/resources/memberImg/${member.MB_img }" class="thumbnail">
					</div>
					<div id="inform_box">
						<table class="table">
							<tr>
								<td class="col-sm-3 text-center">이메일</td>
								<td class="col-sm-9">${member.MB_id }&nbsp;
									<a class="glyphicon glyphicon-envelope" aria-hidden="true"
										onclick="window.open('msgWriteForm.do?MB_num=${member.MB_num }','쪽지 보내기',
										'width=430,height=400,location=no,status=no,scrollbars=yes');"></a>
								</td>
							</tr>
							<tr>
								<td class="col-sm-3 text-center">닉네임</td>
								<td class="col-sm-9">${member.MB_nickName }</td>
							</tr>

							<c:if
								test="${member.MB_gender == '1' || member.MB_gender == '3'}">
								<tr>
									<td class="col-sm-3 text-center">성별</td>
									<td class="col-sm-9">남자</td>
								</tr>
							</c:if>
							<c:if
								test="${member.MB_gender == '2' || member.MB_gender == '4'}">
								<tr>
									<td class="col-sm-3 text-center">성별</td>
									<td class="col-sm-9">여자</td>
								</tr>
							</c:if>

							<tr>
								<td class="col-sm-3 text-center">가입일</td>
								<td class="col-sm-9">${member.MB_regDate }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="reviewDiv">
				<c:if test="${result2 == -1 }">
						<img alt="" src="${path }/resources/starImg/star.png" width="70px" height="14px">&nbsp;
					<h4>0.0</h4>
				</c:if>
				<c:if test="${result2 != -1 }">
					<h4>
						<img alt="" src="${path }/resources/starImg/star.png" width="70px" height="14px">&nbsp;
						${reviewAvg }
					</h4>
				</c:if>
				<table class="table">
					<tr>
						<th colspan="2" class="text-center">리뷰는 최근 5개까지만 표시됩니다.</th>
					</tr>
					<c:if test="${empty rvList }">
						<tr>
							<th colspan="2" class="text-center">등록된 리뷰가 없습니다.</th>
						</tr>
					</c:if>
					<c:if test="${not empty rvList }">
						<c:forEach var="review" items="${rvList }">
							<tr>
								<td class="col-sm-6 text-left">${review.MB_nickName }</td>
								
								<c:if test="${review.RV_star == 5 }">
									<td class="col-sm-6 text-left">★★★★★</td>
								</c:if>
								<c:if test="${review.RV_star == 4 }">
									<td class="col-sm-6 text-left">★★★★☆</td>
								</c:if>
								<c:if test="${review.RV_star == 3 }">
									<td class="col-sm-6 text-left">★★★☆☆</td>
								</c:if>
								<c:if test="${review.RV_star == 2 }">
									<td class="col-sm-6 text-left">★★☆☆☆</td>
								</c:if>
								<c:if test="${review.RV_star == 1 }">
									<td class="col-sm-6 text-left">★☆☆☆☆</td>
								</c:if>
								<c:if test="${review.RV_star == 0 }">
									<td class="col-sm-6 text-left">☆☆☆☆☆</td>
								</c:if>								
																																								
							</tr>
							<tr>
								<td colspan="2">
									<pre style="border: none">${review.RV_content }</pre>
								</td>
							</tr>
							<br>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>
	</c:if>
</body>
</html>