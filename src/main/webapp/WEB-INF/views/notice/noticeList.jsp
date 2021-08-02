<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var regDate = document.getElementById('NT_regDate').innerText;
	console.log(regDate);
</script>
</head>
<body>
	<div align="center">
		<h2 class="title">공지사항</h2>
		
		<!-- 검색 -->
		<div class="searchDIV">
			<form action="noticeList.do">
				<input type="hidden" name="pageNum" value="1">
				<select name="search" class="inputUnderLine">
					<c:forTokens var="sh" items="NT_title,NT_content,subcon" delims="," varStatus="i">
						<c:if test="${sh == notice.search }">
							<option value="${sh}" selected="selected">${title[i.index] }</option>
						</c:if>
						<c:if test="${sh != notice.search }">
							<option value="${sh}">${title[i.index] }</option>
						</c:if>
					</c:forTokens>
				</select>
				<input type="text" name="keyword" value="${notice.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
			</form>
		</div>
		<table class="table">
			<tr>
				<th class="col-md-1 text-center">번호</th>
				<th class="col-md-7 text-center">제목</th>
				<th class="col-md-2 text-center">작성자</th>
				<th class="col-md-2 text-center">작성일</th>
			</tr>
			<c:if test="${empty noticeList }">
				<tr>
					<td colspan="4" class="text-center">공지사항이 존재하지 않습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty noticeList }">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<c:if test="${notice.NT_del != 'Y' }">
							<td class="col-md-1 text-center">${num }
								<c:set var="num" value="${num -1 }"></c:set></td>	
							<td class="col-md-7 text-left">
								<a href="noticeView.do?NT_num=${notice.NT_num}&pageNum=${pb.currentPage}" class="menuTitle">${notice.NT_title }</a>
								<c:if test="${notice.NT_regDate >= nowday }">
									<img alt="" src="/tiger/resources/icon/new.png" width="22px" height="22px">
								</c:if>
									</td>
							<td class="col-md-2 text-center">관리자</td>
							<td class="col-md-2 text-center" id="NT_regDate">${notice.NT_regDate }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		
		<!-- 페이징 -->
		<div align="center">
			<ul class="pagination_bottom">
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li>
						<a href="noticeList.do?pageNum=1&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num"><span class="glyphicon glyphicon-backward"></span>
						</a>
					</li>
					<li><a href="noticeList.do?pageNum=${pb.startPage - 1 }&search=${notice.search }&keyword=${notice.keyword }"
						class="page_num"><span class="glyphicon glyphicon-triangle-left"></span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li><a href="noticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num page_current_num">ㅤ${i}ㅤ</a></li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="noticeList.do?pageNum=${i }&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num">ㅤ${i}ㅤ</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="noticeList.do?pageNum=${pb.endPage + 1 }&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num"><span class="glyphicon glyphicon-triangle-right"></span>
					</a></li>
					<li><a href="noticeList.do?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword }"
							class="page_num"><span class="glyphicon glyphicon-forward"></span>
					</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>