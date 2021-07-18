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
		<h2 class="title">회원정보</h2>
		<table class="table table-striped">
			<tr>
				<td>회원번호</td>
				<td>회원ID</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>성별</td>
				<td>가입일</td>
				<td>쪽지</td>				
			</tr>
			<c:if test="${empty mbList }">
				<tr>
					<th colspan="7">회원 정보가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty mbList }">
				<c:forEach var="member" items="${mbList }">
					<tr>
						<td>${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
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
							<c:if test="${member.MB_del == 'N' }">
								<td>쪽지전송
									<button onclick="window.open('msgWriteForm.do?MB_num=${member.MB_num }','쪽지 보내기',
										'width=430,height=400,location=no,status=no,scrollbars=yes');" class="btn btn-danger">전송</button>
								</td>
							</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="adminMbList.do?pageNum=1&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminMbList.do?pageNum=${pb.startPage - 1 }&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminMbList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminMbList.do?pageNum=${i }&search=${member.search }&keyword=${member.keyword }">${i }</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminMbList.do?pageNum=${pb.endPage + 1 }&search=${member.search }&keyword=${member.keyword }">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminMbList.do?pageNum=${pb.totalPage }&search=${member.search }&keyword=${member.keyword }">
							<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="adminMbList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="MB_id,MB_name,MB_nickName,MB_gender,MB_regDate" delims="," varStatus="i">
					<c:if test="${sh == member.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != member.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${member.keyword }">	<!-- model에 추가해줘야한다 -->
			<input type="submit" value="검색" class="btn btn-info">
		</form>
	</div>
</body>
</html>