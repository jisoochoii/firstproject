<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Begin Page Content -->
<div class="panel panel-inverse">
	<div class="panel-heading">
		<div class="panel-heading-btn">
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
			<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
		</div>
		<h4 class="panel-title">메인화면</h4>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12 text-right">
				<a class="btn btn-primary float-right" id="write" href="${pageContext.request.contextPath}/writeFB">글쓰기</a>
			</div>
		</div>
		<div id="data-table-default_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<div class="row">
				<div class="col-sm-12">
					<table id="data-table-default" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed"
						   role="grid" aria-describedby="data-table-default_info">
						<thead>
						<tr>
							<th>No.</th>
							<th>제목</th>
							<th>내용</th>
							<th>작성자</th>
							<th>수정자</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="fb"  items="${fbList}">
							<tr>
								<td>
									<input type="hidden" name="fbSeq" id="fbSeq"  value="${fb.fbSeq}">
										${fb.fbSeq}
								</td>
								<td>${fb.fbTitle}</td>
								<td>${fb.fbContent}</td>
								<td>${fb.fbRegister}</td>
								<td>${fb.fbEdit}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function executeExample(Swal){
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: 'Something went wrong!',
			footer: '<a href="">Why do I have this issue?</a>'
		})
	}


	let lang_kor = {
		"decimal" : "",
		"emptyTable" : "데이터가 없습니다.",
		"info" : "_START_ - _END_ (총 _TOTAL_ 명)",
		"infoEmpty" : "0명",
		"infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
		"infoPostFix" : "",
		"thousands" : ",",
		"lengthMenu" : "_MENU_ 개씩 보기",
		"loadingRecords" : "로딩중...",
		"processing" : "처리중...",
		"search" : "검색 : ",
		"zeroRecords" : "검색된 데이터가 없습니다.",
		"paginate" : {
			"first" : "첫 페이지",
			"last" : "마지막 페이지",
			"next" : "다음",
			"previous" : "이전"
		},
		"aria" : {
			"sortAscending" : " :  오름차순 정렬",
			"sortDescending" : " :  내림차순 정렬"
		}
	};

	$('#data-table-default').DataTable( {
		lang : lang_kor
		// destory: true
		// responsive: {
		//     details: {
		//         type: 'column',
		//         target: 'tr'
		//     }
		// },
		// columnDefs: [ {
		//     className: 'control',
		//     orderable: false,
		//     targets:   0
		// } ],
		// order: [ 1, 'asc' ]
	} );

	$(function (){
		$('#data-table-default tr:gt(0)').click(function() {
			let fbSeq = $(this).find('td:eq(0) input').val();
			location.href = "/fbViewList?fbSeq="+fbSeq;
		});
	});
</script>