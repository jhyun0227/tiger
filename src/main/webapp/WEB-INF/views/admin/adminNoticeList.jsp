<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="title">공지사항 목록</h2>
		<table class="table table-striped">
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:if test="${empty noticeList }">
				<tr>
					<th colspan="4">게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty noticeList }">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td>${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<!-- 게시글 번호 순서 정렬 -->
						<c:if test="${notice.NT_del == 'Y' }">
							<th colspan="4" align="center">삭제된 글 입니다</th>
						</c:if>
						<c:if test="${notice.NT_del != 'Y' }">
							<td><a href="adminNoticeView.do?NT_num=${notice.NT_num}&pageNum=${pb.currentPage}">${notice.NT_title }</a></td>
							<td>관리자</td>
							<td>${notice.NT_regDate }</td>
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
						<a href="adminNoticeList.do?pageNum=1&search=${notice.search }&keyword=${notice.keyword }">
							<span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminNoticeList.do?pageNum=${pb.startPage - 1 }&search=${notice.search }&keyword=${notice.keyword }">
							<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminNoticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }">${i }</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminNoticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }">${i }</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminNoticeList.do?pageNum=${pb.endPage + 1 }&search=${notice.search }&keyword=${notice.keyword }">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminNoticeList.do?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword }">
							<!-- 끝페이지로 바로 이등(순서 생각하며 넣기) -->
						<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="adminNoticeList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="NT_title,NT_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == notice.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != notice.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${notice.keyword }">	<!-- model에 추가해줘야한다 -->
			<input type="submit" value="검색" class="btn btn-info">
		</form>
		<%-- <c:if test="${sessionScope.MB_id == 'admin'}"> --%>
			<div align="center">
				<a href="adminNoticeWriteForm.do?NT_num=0&pageNum=1" class="btn btn-success">공지사항 작성</a>
			</div>
		<%-- </c:if> --%>
	</div>
</body>
</html>