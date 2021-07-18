<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menuTitle {
	color: #000000;
	margin-left: 30px;
}

.page_num {
	color: #000000;
}

.pagination_bottom {
	display: inline-flex;
	margin-top: 100px;
}

.page_current_num{
	color: #3243A8;
}

.pagination_bottom li a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
<h1 class="title">문의내역</h1>
<table class="table">
	<tr>
		<th class="col-md-2 text-center">작성일</th><th class="col-md-10 text-center">제목</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="2" class="text-center">문의내역이 존재하지 않습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="qna" items="${list }">
			<tr>
			<c:if test="${qna.QA_del != 'Y' }">
				<td class="col-md-2 text-center">${qna.QA_regDate }</td>
				<td class="col-md-10 text-left title_left"><a href="qnaView.do?num=${qna.QA_num }&pageNum=${pb.currentPage}" class="menuTitle">${qna.QA_title }</a></td>
			</c:if>
			</tr>
		</c:forEach>
	</c:if>	
</table>
<div align="center">
	<ul class="pagination_bottom">
		<!-- 시작 페이지가 pagePerBlock 보다 크면 앞에 보여줄 페이지가 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="qnaList.do?pageNum=1&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-backward"></span>
				</a>
			</li>
			<li><a href="qnaList.do?pageNum=${pb.pagePerBlock }&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-left"></span>
				</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li><a href="qnaList.do?pageNum=${i}&search=${qna.search }&keyword=${qna.keyword}" class="page_num page_current_num">ㅤ${i}ㅤ</a>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="qnaList.do?pageNum=${i}&search=${qna.search }&keyword=${qna.keyword}" class="page_num">ㅤ${i}ㅤ</a>
			</c:if>
		</c:forEach>
		<!-- 보여줄 페이지가 남은 경우 / endpage보다 totalpage가 클 경우 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="qnaList.do?pageNum=${pb.endPage+1 }&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-right"></span>
				</a>
			</li>
			<li><a href="qnaList.do?pageNum=${pb.totalPage }&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-forward"></span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>