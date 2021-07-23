<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeMsg() {
		self.close();
	}
</script>
<style type="text/css">
.btnMsg{
	background: #3243A8;
	color: #eee;
	width: 60px;
	border-radius: 8px;
	text-align: center;
	border: none;
}

.msgTitle {
    font-size: 24px;
    color: #3243A8;
    text-align: left;
    margin-left: 22px;
}
</style>
</head>
<body>
	<h1 class="msgTitle">탑승자 내역</h1>
	<table class="table tableBG">
		<tr>
			<th class="col-xs-4 text-center">닉네임</th>
			<th class="col-xs-4 text-center">성별</th>
			<th class="col-xs-4 text-center">후기</th>
		</tr>
			
			<c:if test="${empty rvsList }">
				<tr>
					<th colspan="3" class="text-center">이용자가 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${not empty rvsList }">
				<c:forEach var="rvsList" items="${rvsList }" >
					<tr>
						<td class="col-xs-4 text-center">${rvsList.MB_nickName }</td>
						
						<c:if test="${rvsList.MB_gender == '1' || rvsList.MB_gender == '3'}">
								<td class="col-xs-4 text-center">남자</td>
						</c:if>
						<c:if test="${rvsList.MB_gender == '2' || rvsList.MB_gender == '4'}">
								<td class="col-xs-4 text-center">여자</td>	
						</c:if>	
						
						<td class="col-xs-4 text-center">
															                            <!-- 글게시자(나)					이용자 -->
							<a href="dvReviewWriteForm.do?RSV_num=${rvsList.RSV_num }&RV_writer=${sessionScope.MB_num }&RV_reader=${rvsList.MB_num }&MB_nickName=${rvsList.MB_nickName}">작성하기</a>
						</td>				
					</tr>
				</c:forEach>
			</c:if>
			
		<tr>
			<td colspan="2" align="center">
				<button class="btnMsg" onclick="closeMsg()">닫기</button>
			</td>
		</tr>
	</table>
</body>
</html>