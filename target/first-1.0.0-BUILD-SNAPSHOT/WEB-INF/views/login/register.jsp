<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${msg == 'Y'}">
	alert("중복된 아이디입니다! 다시 입력해주세요!")
</c:if>
<div class="panel panel-inverse">
	<div class="panel-heading">
		<h4 class="title">회원등록</h4>
	</div>
	<div class="panel-body ">
		<div class="row">
			<form class="user" id='adminSubmit' action='${pageContext.request.contextPath}/adminInsert' method='post'>
				<input type="hidden" name="userSeq" value="${loginInfo.userSeq}">
				<div class="form-group row">
					<div class="col-md-12 m-b-15">
						<label class="col-form-label col-md-3" for="bizName">사업장 검색</label>
						<input id="bizName" type="text" class="form-control col-md-8">
						<input class="form-control " type="hidden" name="userBizCode" id="bizCode">
						<a id="searchBiz" class="btn btn-primary" href="javascript:openModal();">사업장 검색</a>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-12 m-b-15">
						<label class="col-form-label col-md-3" for="searchBiz">사용자명</label>
						<input type="text" class="form-control col-md-8" id="userName" name="userName" placeholder="사용자 이름을 입력해주세요!">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-12 m-b-15">
						<label class="col-form-label col-md-3" for="userID">사용자 아이디</label>
						<input type="text" class="form-control col-md-8" id="userID" name="userID" placeholder="사용자 아이디를 입력해주세요!">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-md-6 m-b-15">
						<label class="col-form-label col-md-3" for="userPW">사용자 비밀번호</label>
						<input type="password" class="form-control col-md-8" id="userPW" name="userPW" placeholder="비밀번호를 입력해주십지오!">
					</div>
					<div class="col-md-6 m-b-15">
						<label class="col-form-label col-md-3" for="userPwCheck">비밀번호 확인</label>
						<input type="password" class="form-control col-md-8" id="userPwCheck" placeholder="비밀번호 확인">
					</div>
				</div>
				<button class="btn btn-success" id='userSignUp'>회원등록</button>
			</form>
		</div>
	</div>
</div>

<div class="modal fade" id="WarningModal" tabindex="-1" role="dialog" aria-labelledby="modalLabels" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title font-weight-bold text-primary" id="modalLabels">사업장 검색</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
				</button>
			</div>
			<div class="modal-body text-gray-800">
				<input type="text" id="searchBox" name="searchBox" class="form-control col-md-7">
				<div class="input-group-append">
					<button class="btn btn-base col-md-12" id="searchBtn">
						<i class="fa fa-search fa-fw"></i> 검색
					</button>
				</div>
				<table id="tablessss" class="table table-bordered">
					<thead>
						<tr>
							<td>사업장명</td>
						</tr>
					</thead>
					<tbody id="modalTBody">
						<c:forEach items="${bizList}" var="biz">
							<tr>
								<td><input type="hidden" id="userBizCode" value="${biz.bizCode}">${biz.bizName}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function openModal(){
		$("#WarningModal").modal("show");
		$('#WarningModal').on('hidden.bs.modal', function (e) {
			$("#searchBox").reset();
		})
	}

	$(function() {
		$("#adminSubmit").submit(function() {
			if($("#userID").val() == "" || $("#userID").val() == null){
				swal("입력오류","아이디를 입력해주세요", "warning");
				return false;
			}

			if($("#userPW").val() == "" || $("#userPW").val() == null){
				swal("입력오류","비밀번호를 입력해주세요", "warning");
				return false;
			}

			if($("#userPW").val() != $("#userPwCheck").val()){
				swal("입력오류","비밀번호를 다시 확인하고 입력해주세요", "warning");
				return false;
			}

			if($("#userName").val() == "" || $("#userName").val() == null){
				swal("입력오류","이름을 입력해주세요", "warning");
				return false;
			}
		})
	})

	$("#tablessss tr:gt(0)").click(function (){
		let bizCode = $(this).find('td:eq(0) input').val();
		let bizName = $(this).find('td:eq(0)').text();
		$("#bizCode").val(bizCode);
		$("#bizName").val(bizName);
		$("#WarningModal").modal("hide");
	});
</script>