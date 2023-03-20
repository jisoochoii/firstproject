<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- Begin Page Content -->
<div class="panel panel-inverse">
  <!-- Page Heading -->
  <div class="panel-heading">
    <h4 class="panel-title">그룹관리</h4>
  </div>
  <div class="panel-body">
    <div class="row">
      <div class="col-lg-6">
        <div class="row">
          <div class="col-md-12 text-right">
            <button class="btn btn-primary" id="addGroup">그룹 추가</button>
          </div>
        </div>
        <table id="dataTable" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed"
               role="grid" aria-describedby="dataTable_info">
          <thead>
          <tr>
            <th>No.</th>
            <th>그룹명</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${groupList}" var="group">
            <tr>
              <td>${group.groupSeq}</td>
              <td>${group.groupName}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="card col-lg-6">
        <div class="row">
          <div class="col-lg-10" id="titleGroup"></div>
          <div class="col-lg-2" id="addBtn">
          </div>
        </div>
        <table id="dataTables" class="table table-striped table-bordered dataTable no-footer dtr-inline collapsed"
               role="grid" aria-describedby="dataTable_info">
          <input type="hidden" id="userInfoSeq" value="${loginInfo.userSeq}"/>
          <thead>
          <tr>
            <th>No.</th>
            <th>그룹명</th>
            <th>사용자명</th>
          </tr>
          </thead>
          <tbody id="tbody">

          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script>
  $("#dataTable tr:gt(0)").click(function() {
    // ajax로 보낼 데이터
    let groupSeq = $(this).find('td:eq(0)').text();

    // form 안에 있는 input 데이터를 가지고 온다
    // let formData = $("#form").serialize();

    $.ajax({
      url: "${pageContext.request.contextPath}/groupUserList",
      type: "GET",
      dataType : 'json',
      data : {"groupSeq" : groupSeq},
      // data : formData,
      success : function (response) {
        let html = '';
        for(let i = 0; i < response.groupList.length;i++){
          html += '<tr>';
          html += "<td>"
          html += '<input type="hidden" name="userSeq" value="'+response.groupList[i].userSeq+'"/>';
          html += response.groupList[i].ugSeq+"</td>";
          html += "<td>"+response.groupList[i].groupName+"</td>";
          html += "<td>"+response.groupList[i].userName+"</td>";
          html += '</tr>';
        }
        $("#tbody tr").remove();
        $("#addBtn button").remove();
        $("#addBtn").append('<button id="addUser" class="btn btn-success">사용자 추가</button>');
        $("#tbody").append(html);

        let test = '';
        test += '<h3>';
        test += '<input type="hidden" id="groupSeq" value="'+groupSeq+'"/>';
        // test += response.groupList[0].groupName;
        test += '</h3>';

        $("#titleGroup").append(test);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  });
</script>