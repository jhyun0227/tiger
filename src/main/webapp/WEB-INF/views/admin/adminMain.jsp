<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/adminMain.css">
</head>
<body>
	<div class="content">
		<ul class="content_main">
			<li>
				<h3>타세요 관리</h3> <c:if test="${adminRvAllList.size() == 0}">
					<p>내역이 존재하지 않습니다.</p>
				</c:if> 
				<c:if test="${adminRvAllList.size() != 0}">
					<a href="adminRvList.do">+ 자세히</a>
					<table>
						<tr>
							<th class="col-md-3">작성자</th>
							<th class="col-md-3">신청자</th>
							<th class="col-md-6">출발지</th>
						</tr>
						<c:forEach items="${adminRvAllList }" var="reservation">
							<tr>
								<td class="text-center">${reservation.MB_nickNameDv }</td>
								<td class="text-center">${reservation.MB_nickName }</td>
								<td>${reservation.CP_startPoint }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			<li>
				<h3>드라이버 승인</h3> 
				<c:if test="${applyList.size() == 0}">
					<p>드라이버 신청 정보가 없습니다</p>
				</c:if> 
				<c:if test="${applyList.size() != 0}">
					<a href="adminPermitList.do">+ 자세히</a>
					<table>
						<tr>
							<th>아이디</th>
							<th>승인상태</th>
						</tr>
						<c:forEach var="apply" items="${applyList }">
							<tr>
								<td>${apply.MB_id }</td>
								<c:if test="${apply.MB_driverConfirm == 'I'}">
									<td>심사중</td>
								</c:if>
								<c:if test="${apply.MB_driverConfirm == 'N'}">
									<td>반려</td>
								</c:if>
								<c:if test="${apply.MB_driverConfirm == 'Y' }">	
									<td>승인완료</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			<li>
				<h3>문의내역</h3> 
				<c:if test="${allQnaList.size() == 0}">
					<p>등록한 전시가 없습니다.</p>
				</c:if> <c:if test="${allQnaList.size() != 0}">
					<a href="adminQnaList.do">+ 자세히</a>
					<table>
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach items="${allQnaList}" var="qna">
							<tr>
								<td>
									<a href="/semojeon/views/display/dpView.do?dno=${display.dno}">${display.dname}</a></td>
								<td>
									<a href="/semojeon/views/display/dpView.do?dno=${display.dno}">${display.spot}</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
			<li>
				<h3>신고내역</h3> <c:if test="${bdList.size() == 0}">
					<p>작성한 스토리가 없습니다.</p>
				</c:if> <c:if test="${bdList.size() != 0}">
					<a href="adminReportList.do">+ 자세히</a>
					<table>
						<tr>
							<th>제목</th>
							<th>작성날짜</th>
						</tr>
						<c:forEach items="${bdList}" var="board">
							<tr>
								<td><a
									href="/semojeon/views/board/boardView.wo?bno=${board.bno}">${board.title}</a></td>
								<td><a
									href="/semojeon/views/board/boardView.wo?bno=${board.bno}">${board.reg_date}</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
		</ul>
	</div>
</body>
</html>