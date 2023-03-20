<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" id="userInfoSeq" value="${loginInfo.userSeq}"/>
<!-- Begin Page Content -->
<div class="panel panel-inverse">
  <!-- Page Heading -->
  <div class="panel-heading">
    <h4 class="panel-title">공통코드 관리</h4>
  </div>
  <div class="panel-body">
    <div class="row">
      <div class="col-lg-6">
        <div class="row">
          <div class="col-md-12 text-right">
            <button class="btn btn-primary" id="addCode">공통코드 추가</button>
          </div>
        </div>
        <table id="dataTable4" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed"
               role="grid" aria-describedby="dataTable_info">
          <thead>
          <tr>
            <th>No.</th>
            <th>공통코드명</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${mainCodeList}" var="main">
            <tr>
              <td>${main.mcCommonCodeSeq}</td>
              <td>${main.mcCommonCodeName}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="col-lg-6">
        <div class="row">
          <div class="col-md-12 text-right">
            <div id="titleGroup" class="text-right"></div>
          </div>
        </div>
        <table id="dataTables" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed"
               role="grid" aria-describedby="dataTable_info">
          <thead>
            <tr>
              <th>중분류명</th>
              <th>중분류 Value</th>
            </tr>
          </thead>
          <tbody id="tbody">
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<%--  대분류 생성  --%>
<div class="modal fade" id="AddCodeModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title font-weight-bold text-primary" id="modalLabel">공통코드 등록</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
        </button>
      </div>
      <form method="post" action="${pageContext.request.contextPath}/mainCodeInsert">
        <input type="hidden" name="mcCommonCodeRegi" value="${loginInfo.userSeq}">
        <input type="hidden" name="mcCommonCodeEditor" value="${loginInfo.userSeq}">
        <div class="modal-body text-gray-800">
          <div class="row">
            <div class="col-lg-4">
              <h3>공통코드명</h3>
            </div>
            <div class="col-lg-8">
              <input type="text" id="mcCommonCodeName" name="mcCommonCodeName" class="form-control">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">공통코드 추가</button>
          <a class="btn btn-info" data-dismiss="modal">취소</a>
        </div>
      </form>
    </div>
  </div>
</div>

<%-- 중분류 생성 --%>
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <%-- 모달창의 머리 (제목을 가지고 있다) --%>
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">공통코드 추가</h5>
        <%-- bootstrap4에서는 data-dismiss 사용, bootstrap5에서는 data-bs-dismiss 사용 --%>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <%-- 모달창의 몸통 (내용을 가지고 있다) --%>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <div class="form-group row m-b-15">
              <label for="commonCodeName" class="col-form-label col-md-3">중분류명</label>
              <input id="commonCodeName" name="commonCodeName" type="text" class="form-control col-md-8">
            </div>
            <div class="form-group row m-b-15">
              <label for="commonCodeValue" class="col-form-label col-md-3">중분류 Value</label>
              <input id="commonCodeValue" name="commonCodeValue" type="text" class="form-control col-md-8">
            </div>
          </div>
        </div>
      </div>
      <%-- 모달창의 다리 (버튼을 가지고 있다) --%>
      <div class="modal-footer">
        <button class="btn btn-success" id="addCommon" data-dismiss="modal">추가</button>
        <button class="btn btn-info" type="button" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>

<%--  중분류 삭제  --%>
<div class="modal fade" id="groupOutModal" tabindex="-1" role="dialog" aria-labelledby="modalLabels" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title font-weight-bold text-primary" id="modalLabels">중분류 공통코드 삭제</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body text-gray-800">
        <input type="hidden" id="commonCodeSeq" name="commonCodeSeq">
        <input type="hidden" id="commonCodeType" name="commonCodeType">
        <h2>중분류 공통코드를 <br/>삭제하시겠습니까?</h2>
      </div>
      <div class="modal-footer">
        <button class="btn btn-danger" id="delCommonBtn" data-dismiss="modal">코드 삭제</button>
        <a class="btn btn-info" type="button" data-dismiss="modal">취소</a>
      </div>
    </div>
  </div>
</div>

<%-- 대분류 삭제 --%>
<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title font-weight-bold text-primary" id="modalLabel1">중분류 공통코드 삭제</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
        </button>
      </div>
      <form id="forms" method="post" action="${pageContext.request.contextPath}/mainCodeDel">
        <div class="modal-body text-gray-800">
          <input type="hidden" id="mcCommonCodeSeq" name="mcCommonCodeSeq">
          <input type="hidden" name="mcCommonCodeEditor" value="${loginInfo.userSeq}">
          <h2>공통코드를 <br/>삭제하시겠습니까?</h2>
        </div>
        <div class="modal-footer">
          <button id="del" class="btn btn-danger" data-dismiss="modal">공통코드 삭제</button>
          <a class="btn btn-info" type="button" data-dismiss="modal">취소</a>
        </div>
      </form>

    </div>
  </div>
</div>
<script>
  // dataTable의 나오는 내용을 한글화한 변수
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

  // dataTable을 한글화 한다
  $(document).ready(function() {
    $('#dataTable4').DataTable( {
      language : lang_kor
    });
  });

  $("#dataTable4 tr:gt(0)").click(function() {
    // 모달창을 나오게 하는 메서드
    let commonCodeType = $(this).find('td:eq(0)').text();
    $.ajax({
      url: "${pageContext.request.contextPath}/ajaxCommonCode",
      type: "POST",
      dataType : 'json',
      data : {"commonCodeType" : commonCodeType},
      success : function (response) {
        let html = '';
        for(let i = 0; i < response.commonList.length;i++){
          html += '<tr>';
          html += "<td>"
          html += '<input type="hidden" name="commonCodeSeq" value="'+response.commonList[i].commonCodeSeq+'"/>';
          html += response.commonList[i].commonCodeName+"</td>";
          html += "<td>"+response.commonList[i].commonCodeValue+"</td>";
          html += '</tr>';
        }
        $("#tbody tr").remove();
        $("#titleGroup button").remove();
        $("#titleGroup").append('<button id="addCommonCode" class="btn btn-success">중분류 공통코드 추가</button>');
        $("#tbody").append(html);

        let test = '';
        test += '<input type="hidden" id="commonCodeType" value="'+commonCodeType+'"/>';

        $("#titleGroup input").remove();
        $("#titleGroup").append(test);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  });

  // 위에서 검색한 내용을 토대로 그룹과 연결하여 insert를 하고 dataTables에 테이블과 버튼을 만들어준다
  $("#addCommon").click(function (){
    let commonCodeType = $("#titleGroup input").val();
    let commonCodeName = $("#commonCodeName").val();
    let commonCodeValue = $("#commonCodeValue").val();
    let commonCodeRegi =$("#userInfoSeq").val();
    let commonCodeEditor =$("#userInfoSeq").val();
    $.ajax({
      url: "${pageContext.request.contextPath}/insertCommonCode",
      type: "POST",
      dataType : 'json',
      data : {"commonCodeName" : commonCodeName, "commonCodeValue" : commonCodeValue,
        "commonCodeRegi" : commonCodeRegi, "commonCodeEditor" : commonCodeEditor, "commonCodeType" : commonCodeType},
      success : function (response) {
        let html = '';
        for(let i = 0; i < response.commonList.length;i++){
          html += '<tr>';
          html += "<td>"
          html += '<input type="hidden" name="commonCodeSeq" value="'+response.commonList[i].commonCodeSeq+'"/>';
          html += response.commonList[i].commonCodeName+"</td>";
          html += "<td>"+response.commonList[i].commonCodeValue+"</td>";
          html += '</tr>';
        }
        $("#tbody tr").remove();
        $("#titleGroup button").remove();
        $("#titleGroup").append('<button id="addCommonCode" class="btn btn-success">중분류 공통코드 추가</button>');
        $("#tbody").append(html);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  })

  $(document).on("click", "#dataTables tr:gt(0)", function() {
    let ugSeq = $(this).find("td:eq(0) input").val();
    // 모달창을 나오게 하는 메서드
    $("#groupOutModal").modal("show", $("#commonCodeSeq").val(ugSeq));
  });

  // 그룹에서 사용자를 삭제하는 메서드
  $("#delCommonBtn").click(function (){
    let commonCodeSeq = $("#commonCodeSeq").val();
    let commonCodeType = $("#commonCodeType").val();
    let commonCodeEditor =$("#userInfoSeq").val();
    $.ajax({
      url: "${pageContext.request.contextPath}/deleteCommonCode",
      type: "POST",
      dataType : 'json',
      data : {"commonCodeSeq" : commonCodeSeq, "commonCodeType" : commonCodeType, "commonCodeEditor" : commonCodeEditor},
      success : function (response) {
        let html = '';
        for(let i = 0; i < response.commonList.length;i++){
          html += '<tr>';
          html += "<td>"
          html += '<input type="hidden" name="commonCodeSeq" value="'+response.commonList[i].commonCodeSeq+'"/>';
          html += response.commonList[i].commonCodeName+"</td>";
          html += "<td>"+response.commonList[i].commonCodeValue+"</td>";
          html += '</tr>';
        }
        $("#tbody tr").remove();
        $("#titleGroup button").remove();
        $("#titleGroup").append('<button id="addCommonCode" class="btn btn-success">중분류 공통코드 추가</button>');
        $("#tbody").append(html);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  });

  // 동적으로 생성된 버튼에 클릭기능을 사용할 수 있게하는 메서드
  $(document).on("click", "#addCommonCode", function() {
    // 모달창을 나오게 하는 메서드
    $("#searchModal").modal("show",);
  });

  $("#addCode").click(function (){
    $("#AddCodeModal").modal("show");
  })

  $("#dataTable4 tr:gt(0)").dblclick(function (){
    let mcCommonCodeSeq = $(this).find('td:eq(0)').text();
    $("#delModal").modal("show", $("#mcCommonCodeSeq").val(mcCommonCodeSeq));
  })

  $("#del").click(function (){
    $("#forms").submit();
  })

</script>