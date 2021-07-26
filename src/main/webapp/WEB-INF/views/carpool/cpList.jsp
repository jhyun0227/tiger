<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./bootstrap/css/styles.css" rel="stylesheet" />
</head>
<body>
		<!-- 검색창 -->
		<form action="cpList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<option value="CP_startPoint">출발지</option>
				<option value="CP_endPoint">도착지</option>
			</select>
			<input type="text" name="keyword" value="${carpool.keyword }">
			<input type="submit" class="btn btn-warning" value="검색">
		</form>
		
		<!-- 타세요 작성 버튼 -->
		<div align="right">
			<a href="cpWriteForm.do?CP_num=0&pageNum=1" class="btn btn-success">타세요 작성</a>
		</div>

	<div class="container px-4 px-lg-5" align="center">
		<h2 class="text-primary">타세요 리스트</h2>
		<table class="table table-striped">
			<tr>
				<th>등록 번호</th>
				<th>상세보기</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>요금</th>
				<th>출발일</th>
				<th>출발시간</th>
				<th>좌석수</th>
			</tr>
			<c:if test="${empty cpList }">
				<tr>
					<th colspan="8">등록된 게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty cpList }">
				<c:forEach var="carpool" items="${cpList }">
					<tr>
						<td>${CP_num}<c:set var="CP_num" value="${CP_num - 1}"></c:set>
						<%-- ${carpool.CP_num } --%></td>
						<c:if test="${carpool.CP_del == 'Y' }">
							<th colspan="7">삭제된 글 입니다</th>
						</c:if>
						<c:if test="${carpool.CP_del != 'Y' }">
							<td title="상세보기">
								<a href="cpView.do?CP_num=${carpool.CP_num }&pageNum=${pageNum}" class="btn btn-info btn-sm">상세보기</a>
							</td>
							<td>${carpool.CP_startPoint }</td>
							<td>${carpool.CP_endPoint }</td>
							<td>${carpool.CP_fee }</td>
							<td>${carpool.CP_startDate }</td>
							<td>${carpool.CP_startTime }</td>
							<td>${carpool.CP_passNum }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="cpList.do?pageNum=1&search=${carpool.search }&keyword=${carpool.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="cpList.do?pageNum=${pb.startPage-1 }&search=${carpool.search }&keyword=${carpool.keyword}">
						<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="cpList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="cpList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}">${i}</a></li>
					</c:if>
				</c:forEach>
				
				<!-- 보여줄 것이 남아있는 경우는 다음 endpage보다 totalPage가 클경우 -->
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="cpList.do?pageNum=${pb.endPage+1 }&search=${carpool.search }&keyword=${carpool.keyword}">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="cpList.do?pageNum=${pb.totalPage}&search=${carpool.search }&keyword=${carpool.keyword}">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="bootstrap/js/scripts.js"></script>
</body>
</html>