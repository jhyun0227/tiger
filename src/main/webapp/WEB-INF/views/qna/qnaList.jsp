<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h1 class="title">문의내역</h1>
<div class="searchDIV">
	<form action="qnaList.do">
		<input type="hidden" name="pageNum" value="1">
			<select name="search" class="inputUnderLine">
				<c:forTokens var="sh" items="QA_title,QA_content,subcon" delims="," varStatus="i">
					<c:if test="${sh == qna.search }">
						<option value="${sh}" selected="selected">${title[i.index] }</option>
					</c:if>
					<c:if test="${sh != qna.search }">
						<option value="${sh}">${title[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
				<input type="text" name="keyword" value="${qna.keyword }" class="inputUnderLine">
				<input type="submit" value="검색" class="btn_search">
			</form>
		</div>
<table class="table">
	<tr>
		<th class="col-md-2 text-center">작성일</th>
		<th class="col-md-8 text-center">제목</th>
		<th class="col-md-2 text-center">작성자</th>
	</tr>
	<c:if test="${empty list}">
		<tr>
			<td colspan="3" class="text-center">문의내역이 존재하지 않습니다</td>
		</tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="qna" items="${list }">
			<tr>
			<c:if test="${qna.QA_del != 'Y' }">
				<c:if test="${qna.QA_refLevel > 0 }">
					<td class="col-md-2 text-center">${qna.QA_regDate }</td>
					<td class="col-md-8 text-left title_left">
						<a href="qnaView.do?num=${qna.QA_num }&pageNum=${pb.currentPage}" class="menuTitle">　${qna.QA_title }</a>
						<c:if test="${qna.QA_regDate >= nowday }">
							<img alt="" src="/tiger/resources/icon/new.png" width="22px" height="22px">
						</c:if>
					</td>
					<td class="col-md-2 text-center">${qna.MB_nickName }</td>
				</c:if>
				<c:if test="${qna.QA_refLevel == 0 }">
					<td class="col-md-2 text-center">${qna.QA_regDate }</td>
					<td class="col-md-8 text-left title_left">
						<a href="qnaView.do?num=${qna.QA_num }&pageNum=${pb.currentPage}" class="menuTitle">${qna.QA_title }</a>
						<c:if test="${qna.QA_regDate >= nowday }">
							<img alt="" src="/tiger/resources/icon/new.png" width="22px" height="22px">
						</c:if>
					</td>
					<td class="col-md-2 text-center">${qna.MB_nickName}</td>
				</c:if>
			</c:if>
			</tr>
		</c:forEach>
	</c:if>	
</table>
<div align="center">
	<ul class="pagination_bottom">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="qnaList.do?pageNum=1&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-backward"></span>
				</a>
			</li>
			<li><a href="qnaList.do?pageNum=${pb.pagePerBlock }&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-left"></span>
				</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage == i }">
				<li><a href="qnaList.do?pageNum=${i}&search=${qna.search }&keyword=${qna.keyword}" class="page_num page_current_num">ㅤ${i}ㅤ</a>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="qnaList.do?pageNum=${i}&search=${qna.search }&keyword=${qna.keyword}" class="page_num">ㅤ${i}ㅤ</a>
			</c:if>
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="qnaList.do?pageNum=${pb.endPage+1 }&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-triangle-right"></span>
				</a>
			</li>
			<li><a href="qnaList.do?pageNum=${pb.totalPage }&search=${qna.search }&keyword=${qna.keyword}" class="page_num">
				<span class="glyphicon glyphicon-forward"></span>
				</a>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>