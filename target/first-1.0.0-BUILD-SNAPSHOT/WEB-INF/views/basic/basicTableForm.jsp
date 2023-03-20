<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Begin Page Content -->
<div class="panel panel-inverse">
  <div class="panel-heading">
    <h4 class="title"></h4>
  </div>
  <div class="panel-body ">
    <div class="row">
      <div class="col-md-12 text-right">
        <a class="btn btn-primary float-right" id="write" href="${pageContext.request.contextPath}/writeBiz">사업장 추가</a>
      </div>
    </div>
    <%--  thead안에 tr에 th의 수와 tbody안에 tr에 td의 수는 같아야 한다  --%>
    <div id="data-table-default_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
      <table id="dataTable1" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed">
        <thead>
          <tr>
            <th>No.</th>
            <th>운영구분</th>
            <th>사업장명</th>
            <th>대표자</th>
            <th>업태</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="biz"  items="${bizList}">
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<script>
  // dataTable 한글화를 위해 필요한 내용
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
  // dataTable로 사용되는 table아이디는 모두 달라야한다
  $(document).ready(function() {
    $('#dataTable3').DataTable( {
      language : lang_kor
    });
  });

  $(function (){
    // id가 dataTable3인 테이블의 tr에 2번째줄부터 클릭이 된다
    $('#dataTable3 tr:gt(0)').click(function() {
      let bizSeq = $(this).find('td:eq(0)').text();
      // 뷰화면으로 갈수 있게 만들어준다
      location.href = "${pageContext.request.contextPath}/view?bizSeq="+bizSeq;
    });
  });
</script>
