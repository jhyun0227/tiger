<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
	
   	.narrowWidth2 {
		width: 100%;
	}
	#confirm {
		font-weight: bold;
		color: #3243A8;
	}
	.progress {
		width: 65%;
		height: 15px;
		border-radius: 4px;
		background: none;
		-webkit-appearance: none;
		box-shadow:none;
	}
	#img_box {
		float: left !important;
	}
		
	#inform_box {
		float: right !important;
		width : 60%;
	}
	   
	.thumbnail {
		height: 150px;
		width: 150px;
		margin-top: 0;
		margin-left: -10px;
	}
	
</style>	  
</head>
<body>   
<div class="container narrowWidth1" align="center">
	<h2 class="title">${member.MB_nickName }님의 프로필</h2> 
	<form>
		<div class="row">
			<div class="col-md-1 text-center">
				 <input onclick="location.href='updateForm.do?MB_id${member.MB_id }'"  
				 		  class="btn_setting" type="button" data-toggle="tooltip" 
				 		  data-placement="top" title="변경을 원하시면 CLICK!">	
			</div>
			<div class="col-md-2" id="img_box"  > 
				<c:if test="${empty member.MB_img }">
					<img alt="" src="${path }/resources/main/none_img3.jpg" class="thumbnail" >
				</c:if> 
				<c:if test="${not empty member.MB_img  }">  
					<img alt="" src="${path }/resources/memberImg/${member.MB_img }" class="thumbnail" >  
				 </c:if>    
					 
			</div>
			<div class="col-md-9" id="inform_box">	
				<table class="table narrowWidth2">
					<tr >
						<td class="col-md-3 text-center">이메일</td>
						<td class="col-md-6">${member.MB_id }</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">이름</td>
						<td class="col-md-6">${member.MB_name }</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">주민등록번호</td>
						<td class="col-md-6">
								${member.MB_regNum }
								<span>―</span>
								<span>*******</span>
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">닉네임</td>
						<td class="col-md-6">${member.MB_nickName }</td>
						</tr>
					<tr>
						<td class="col-md-3 text-center">연락처</td>
						<td class="col-md-6">${member.MB_tel }</td>
					</tr>
					<c:if test="${member.MB_gender == '1' || member.MB_gender == '3'}">
					<tr>
						<td class="col-md-4 text-center">성별</td>
						<td class="col-md-6">남자</td>
					</tr>	
					</c:if>
					<c:if test="${member.MB_gender == '2' || member.MB_gender == '4'}">
					<tr>
						<td class="col-md-4 text-center">성별</td>
						<td class="col-md-6">여자</td>
					</tr>	
					</c:if>	
					<tr>
						<td class="col-md-4 text-center">가입일</td>
						<td class="col-md-6">${member.MB_regDate }</td>
					</tr>
					<c:if test="${member.MB_driverConfirm == 'Y'}">
					<tr>
						<td class="col-md-4 text-center">드라이버</td>
						<td class="col-md-6" id="confirm">승인</td>
					</tr>
					</c:if>
					<c:if test="${member.MB_driverConfirm == 'I'}">
					<tr>
						<td class="col-md-4 text-center">드라이버</td>
						<td class="col-md-6 progress" >
							<div class="progress-bar progress-bar-striped active" 
									role="progressbar" aria-valuenow="40" aria-valuemin="0" 
									aria-valuemax="100" style="width: 55%" >
								 <span>심사중</span>
							 </div>
						</td>
					</tr>
					</c:if>
					<c:if test="${member.MB_driverConfirm == 'N'}">
						<tr>
							<td class="col-md-3 text-center">드라이버</td>
							<td class="col-md-6" >미신청/거절(재신청 가능)</td>
						</tr>
					</c:if>
			  	 </table>
			</div>
		</div>
	</form>
</div>	
</body>  
</html>