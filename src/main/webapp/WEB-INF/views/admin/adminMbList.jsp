<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">회원정보</h2>
		<table class="table table-striped">
			<tr>
				<td>회원번호</td>
				<td>회원ID</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>성별</td>
				<td>가입일</td>
				<td>탈퇴 여부</td>				
			</tr>
			<c:if test="${empty list }">
				<tr>
					<th colspan="6">회원정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
						<%-- <c:if test="${member.del == 'Y' }">
							<th colspan="5" align="center">삭제된 회원 입니다</th>
						</c:if> --%>
						<%-- <c:if test="${member.del != 'Y' }"> --%>
							<td>${member.MB_id }</td>
							<td>${member.MB_name }</td>
							<td>${member.MB_nickName }</td>
							<c:if test="${member.MB_gender == 1 || member.MB_gender == 3}">
								<td>남자</td>
							</c:if>
							<c:if test="${member.MB_gender == 2 || member.MB_gender == 4}">
								<td>여자</td>
							</c:if>
							<td>${member.MB_regDate }</td>
							<td>${member.MB_del }</td>
						<%-- </c:if> --%>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="adminMbList.do?pageNum=${pb.startPage - 1 }">
						<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminMbList.do?pageNum=${i }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminMbList.do?pageNum=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminMbList.do?pageNum=${pb.endPage + 1 }">
						<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminMbList.do?pageNum=${pb.totalPage }"> <!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="adminMbList.do">
			<input type="hidden" name="pageNum" value="1">
		</form>
	</div>
</body>
</html>