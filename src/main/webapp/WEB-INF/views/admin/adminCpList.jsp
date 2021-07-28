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
	<h1 class="title">타세요 관리 목록</h1>
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
		<c:if test="${empty adminCpList}">
			<tr>
				<td colspan="3" class="text-center">이 존재하지 않습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty adminCpList }">
			<c:forEach var="carpool" items="${adminCpList }">
				<tr>
					<td class="col-md-1 text-center">${num }
						<c:set var="num" value="${num -1 }"></c:set></td>
					<td class="col-md-1 text-center">
						<a href="adminCpView.do?CP_num=${carpool.CP_num }&pageNum=${pb.currentPage}"
							class="btn_prev">상세</a></td>	
					<td class="col-md-2 text-center">${carpool.MB_nickName }</td>
					<td class="col-md-2 text-center">${reservation.MB_nickName }</td>
					<td class="col-md-2 text-center">${carpool.CP_startPoint }</td>
					<td class="col-md-2 text-center">${carpool.CP_endPoint }</td>
					<td class="col-md-2 text-center">
						<c:if test="${carpool.RSV_confirm == 'Y' && carpool.RSV_mConfirm == 'Y' }">매칭완료</c:if>
						<c:if test="${carpool.RSV_confirm == 'Y' && carpool.RSV_mConfirm == 'N' }">매칭대기</c:if>
						<c:if test="${carpool.RSV_confirm == 'N' && carpool.RSV_mConfirm == 'N' }">거절</c:if>
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
						<a href="adminCpList.do?pageNum=1&search=${carpool.search }&keyword=${carpool.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="adminCpList.do?pageNum=${pb.startPage - 1 }&search=${carpool.search }&keyword=${carpool.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="adminCpList.do?pageNum=${i }&search=${carpool.search }&keyword=${carpool.keyword }"
							class="page_num page_current_num">　${i}　</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="adminCpList.do?pageNum=${i }&search=${carpool.search }&keyword=${carpool.keyword }"
							class="page_num">　${i }　</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="adminCpList.do?pageNum=${pb.endPage + 1 }&search=${carpool.search }&keyword=${carpool.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="adminCpList.do?pageNum=${pb.totalPage }&search=${carpool.search }&keyword=${carpool.keyword }"
							class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		<form action="adminCpList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="MB_nickNameD,MB_nickNameP,CP_startPoint,CP_endPoint" delims="," varStatus="i">
					<c:if test="${sh == carpool.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != carpool.search }">  
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${carpool.keyword }">
				<input type="submit" value="검색" class="btn btn-info">
		</form>
	</div>
</body>
</html>