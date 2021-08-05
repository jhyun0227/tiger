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
<script type="text/javascript">
	$("#myModal").on('show.'("/"))
</script>
<!-- 타세요 only CSS-->
<link href="${path }/resources/bootstrap/css/carpool.css" rel="stylesheet" />
</head>
<body>
<h1 class="title">타세요 목록</h1>
<!-- 타세요 작성 버튼 -->
	<div align="right" class="formtag">
		<a href="cpWriteForm.do?CP_num=0&pageNum=1" class="btn_sm_full">타세요 작성</a>
		
	<!-- Button trigger modal -->
		<button type="button" class="btn_sm_stroke" data-toggle="modal" data-target="#myModal">
		서비스 이용약관
		</button>
	</div>
<!-- 검색창 -->
<div class="searchDIV">
	<form action="cpList.do" class="searchtag">
		<input type="hidden" name="pageNum" value="1">
		<select name="search" class="inputUnderLine">
			<option value="CP_startPoint">출발지</option>
			<option value="CP_endPoint">도착지</option>
		</select>
		<input type="text" name="keyword" value="${carpool.keyword }" class="inputUnderLine">
		<input type="submit" value="검색" class="btn_search">
	</form>
</div>
	
<!-- 타세요 목록  -->
<div align="center">
	<c:if test="${empty cpList }">
		<div class="col-sm-4">
		<div class="power">
			<table>
				<tr>
					<th class="text-center">등록된 게시글이 없습니다.</th>
				</tr>
			</table>
		</div>
		</div>
	</c:if>
	<c:if test="${not empty cpList }">
		<c:forEach var="carpool" items="${cpList }">
			<c:if test="${carpool.CP_del == 'Y' }">
				<div class="col-sm-4">
				<div class="power">
					<table>
						<tr>
							<th class="text-center">삭제된 글입니다.</th>
						</tr>
					</table>
				</div>
				</div>
			</c:if>
			<c:if test="${carpool.CP_del != 'Y' }">
			<div class="col-sm-4">
				<div class="power">
					<table style="table-layout:fixed">
						<!-- 1.현재날짜와 비교해서 출발일이 이후 일때 목록 보여줌 -->
						<c:if test="${today < carpool.CP_startDate}">
							<input type="hidden" value="${CP_num}"><c:set var="CP_num" value="${CP_num - 1}"></c:set>
							<tr>
								<td colspan="2">
									<c:if test="${carpool.CP_gendertype eq ' 남자'}">
										<h6><img alt="" src="/tiger/resources/main/man.png" width="35px" height="35px">ㅤ${carpool.CP_gendertype }</h6>
									</c:if>
									<c:if test="${carpool.CP_gendertype == ' 여자'}">
										<h6><img alt="" src="/tiger/resources/main/woman.png" width="35px" height="35px">ㅤ${carpool.CP_gendertype }</h6>
									</c:if>
									<c:if test="${carpool.CP_gendertype == ' 무관'}">
										<h6><img alt="" src="/tiger/resources/main/manwoman.png" width="35px" height="35px">ㅤ${carpool.CP_gendertype }</h6>
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="ellip right">
									<img alt="" src="/tiger/resources/main/startpoint.png" width="20px" height="20px" class="left">
									${carpool.CP_startPoint }
								</td>
							</tr>
							<tr>
								<td colspan="2"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"> </span></td>
							</tr>
							<tr class="bordered">
								<td colspan="2" class="ellip right">
									<img alt="" src="/tiger/resources/main/endpoint.png" width="20px" height="20px" class="left">
									${carpool.CP_endPoint }
								</td>
							</tr>
							<tr>
								<td><h5>요금</h5></td>
								<td class="right">
									<!-- 요금 출력시 천단위마다 콤마(,) 찍기 -->
									<fmt:formatNumber value="${carpool.CP_fee }" groupingUsed="true" /> 원
								</td>
							</tr> 
							<tr>
								<!-- 출발일에 맞는 요일 출력  -->
								<td colspan="2" class="right"><fmt:formatDate pattern ="yyyy-MM-dd (E)" value="${carpool.CP_startDate }"/>ㅤ${carpool.CP_startTime }</td>
							</tr>
							<tr class="bordered">
								<td colspan="2">
									<h6><span class="glyphicon glyphicon-ok"></span>${carpool.CP_option }</h6>
								</td>
							</tr>
							<!-- 1-1.매칭완료된 좌석수 / 총 좌석수  -->
							<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
								<tr>
									<td colspan="2" class="text-center margintop">매칭완료 / 전체좌석</td>
								</tr>
								<tr>
									<td colspan="2" class="text-center">${carpool.CP_passNumNow } / ${carpool.CP_passNum }</td>
								</tr>
							</c:if>
							<!-- 1-2.매칭완료좌석수와 총좌석수가 같으면 "완료된 매칭"으로 띄움 -->
							<c:if test="${carpool.CP_passNumNow == carpool.CP_passNum }">
								<tr>
									<td colspan="2" class="text-center matching">완료된 매칭</td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2">
									<button type="button" class="read_bt"><a href="cpView.do?CP_num=${carpool.CP_num }&pageNum=${pageNum}">Read More</a></button>
								</td>
							</tr>
						</c:if>
			
						<!-- 2.현재날짜와 비교해서 지난 출발일들은 목록에서 보여주지 않음 -->
						<c:if test="${today > carpool.CP_startDate}">
							<tr>
								<td class="text-center">출발시간이 지난 매칭입니다.</td>
							</tr>
						</c:if>
						
	 					<!-- 3.현재날짜와 비교해서 출발일이 같을때도 목록 보여줌 -->
						<c:if test="${today == carpool.CP_startDate}">
							<!-- 3-1.현재시간과 비교해서 출발시간 이후일때 목록 보여줌 -->
							<c:if test="${todayTime < carpool.CP_startTime}">
								<input type="hidden" value="${CP_num}"><c:set var="CP_num" value="${CP_num - 1}"></c:set>
								<tr>
									<td colspan="2">
										<c:if test="${carpool.CP_gendertype eq ' 남자'}">
											<h6><img alt="" src="/tiger/resources/main/man.png" width="35px" height="35px">ㅤ${carpool.CP_gendertype }</h6>
										</c:if>
										<c:if test="${carpool.CP_gendertype == ' 여자'}">
											<h6><img alt="" src="/tiger/resources/main/woman.png" width="35px" height="35px">ㅤ${carpool.CP_gendertype }</h6>
										</c:if>
										<c:if test="${carpool.CP_gendertype == ' 무관'}">
											<h6><img alt="" src="/tiger/resources/main/manwoman.png" width="35px" height="35px">ㅤ${carpool.CP_gendertype }</h6>
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="ellip right">
										<img alt="" src="/tiger/resources/main/startpoint.png" width="20px" height="20px" class="left">
										${carpool.CP_startPoint }
									</td>
								</tr>
								<tr>
									<td colspan="2"><span class="glyphicon glyphicon-arrow-down" aria-hidden="true"> </span></td>
								</tr>
								<tr class="bordered">
									<td colspan="2" class="ellip right">
										<img alt="" src="/tiger/resources/main/endpoint.png" width="20px" height="20px" class="left">
										${carpool.CP_endPoint }
									</td>
								</tr>
								<tr>
									<td><h5>요금</h5></td>
									<td class="right">
										<!-- 요금 출력시 천단위마다 콤마(,) 찍기 -->
										<fmt:formatNumber value="${carpool.CP_fee }" groupingUsed="true" /> 원
									</td>
								</tr>
								<tr>
									<!-- 출발일에 맞는 요일 출력  -->
									<td colspan="2" class="right"><fmt:formatDate pattern ="yyyy-MM-dd (E)" value="${carpool.CP_startDate }"/>ㅤ${carpool.CP_startTime }</td>
								</tr>
								<tr class="bordered">
									<td colspan="2">
									<h6><span class="glyphicon glyphicon-ok"></span>${carpool.CP_option }</h6></td>
								</tr>
								<!-- 3-1-1.매칭완료된 좌석수 / 총 좌석수  -->
								<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
									<tr>
										<td colspan="2" class="text-center margintop">매칭완료 / 전체좌석</td>
									</tr>
									<tr>
										<td colspan="2" class="text-center">${carpool.CP_passNumNow } / ${carpool.CP_passNum }</td>
									</tr>
								</c:if>
								<!-- 3-1-2.매칭완료좌석수와 총좌석수가 같으면 "완료된 매칭"으로 띄움 -->
								<c:if test="${carpool.CP_passNumNow == carpool.CP_passNum }">
									<tr>
										<td colspan="2" class="text-center matching">완료된 매칭</td>
									</tr>
								</c:if>
								<tr>
									<td colspan="2">
										<button type="button" class="read_bt"><a href="cpView.do?CP_num=${carpool.CP_num }&pageNum=${pageNum}">Read More</a></button>
									</td>
								</tr>
							</c:if>
					
							<!-- 3-2.현재시간과 비교해서 지난 출발시간은 목록에서 보여주지 않음 -->
		 					<c:if test="${todayTime > carpool.CP_startTime}">
								<tr>
									<th class="text-center">출발시간이 지난 매칭입니다.</th>
								</tr>
	 						</c:if>
	 					</c:if>
	 				</table>
	 			</div>
	 		</div>
	 		</c:if>
		</c:forEach>
	</c:if>
</div>

<!-- Paging number button -->
<div align="center">
	<div class="nextLine">
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
					<li><a href="cpList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num page_current_num">ㅤ${i}ㅤ</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li><a href="cpList.do?pageNum=${i}&search=${carpool.search }&keyword=${carpool.keyword}" class="page_num">ㅤ${i}ㅤ</a></li>
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
</div>

<!-- Modal -->
	<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	 	<div class="modal-dialog ">
	 	   <div class="modal-content ">
			    <div class="modal-header">
		 	      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		 	      <h4 class="modal-title" id="myModalLabel" align="center">타세요 이용 약관</h4>
		   		  </div>
		 		<div class="modal-body " align="left">
		      		<p4>■ 환영합니다</p4>  <br>
		      	<p5>&nbsp;&nbsp;&nbsp; 주식회사 타세요(이하 ‘회사’)가 제공하는 서비스를 이용해 주셔서 감사합니다. 
		      		본 약관은 여러분이 타세요 서비스를 이용하는 데 필요한 권리, 의무 및 책임사항, 
		      		이용조건 및 절차 등 기본적인 사항을 규정하고 있으므로 
		      		조금만 시간을 내서 주의 깊게 읽어주시기 바랍니다. </p5>
		        <br>
		      	<p4>■ 타세요 이용계약 </p4>  
		      	<br>
		      	<p5>&nbsp;&nbsp;&nbsp;타세요 계정신청은 여러분이 타세요 정보에 일정 정보를 입력하는 
		      	방식으로 이루어집니다. 회사는 입력된 일정 정보를 인증한 후 가입을 승낙함으로써 체결됩니다. </p5>
		        <br>
		       	<p4>■  타세요 이용의 제한</p4> 
		       	 <br>
		      	<p5>&nbsp;&nbsp;&nbsp;미성년자(만19세 미만)는 회사의 서비스를 이용할 수 없습니다. 
		      	또한 회사는 여러분의 서비스 이용을 정지, 삭제 등 적절한 제한을 할 수 있습니다.</p5>
		        <br>
		       	<p4>■  타세요 이용의 해지</p4> 
		       	 <br>
		      	<p5>&nbsp;&nbsp;&nbsp; 여러분이 타세요계정 이용을 더이상 원하지 않는 때에는 언제든지
		      	서비스를 내 제공되는 메뉴를 이용하여 이용계약의 해지 신청을 할 수 있으며, 
		      	회사는 법령이 정하는 바에 따라 신속하게 처리하겠습니다. </p5>
		        <br>
		       	<p4>■ 손해배상  </p4> 
		       	 <br>
		      	<p5>&nbsp;&nbsp;&nbsp;회사는 법령상 허용되는 한도 내에서 서비스와 관령하여 본 약관에 명시되지 않은 어떠한
		      	구체적인 사항에 대한 약정이나 보증을 하지 않습니다. 또한 회사는 회원이 작성하는 방법으로 서비스에 게재된 
		      	정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며, 회사의 과실없이 발생된 
		      	여러분의 손해에 대해서는 어떠한 책임을 부담하지 아니합니다.  </p5>
		        <br>
		       	<p4>■ 타세요 신청건 철회 </p4> 
		       	 <br>
		      	<p5>&nbsp;&nbsp;&nbsp;철회는 아래과 같이 가능합니다. 이 이후 발생하는 위약건에 대해서는 위약금이 발생합니다. </p5><br>
		      	<p5>&nbsp;&nbsp;&nbsp; - 작성하신 타세요의 운행건에 대한 취소는 최소 출발시간의 30분전까지 가능합니다. </p5><br>
		      	<p5>&nbsp;&nbsp;&nbsp; - 신청하신 타세요의 탑승건에 대한 취소는 최소 출발시간의 10분전까지 가능합니다. </p5>
		        <br>
		       	<p4>■ 여러분의 쾌적한 서비스 이용을 위한 운영정책을 적용하고 있습니다.  </p4> 
		       	 <br>
		      	<p5>&nbsp;&nbsp;&nbsp;서비스 이용 중 다른 이용자의 운영정책 위반 행위로 인한 피해를 입으신 경우,
		      	여러분은 이를 회사에 제보하여 운영정책의 적용을 요청할 수 있으며, 회사는 신고내용을 확인하여
		      	제재 조치를 취할 수 있습니다. 또한 신고가 없더라도 회사는 관련 법령 또는 약관에 위배되거나
		      	 본 운영정책에서 금지하는 활동이 발견된 경우, 운영정책에 따른 제재 조치를 취할 수 있습니다. 
		      	  그러나 서비스 내 이용자들 간에 발생하는 분쟁 및 이용자 스스로의 과실로 일어난 피해에 대해서는 
		      	  개입하거나 조치하지 않습니다. 
		      	  </p5>
		        <br>  
 		  </div>
 		   		</div>
	       		 <div class="modal-footer">
	      			<button type="button" class="btn_sm_full" data-dismiss="modal">확인</button>
	  			</div>
	   		</div>
	 	</div>
</body>
</html>