<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/common.css">
</head>
<body>
	<h1 class="title">타세요 예약 내역</h1>
	<div class=" container searchDIV">
		<form action="adminRvList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="CP_startPoint,CP_endPoint" delims="," varStatus="i">
					<c:if test="${sh == reservation.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != reservation.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${reservation.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
		</form>
	</div>
	<table class="table">
		<tr>
			<th class="col-md-1 text-center">번호</th>
			<th class="col-md-1 text-center">상세</th>
			<th class="col-md-2 text-center">작성자</th>
			<th class="col-md-2 text-center">신청자</th>
			<th class="col-md-2 text-center">출발지</th>
			<th class="col-md-2 text-center">도착지</th>
			<th class="col-md-2 text-center">매칭여부</th>
			
		</tr>
		<c:if test="${empty adminRvAllList}">
			<tr>
				<td colspan="8" class="text-center">내역이 존재하지 않습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty adminRvAllList }">
			<c:forEach var="reservation" items="${adminRvAllList }">
				<tr>
					<td class="col-md-1 text-center">${num }
						<c:set var="num" value="${num -1 }"></c:set></td>
					<td class="col-md-1 text-center">
						<a href="adminRvView.do?CP_num=${reservation.CP_num }&pageNum=${pb.currentPage}"
							class="btn_open">상세</a></td>	
					<td class="col-md-2 text-center">
						<a onclick="window.open('profileView.do?MB_nickName=${reservation.MB_nickNameDv }', '',
							'width=500,height=560,location=no,status=no,scrollbars=yes');"
							class="inputLineA">${reservation.MB_nickNameDv }</a>
					</td>
					<td class="col-md-2 text-center">
						<a onclick="window.open('profileView.do?MB_nickName=${reservation.MB_nickName }', '',
							'width=500,height=560,location=no,status=no,scrollbars=yes');"
							class="inputLineA">${reservation.MB_nickName }</a>
					</td>
					<td class="col-md-2 text-center">${reservation.CP_startPoint }</td>
					<td class="col-md-2 text-center">${reservation.CP_endPoint }</td>
					<td class="col-md-2 text-center">
						<c:if test="${reservation.RSV_confirm == 'Y' && reservation.RSV_mConfirm == 'Y' }">매칭완료</c:if>
						<c:if test="${reservation.RSV_confirm == 'Y' && reservation.RSV_mConfirm == 'N' }">매칭대기</c:if>
						<c:if test="${reservation.RSV_confirm == 'N' && reservation.RSV_mConfirm == 'N' }">거절</c:if>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="adminRvList.do?pageNum=1&search=${reservation.search }&keyword=${reservation.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminRvList.do?pageNum=${pb.startPage - 1 }&search=${reservation.search }&keyword=${reservation.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminRvList.do?pageNum=${i }&search=${reservation.search }&keyword=${reservation.keyword }"
							class="page_num page_current_num">　${i}　</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminRvList.do?pageNum=${i }&search=${reservation.search }&keyword=${reservation.keyword }"
							class="page_num">　${i }　</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminRvList.do?pageNum=${pb.endPage + 1 }&search=${reservation.search }&keyword=${reservation.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminRvList.do?pageNum=${pb.totalPage }&search=${reservation.search }&keyword=${reservation.keyword }"
							class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
	</div>
</body>
</html>