<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
  <div class="sidebar">
    <button class="btn btn-success" id="addMenuModal">메뉴 추가</button>
    <ul class="sidebar-card accordion">
      <!-- Sidebar - Brand -->
      <c:forEach items="${menuList}" var="menu">
      <li class="nav-item">
        <a class="nav-link" href="javascript:showCard('${menu.menuSeq}','${menu.menuUpperSeq}','${menu.menuName}','${menu.menuPath}', '${menu.menuOrderID}','${menu.menuLevelID}');">
          <span>${menu.menuName}</span>
        </a>
      </li>
      </c:forEach>
    </ul>
  </div>
  <div class="card col-lg-8" id="cardTable">
    <form method="post" action="${pageContext.request.contextPath}/updateMenu" >
    <div class="card-body" id="cardBody">
      <input type="hidden" id="menuSeq" name="menuSeq">
      <input type="hidden" id="menuLevelID" name="menuLevelID">
      <input type="hidden" id="menuRegi" name="menuRegi" value="${loginInfo.userID}">
      <input type="hidden" id="menuEditor" name="menuEditor" value="${loginInfo.userID}">
      <div class="form-group row">
        <div class="col">
          <label for="menuName">메뉴명</label>
          <input type="text" id="menuName" name="menuName" class="col-lg-12">
        </div>
        <div class="col">
          <label for="menuUpperSeq">최상위</label>
          <input type="checkbox" id="menuUpperSeq" name="menuUpperSeq" class="col-lg-12">
        </div>
      </div>
      <div class="form-group">
        <label for="menuPath">메뉴 URL</label>
        <input type="text" id="menuPath" name="menuPath" class="col-lg-12">
      </div>
      <div class="form-group">
        <label for="menuOrder">메뉴 순서</label>
        <input type="text" id="menuOrder" name="menuOrderID" class="col-lg-12">
      </div>
      <div class="form-group" id="upperLevel">
        <label for="upper">상위 메뉴</label>
        <select id="upper" name="menuUpperSeq" class="col-lg-12">
          <c:forEach items="${menuUpperList}" var="menu">
            <option value="${menu.menuSeq}">${menu.menuName}</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <div class="card-footer">
      <button class="btn btn-success" id="saveBtn" type="submit">저장</button>
      <button class="btn btn-warning" type="reset">취소</button>
    </div>
    </form>
  </div>

  <div class="modal fade" id="addMenu" tabindex="-1" role="dialog" aria-labelledby="modalLabels" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title font-weight-bold text-primary" id="modalLabels">메뉴 추가</h5>
          <button class="close" type="button" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body text-gray-800">
          <form id="addForm">
            <input type="hidden" name="menuRegi" value="${loginInfo.userID}">
            <input type="hidden" name="menuEditor" value="${loginInfo.userID}">
            <div class="form-group row">
              <div class="col">
                <label for="mName">메뉴명</label>
                <input type="text" id="mName" name="menuName" class="col-lg-12">
              </div>
              <div class="col">
                <label for="upperSeq">최상위</label>
                <input type="hidden" id="hiddenUpperSeq" name="menuUpperSeq">
                <input type="checkbox" id="upperSeq" class="col-lg-12">
              </div>
            </div>
            <div class="form-group">
              <label for="mPath">메뉴 URL</label>
              <input type="text" id="mPath" name="menuPath" class="col-lg-12">
            </div>
            <div class="form-group">
              <label for="menuOrderID">메뉴 순서</label>
              <input type="text" id="menuOrderID" name="menuOrderID" class="col-lg-12">
            </div>
            <div class="form-group">
              <label for="upperLevelMenu">상위 메뉴</label>
              <select id="upperLevelMenu" name="menuUpperSeq" class="col-lg-12">
                <c:forEach items="${menuUpperList}" var="menu">
                  <option value="${menu.menuSeq}">${menu.menuName}</option>
                </c:forEach>
              </select>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-success" id="addBtn">추가</button>
          <button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
        </div>

      </div>
    </div>
  </div>

  <script>
    $("#cardTable").hide();

    function showCard(seq, upper, name, path, order, level) {
      $("#menuName").val(name);
      $("#menuSeq").val(seq);
      $("#menuPath").val(path);
      $("#menuLevelID").val(level);
      $("#menuOrder").val(order);

      if(upper == 0){
        $("#menuUpperSeq").prop("checked",true);
        $("#upperLevel").hide();
        $("#upper").prop("disabled", true);
      }else{
        $("#menuUpperSeq").prop("checked",false);
        $("#upperLevel").show();
      }

      $("#cardTable").show();
    }

    $("#addMenuModal").click(function (){
      $("#addMenu").modal("show");
    })

    $("#upperSeq").click(function (){
      if($("#upperSeq").is(":checked") == true){
        $("#upperLevelMenu").prop("disabled", true);
      }else{
        $("#upperLevelMenu").prop("disabled", false);
      }
    })

    $("#addBtn").click(function (event){
      let forms = document.getElementById("addForm");
      forms.action = "${pageContext.request.contextPath}/insertMenu";
      forms.method = "post";
      if($("#upperSeq").is(":checked") == true){
        $("#hiddenUpperSeq").val(0);
      }else{
        $("#hiddenUpperSeq").val($("#upperLevelMenu").val());
      }
      // event.preventDefault();
      forms.submit();
    })
    <%--$("#saveBtn").click(function (){--%>
    <%--  let menuSeq = $("#menuSeq").val();--%>
    <%--  let menuUpperSeq = $("#menuUpperSeq").val();--%>
    <%--  let menuPath = $("#menuPath").val();--%>
    <%--  let menuLevelID = $("#menuLevelID").val();--%>
    <%--  let menuOrderID = $("#menuOrderID").val();--%>
    <%--  let menuRegi = $("#menuRegi").val();--%>
    <%--  let menuEditor = $("#menuEditor").val();--%>

    <%--  $.ajax({--%>
    <%--    url : "${pageContext.request.contextPath}/insertMenu",--%>
    <%--    type: "GET",--%>
    <%--    dataType : 'json',--%>
    <%--    data : {"menuSeq" : menuSeq, "menuUpperSeq" : menuUpperSeq, "menuPath" : menuPath,--%>
    <%--      "menuLevelID" : menuLevelID, "menuRegi" : menuRegi, "menuEditor" : menuEditor, "menuOrderID" : menuOrderID},--%>
    <%--    success : function (response) {--%>
    <%--        --%>
    <%--    },--%>
    <%--    error : function (error){--%>
    <%--      alert(error.data);--%>
    <%--    }--%>
    <%--  })--%>
    <%--})--%>
  </script>
</div>
