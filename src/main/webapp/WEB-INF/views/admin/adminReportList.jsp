<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
</head>
<body>
	<div class="container" align="center">
		<h2 class="title">신고내역 목록</h2>
		<div class="searchDIV">
			<form action="adminReportList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<%-- <c:forTokens var="sh" items="MB_num,MB_numR,RP_reason" delims="," varStatus="i"> --%>
				<c:forTokens var="sh" items="MB_nickName,RP_reason" delims="," varStatus="i">
					<c:if test="${sh == report.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != report.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${report.keyword }" class="inputUnderLine">
			<input type="submit" value="검색" class="btn_search">
		</form>
		</div>
		<table class="table">
			<tr>
				<th class="col-md-2 text-center">번호</th>
				<th class="col-md-2 text-center">상세</th>
				<th class="col-md-2 text-center">신고자</th>
				<th class="col-md-2 text-center">신고사유</th>
				<th class="col-md-2 text-center">게시글 관리</th>
				<th class="col-md-2 text-center">신고 관리</th>
			</tr>
			<c:if test="${empty rpList }">
				<tr>
					<th colspan="6" class="text-center">신고내역이 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty rpList }">
				<c:forEach var="report" items="${rpList }">
					<tr>
						<td class="col-md-2 text-center">${num }
						<c:set var="num" value="${num -1 }"></c:set></td>
						<td class="col-md-2 text-center">
							<a href="adminCpView.do?CP_num=${report.CP_num}&pageNum=${pb.currentPage}">
								<img alt="" src="${path }/resources/main/folder.png" width="20px" height="20px"></a></td>
						<td class="col-md-2 text-center">${report.MB_nickName}</td>
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
						<td class="col-md-2 text-center">
							<c:if test="${report.CP_del == 'N' }">
								<a href="adminCpDelete.do?CP_num=${report.CP_num }&pageNum=${pageNum}">
								<img alt="" src="${path }/resources/main/delete.png" width="17px" height="17px"></a>
							</c:if>
							<c:if test="${report.CP_del == 'Y' }">
								<a href="adminCpRollback.do?CP_num=${report.CP_num }&pageNum=${pageNum}">
									<img alt="" src="${path }/resources/main/recovery.png" width="17px" height="17px"></a>
							</c:if>
						</td>
						<td class="col-md-2 text-center">
							<c:if test="${report.CP_del == 'Y' }">
								<c:if test="${report.RP_del == 'N' }">
									<a href="adminRpDelete.do?RP_num=${report.RP_num }&pageNum=${pageNum}">
										<img alt="" src="${path }/resources/main/delete.png" width="17px" height="17px"></a>
								</c:if>
								<c:if test="${report.RP_del == 'Y' }">
									삭제 완료
								</c:if>
								
							</c:if>
							<c:if test="${report.CP_del == 'N' }">
								관리자 확인중
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<tr><td colspan="6"></td></tr>
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
	</div>
</body>
</html>