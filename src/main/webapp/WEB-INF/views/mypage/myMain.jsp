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

	.narrowWidth1 {
   	 width: 60%;
   	}
   	
   	.narrowWidth2 {
		width: 100%;
	}
	#img_box {
		float: left !important;
		
	}
	
	#inform_box {
		float: right !important;
		width : 55%;
	}
	   
	.thumbnail {
		height: 200px;
		width: 200px;
		margin-top: 15px;
	}
	
	.btn_SM {
		width: 90%;
		height: 40px;
		border: none;
		background: #242526;
		color: #eee;   
		font-size: 18px;
		text-align: center;
	}  
</style>	  
</head>
<body>   
	<div align="center">
		<h2 class="title">${member.MB_nickName } 프로필</h2>  
		<form> 
			<div class=" narrowWidth1" >    
				<div class="col md-2" id="img_box"  >  
					<c:if test="${empty member.MB_img }">
						<img alt="" src="${path }/resources/main/none_img3.jpg" class="thumbnail" >
					</c:if> 
					<c:if test="${not empty member.MB_img  }">  
						<img alt="" src="${path }/resources/memberImg/${member.MB_img }" class="thumbnail" >  
					 </c:if>    	  	 
						<input onclick="location.href='updateForm.do?MB_id${member.MB_id }'"  
			 		     	 class="btn_SM" type="button"   value="내 정보 수정" >
			  	</div>        
				<div class="col md-10" id="inform_box">		       
			  		 <table class="table narrowWidth2">
			  		 	<tr>
							<td class="col md-3 text-center">이메일</td>
							<td class="col md-9">${member.MB_id }</td>
						</tr>
						<tr>
							<td class="col md-3 text-center">이름</td>
							<td class="col md-9">${member.MB_name }</td>
						</tr>
						<tr>
							<td class="col md-3 text-center">주민등록번호</td>
							<td class="col md-9">
								${member.MB_regNum }
								<span>―</span>
								<span>*******</span>
							</td>
						</tr>
						<tr>
							<td class="col md-3 text-center">닉네임</td>
							<td class="col md-9">${member.MB_nickName }</td>
						</tr>
						<tr>
							<td class="col md-3 text-center">연락처</td>
							<td class="col md-9">${member.MB_tel }</td>
						</tr>
						
						<c:if test="${member.MB_gender == '1' || member.MB_gender == '3'}">
							<tr>
								<td class="col md-3 text-center">성별</td>
								<td class="col md-9">남자</td>
							</tr>	
						</c:if>
						<c:if test="${member.MB_gender == '2' || member.MB_gender == '4'}">
							<tr>
								<td class="col md-3 text-center">성별</td>
								<td class="col md-9">여자</td>
							</tr>	
						</c:if>	
						<tr>
							<td class="col md-3 text-center">가입일</td>
							<td class="col md-9">${member.MB_regDate }</td>
						</tr>
						
						<c:if test="${member.MB_driverConfirm == 'Y'}">
							<tr>
								<td class="col md-3 text-center">드라이버</td>
								<td class="col md-9">승인</td>
							</tr>
						</c:if>
						<c:if test="${member.MB_driverConfirm == 'I'}">
							<tr>
								<td class="col md-3 text-center">드라이버</td>
								<td class="col md-9">심사중</td>
							</tr>
						</c:if>
						<c:if test="${member.MB_driverConfirm == 'N'}">
							<tr>
								<td class="col md-3 text-center">드라이버</td>
								<td class="col md-9">미신청/거절(재신청 가능)</td>
							</tr>
						</c:if>
			  		 </table>
	       		</div>
	   		</div>    
		</form>  
	</div>
</body>  
</html>