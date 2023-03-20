<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<div>
		<form action="${pageContext.request.contextPath}/Manager/Update" method="post">
		<div class="col-lg-4">
            <h3 class="m-0 font-weight-bold text-gray-800">아이디</h3>
			<input type="hidden" id="userID" name="userID" value="${admin.adminId }">
			<input type="text" disabled name="userID" value="${admin.adminId }">
		</div>
		<div class="col-lg-4">
            <h3 class="m-0 font-weight-bold text-gray-800">비밀번호</h3>
            <input class="form-control form-control-user" type="password" id="userPW" name="userPW" value="${admin.adminPw }">
		</div>
		<div class="col-lg-4">
            <h3 class="m-0 font-weight-bold text-gray-800">이름</h3>
            <input class="form-control form-control-user" id="userName" name="userName" value="${admin.adminName }">
		</div>
        <div class="col-lg-4">
        	<h3 class="m-0 font-weight-bold text-gray-800">직함</h3>
            <select class="custom-select" id="adminTitle" name="adminTitle">
           		<option value="${admin.adminTitle }">${admin.adminTitle }</option>
            	<c:forEach var="adminSelect" items="${adminTitleList }">
            		<c:if test="${admin.adminTitle ne adminSelect }">
	             		<option value="${adminSelect }">${adminSelect }</option>
					</c:if>
            	</c:forEach>
            </select>
		</div>
        <div class="col-lg-4">
        	<h3 class="m-0 font-weight-bold text-gray-800">전화번호</h3>
            <input class="form-control form-control-user" id="adminHp" name="adminHp" type="text" value="${admin.adminHp }"/>
        </div>
        <div class="col-lg-4">
        	<h3 class="m-0 font-weight-bold text-gray-800">이메일</h3>
         	<input class="form-control form-control-user" id="adminEmail" name="adminEmail" type="text" value="${admin.adminEmail }"/>
        </div>
        <br>        <br>
        <div class="col-lg-4 fic">
        	<button type="submit" class="btn btn-success">수정</button>
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/home">Cancel</a>
        </div>
		</form>
	</div>