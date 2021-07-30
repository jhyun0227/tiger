<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1 class="title">타세요 관리 목록</h1>
		<div class="searchDIV">
			<form action="adminCpList.do">
				<input type="hidden" name="pageNum" value="1">
				<select name="search" class="inputUnderLine">
					<c:forTokens var="sh" items="MB_nickName,CP_startPoint,CP_endPoint,CP_startDate,CP_startTime" delims="," varStatus="i">
						<c:if test="${sh == carpool.search }">
							<option value="${sh}" selected="selected">${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != carpool.search }">  
							<option value="${sh}">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select>
					<input type="text" name="keyword" value="${carpool.keyword }" class="inputUnderLine">
					<input type="submit" value="검색" class="btn_search">
			</form>
		</div>
	<table class="table">
		<tr>
			<th class="col-md-1 text-center">번호</th>
			<th class="col-md-1 text-center">상세</th>
			<th class="col-md-1 text-center">작성자</th>
			<th class="col-md-2 text-center">출발지</th>
			<th class="col-md-2 text-center">도착지</th>
			<th class="col-md-2 text-center">출발일</th>
			<th class="col-md-1 text-center">출발시간</th>
			<th class="col-md-1 text-center">완료/전체</th>
			<th class="col-md-1 text-center">삭제여부</th>
		</tr>
		<c:if test="${empty adminCpList}">
			<tr>
				<td colspan="9" class="text-center">등록된 게시글이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not empty adminCpList }">
			<c:forEach var="carpool" items="${adminCpList }">
				<tr>
					<c:if test="${today > carpool.CP_startDate || todayTime > carpool.CP_startTime}">
						<td colspan="9" class="text-center">출발시간이 지난 글입니다</td>
					</c:if>
					<td class="col-md-1 text-center">${num }
						<c:set var="num" value="${num -1 }"></c:set></td>
					<td class="col-md-1 text-center">
						<a href="adminCpView.do?CP_num=${carpool.CP_num }&pageNum=${pb.currentPage}"
							class="btn_open">이동</a></td>	
					<td class="col-md-1 text-center">${carpool.MB_nickName }</td>
					<td class="col-md-2 text-center">${carpool.CP_startPoint }</td>
					<td class="col-md-2 text-center">${carpool.CP_endPoint }</td>
					<td class="col-md-2 text-center">${carpool.CP_startDate }</td>
					<td class="col-md-1 text-center">${carpool.CP_startTime }</td>
					<td class="col-md-1 text-center">
						<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
							${carpool.CP_passNumNow } / ${carpool.CP_passNum }
						</c:if>
						<c:if test="${carpool.CP_passNumNow == carpool.CP_passNum }">
							마감
						</c:if>
					</td>
					<td class="col-md-1 text-center">${carpool.CP_del }</td>
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
	</div>
</body>
</html>