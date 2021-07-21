<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.page_current_num {
	color: orange;
}

.pagination_bottom li a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container" align="center">
		<h2 class="title">신고내역 목록</h2>
		<table class="table">
			<tr>
				<th class="col-md-2 text-center">번호</th>
				<th class="col-md-2 text-center">작성자</th>
				<th class="col-md-2 text-center">신고자</th>
				<th class="col-md-2 text-center">신고사유</th>
			</tr>
			<c:if test="${empty rpList }">
				<tr>
					<th colspan="4" class="text-center">신고내역이 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty rpList }">
				<c:forEach var="report" items="${rpList }">
					<tr>
						<td class="col-md-2 text-center">${num }
						<c:set var="num" value="${num -1 }"></c:set></td>
						<td class="col-md-2 text-center">
							<a href="cpView.do?CP_num=${report.CP_num}&pageNum=${pb.currentPage}">${report.MB_id}</a></td>
						<td class="col-md-2 text-center">${report.RP_id}</td>
						<c:if test="${report.RP_reason == 1 }">
							<td class="col-md-2 text-center">광고성/홍보성</td>
						</c:if>
						<c:if test="${report.RP_reason == 2 }">
							<td class="col-md-2 text-center">음란물/성적수치심 유발</td>
						</c:if>
						<c:if test="${report.RP_reason == 3 }">
							<td class="col-md-2 text-center">욕설 및 비방</td>
						</c:if>
						<c:if test="${report.RP_reason == 4 }">
							<td class="col-md-2 text-center">불법정보 유통</td>
						</c:if>
						<c:if test="${report.RP_reason == 5 }">
							<td class="col-md-2 text-center">불쾌한 표현</td>
						</c:if>
						<c:if test="${report.RP_reason == 6 }">
							<td class="col-md-2 text-center">개인정보 노출</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="adminReportList.do?pageNum=1&search=${report.search }&keyword=${report.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span></a></li>
					<li><a href="adminReportList.do?pageNum=${pb.startPage - 1 }&search=${report.search }&keyword=${report.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li><a href="adminReportList.do?pageNum=${i }&search=${report.search }&keyword=${report.keyword }"
							class="page_num page_current_num">ㅤ${i}ㅤ</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminReportList.do?pageNum=${i }&search=${report.search }&keyword=${report.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminReportList.do?pageNum=${pb.endPage + 1 }&search=${report.search }&keyword=${report.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminReportList.do?pageNum=${pb.totalPage }&search=${report.search }&keyword=${report.keyword }"
						class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		<form action="adminReportList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="MB_num,MB_numR,RP_reason" delims="," varStatus="i">
					<c:if test="${sh == report.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != report.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${report.keyword }">	<!-- model에 추가해줘야한다 -->
			<input type="submit" value="검색" class="btn btn-info">
		</form>
	</div>
</body>
</html>