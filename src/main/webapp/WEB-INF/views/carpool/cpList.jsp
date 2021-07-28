<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 현재시간 불러와서 타세요 글중에서 시간 지난글 안보여줌 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todayTime" />
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>Insert title here</title>
<!-- 타세요 only CSS-->
<link href="${path }/resources/bootstrap/css/carpool.css" rel="stylesheet" />
</head>
<body>
<h1 class="title">타세요 목록</h1>
	<!-- 검색창 -->
	<div class="searchDIV">
		<form action="cpList.do">
			<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<option value="CP_startPoint">출발지</option>
				<option value="CP_endPoint">도착지</option>
			</select>
			<input type="text" name="keyword" value="${carpool.keyword }" class="inputUnderLine">
			<input type="submit" value="검색" class="btn_search">
		</form>
		
		<!-- 타세요 작성 버튼 -->
		<div align="right">
			<a href="cpWriteForm.do?CP_num=0&pageNum=1" class="btn_sm_full">타세요 작성</a>
		</div>
    </div>




	<div align="center">
		<div class="col-sm-4">
			<div class="power">
			<c:if test="${empty cpList }">
				<tr>
					<th colspan="8" class="text-center">등록된 게시글이 없습니다</th>
				</tr>
			</c:if>
			<table></table>
				<h2 class="totaly_text">Totaly Optimised</h2>
				<p class="making">making it look like readable English. Many
					desktop publishing packages and web page editors now use Lorem
					Ipsum as their default model text, and a search for 'lorem ipsum'
					will uncover many web sites still</p>
			<button type="button" class="read_bt"><a href="#">Read More</a></button>
			</table>
			</div>
		</div>
	</div>


	<table class="table">
		<!-- 	<tr>
				<th class="text-center">등록 번호</th>
				
				<th class="text-center">상세보기</th>
				<th class="text-center">출발지</th>
				<th class="text-center">도착지</th>
				<th class="text-center">요금</th>
				<th class="text-center">출발일</th>
				<th class="text-center">출발시간</th>
				<th class="text-center">매칭완료 / 전체좌석</th>
			</tr> -->
			<c:if test="${empty cpList }">
				<tr>
					<th rowspan="6" class="text-center">등록된 게시글이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty cpList }">
				<c:forEach var="carpool" items="${cpList }">
						<c:if test="${carpool.CP_del == 'Y' }">
							<th rowspan="6" class="text-center">삭제된 글 입니다</th>
						</c:if>
						<c:if test="${carpool.CP_del != 'Y' }">
							<tr>
								<td>
									<input type="hidden" value="${CP_num}"><c:set var="CP_num" value="${CP_num - 1}"></c:set>
								</td>
							</tr>
							<!-- 1.현재날짜와 비교해서 출발일이 이후 일때 목록 보여줌 -->
							<c:if test="${today < carpool.CP_startDate}">
								<%-- <td title="상세보기" class="text-center">
									<a href="cpView.do?CP_num=${carpool.CP_num }&pageNum=${pageNum}" class="btn btn-default btn-sm">상세보기</a>
								</td> --%>
								<tr>
									<td><h4 class="title">출발지</h4></td>
									<td></td>
								</tr>
								<td class="text-center">${carpool.CP_startPoint }</td>
								<td class="text-center">${carpool.CP_endPoint }</td>
								<td class="text-center">${carpool.CP_fee }</td>
								<td class="text-center">${carpool.CP_startDate }</td>
								<td class="text-center">${carpool.CP_startTime }</td>
								<td class="text-center">
									<!-- 1-1.매칭완료된 좌석수 / 총 좌석수  -->
									<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
										${carpool.CP_passNumNow } / ${carpool.CP_passNum }
									</c:if>
									<!-- 1-2.매칭완료좌석수와 총좌석수가 같으면 "완료된 매칭"으로 띄움 -->
									<c:if test="${carpool.CP_passNumNow == carpool.CP_passNum }">
										완료된 매칭
									</c:if>
								</td>
							</c:if>
							<!-- 2.현재날짜와 비교해서 지난 출발일들은 목록에서 보여주지 않음 -->
		 					<c:if test="${today > carpool.CP_startDate}">
		 						<th colspan="7" class="text-center">출발시간이 지난 매칭 입니다</th>
		 					</c:if>
		 					<!-- 3.현재날짜와 비교해서 출발일이 같을때도 목록 보여줌 -->
							<c:if test="${today == carpool.CP_startDate}">
								<!-- 3-1.현재시간과 비교해서 출발시간 일때 목록 보여줌 -->
								<c:if test="${todayTime < carpool.CP_startTime}">
									<td title="상세보기" class="text-center">
										<a href="cpView.do?CP_num=${carpool.CP_num }&pageNum=${pageNum}" class="btn btn-default btn-sm">상세보기</a>
									</td>
									<td class="text-center">${carpool.CP_startPoint }</td>
									<td class="text-center">${carpool.CP_endPoint }</td>
									<td class="text-center">${carpool.CP_fee }</td>
									<td class="text-center">${carpool.CP_startDate }</td>
									<td class="text-center">${carpool.CP_startTime }</td>
									<td class="text-center">
										<!-- 3-1-1.매칭완료된 좌석수 / 총 좌석수  -->
										<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
											${carpool.CP_passNumNow } / ${carpool.CP_passNum }
										</c:if>
										<!-- 3-1-2.매칭완료좌석수와 총좌석수가 같으면 "완료된 매칭"으로 띄움 -->
										<c:if test="${carpool.CP_passNumNow == carpool.CP_passNum }">
											완료된 매칭
										</c:if>
									</td>
								</c:if>
								<!-- 3-2.현재시간과 비교해서 지난 출발시간은 목록에서 보여주지 않음 -->
			 					<c:if test="${todayTime > carpool.CP_startTime}">
			 						<th colspan="7" class="text-center">출발시간이 지난 매칭 입니다</th>
			 					</c:if>
							</c:if>
						</c:if>		
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination_bottom">
				<!-- 시작페이지가 pagePerBlock(10)보다 크면 앞에 보여줄 페이지가 있다 -->
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="cpList.do?pageNum=1&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
						<span class="glyphicon glyphicon-backward"></span>
					</a></li>
					<li><a href="cpList.do?pageNum=${pb.startPage-1 }&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
						<span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li><a href="cpList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num page_current_num">${i}</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="cpList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">${i}</a></li>
					</c:if>
				</c:forEach>
				
				<!-- 보여줄 것이 남아있는 경우는 다음 endpage보다 totalPage가 클경우 -->
				<c:if test="${pb.endPage < pb.totalPage}">
					<li><a href="cpList.do?pageNum=${pb.endPage+1 }&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
							<span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="cpList.do?pageNum=${pb.totalPage}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">
							<span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>