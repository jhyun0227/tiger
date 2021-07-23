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
		<h2 class="title">이용 내역 목록</h2>
		<table class="table">
			<tr>
				<th class="col-md-1 text-center">번호</th>
				<th class="col-md-1 text-center">상세페이지</th>
				<th class="col-md-2 text-center">출발일</th>
				<th class="col-md-2 text-center">출발지</th>
				<th class="col-md-2 text-center">도착지</th>
				<th class="col-md-2 text-center">작성자</th>
				<th class="col-md-1 text-center">매칭상태</th>
				<th class="col-md-1 text-center">후기 작성</th>
			</tr>
			<c:if test="${empty myRvList }">
				<tr>
					<th colspan="8" class="text-center">이용내역이 존재하지 않습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty myRvList }">
				<c:forEach var="rvList" items="${myRvList }">
					<tr>
							<td class="col-md-1 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
							<td class="col-md-1 text-center">
								<a href="cpView.do?CP_num=${rvList.CP_num }&pageNum=${pageNum}" class="btn btn-info btn-sm">이동</a>
							</td>
							<td class="col-md-2 text-center">${rvList.CP_startDate }</td>
							<td class="col-md-2 text-center">${rvList.CP_startPoint }</td>
							<td class="col-md-2 text-center">${rvList.CP_endPoint }</td>
							
							<td class="col-md-2 text-center">
								<button onclick="window.open('profileView.do?MB_nickName=${rvList.MB_nickNameDv }', '',
									'width=500,height=1000,location=no,status=no,scrollbars=yes');" class="btn btn-danger">프로필 조회</button>
							</td>
							
							<c:if test="${rvList.RSV_confirm == 'Y' && rvList.RSV_mConfirm == 'N' }">
								<td class="col-md-1 text-center">매칭대기</td>
							</c:if>
							<c:if test="${rvList.RSV_confirm == 'Y' && rvList.RSV_mConfirm == 'Y' }">
								<td class="col-md-1 text-center">매칭완료</td>
							</c:if>
							<c:if test="${rvList.RSV_confirm == 'N' && rvList.RSV_mConfirm == 'N' }">
								<td class="col-md-1 text-center">매칭거절</td>
							</c:if>							
							
							<!-- 날짜 비교해서 후기 작성 버튼 활성화 만들것 -->
							<td class="col-md-1 text-center">
																										<!-- DMB_num에는 후기테이블에 작성자 컬럼에 들어가기 위해 카풀 게시글 등록자의 이름을 보냄 -->
								<button onclick="window.open('psgReviewWriteForm.do?RSV_num=${rvList.RSV_num }&RV_writer=${rvList.MB_num }&RV_reader=${rvList.MB_numDv }&MB_nickName=${rvList.MB_nickNameDv }', '',
									'width=500,height=500,location=no,status=no,scrollbars=yes');" class="btn btn-danger">후기 작성</button>
							</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<!-- 페이징 -->
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="PsgHistoryList.do?pageNum=1&search=${rvList.search }&keyword=${rvList.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span></a></li>
					<li><a href="PsgHistoryList.do?pageNum=${pb.startPage - 1 }&search=${rvList.search }&keyword=${rvList.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-left"></span></a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<!-- 현재 머물고 있는 페이지가 몇 페이지인지 구별할 때 -->
					<c:if test="${pb.currentPage == i }">
						<li><a href="PsgHistoryList.do?pageNum=${i }&search=${rvList.search }&keyword=${rvList.keyword }"
							class="page_num page_current_num">ㅤ${i}ㅤ</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="PsgHistoryList.do?pageNum=${i }&search=${rvList.search }&keyword=${rvList.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
				</c:forEach>
				<!-- 보여줄 페이지가 뒤에 남아있는 경우(다음 버튼 활성화)=> endPage < totalPage인 경우 -->
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="PsgHistoryList.do?pageNum=${pb.endPage + 1 }&search=${rvList.search }&keyword=${rvList.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="PsgHistoryList.do?pageNum=${pb.totalPage }&search=${rvList.search }&keyword=${rvList.keyword }"
						class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
		
		<!-- 검색 -->
		<form action="PsgHistoryList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="CP_startDate, CP_startPoint, CP_endPoint" delims=", " varStatus="i">
					<c:if test="${sh == rvList.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != rvList.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value="${rvList.keyword }">	<!-- model에 추가해줘야한다 -->
			<input type="submit" value="검색" class="btn btn-info">
		</form>
	</div>
</body>
</html>