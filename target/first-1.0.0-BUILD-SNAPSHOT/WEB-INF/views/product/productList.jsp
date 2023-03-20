<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" id="prodSeq">
<div class="panel panel-inverse">
  <div class="panel-body">
    <%-- 사업장 폼  --%>
    <form id="formId" method="post" action="${pageContext.request.contextPath}/insertProduct">
      <input type="hidden" id="prodEditor" name="prodEditor" value="${loginInfo.userSeq}">
      <input type="hidden" id="prodRegi" name="prodRegi" value="${loginInfo.userSeq}">
      <div class="row">
        <%-- 첫번째 줄 필수정보/분류정보 --%>
        <div class="col-lg-12">
          <div class="row">
            <%-- 필수정보 --%>
            <div class="col-lg-6">
              <legend class="m-b-15">필수정보</legend>
              <div class="form-group row m-b-15">
                <label for="prodBizArea" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 운영구분</label>
                <select id="prodBizArea" name="prodBizArea" class="form-control col-md-8" >
                  <option hidden>운영 구분을 선택해주세요</option>
                  <c:forEach items="${catList}" var="cat">
                    <option value="${cat.commonCodeNumber}">${cat.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodBizCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업장명</label>
                <select id="prodBizCode" name="prodBizCode" class="form-control col-md-8" disabled>
                  <option hidden>운영 구분을 먼저 선택해주세요</option>
                  <c:forEach items="${bizList}" var="biz">
                    <option value="${biz.bizCode}">${biz.bizName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodCustomerCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 매입처</label>
                <select id="prodCustomerCode" name="prodCustomerCode" class="form-control col-md-8" disabled>
                  <option hidden>운영 구분을 먼저 선택해주세요</option>
                  <c:forEach items="${customerList}" var="custom">
                    <option value="${custom.customerCode}">${custom.customerName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodCode"class="col-form-label col-md-3">상품코드</label>
                <input id="prodCode" type="text" class="form-control col-md-8" readonly>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodName"class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 상품명</label>
                <input id="prodName" name="prodName" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodDealStartDate"class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 거래시작일</label>
                <input id="prodDealStartDate" name="prodDealStartDate" type="date" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodDealEndDate"class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 거래종료일</label>
                <input id="prodDealEndDate" name="prodDealEndDate" type="date" class="form-control col-md-8">
              </div>
            </div>
            <%-- 분류정보 --%>
            <div class="col-lg-6">
              <legend class="m-b-15">분류정보</legend>
              <div class="form-group row m-b-15">
                <label for="prodArea" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 상품구분</label>
                <select id="prodArea" name="prodArea" class="form-control col-md-8" >
                  <option hidden>상품구분을 선택해주세요</option>
                  <c:forEach items="${prodAreaList}" var="area">
                    <option value="${area.commonCodeNumber}">${area.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodItem" class="col-form-label col-md-3">품목구분</label>
                <select id="prodItem" name="prodItem" class="form-control col-md-8" >
                  <option hidden>품목구분</option>
                  <c:forEach items="${itemList}" var="item">
                    <option value="${item.commonCodeNumber}">${item.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodClassified" class="col-form-label col-md-3">상품분류</label>
                <select id="prodClassified" name="prodClassified" class="form-control col-md-8" >
                  <option hidden>상품분류</option>
                  <c:forEach items="${classList}" var="cls">
                    <option value="${cls.commonCodeNumber}">${cls.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodWebArea" class="col-form-label col-md-3">웹구분</label>
                <select id="prodWebArea" name="prodWebArea" class="form-control col-md-8" >
                  <option value="0" hidden>웹구분</option>
                  <c:forEach items="${webList}" var="web">
                    <option value="${web.commonCodeNumber}">${web.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodPicking" class="col-form-label col-md-3">피킹구분</label>
                <select id="prodPicking" name="prodPicking" class="form-control col-md-8" >
                  <option hidden>피킹구분</option>
                  <c:forEach items="${pickList}" var="pick">
                    <option value="${pick.commonCodeNumber}">${pick.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </div>
        </div>
        <%-- 두번째 줄 주문정보/추가정보 --%>
        <div class="col-lg-12">
          <div class="row">
            <%-- 주문정보 --%>
            <div class="col-lg-6">
              <legend class="m-b-15">주문정보</legend>
              <div class="form-group row m-b-15">
                <label for="prodBasicUnit" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 기본단위</label>
                <select id="prodBasicUnit" name="prodBasicUnit" class="form-control col-md-8" >
                  <option hidden>기본단위를 선택해주세요</option>
                  <c:forEach items="${unitList}" var="unit">
                    <option value="${unit.commonCodeNumber}">${unit.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodTax" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 과세구분</label>
                <select id="prodTax" name="prodTax" class="form-control col-md-8" >
                  <option hidden>과세구분을 선택해주세요</option>
                  <c:forEach items="${taxList}" var="tax">
                    <option value="${tax.commonCodeNumber}">${tax.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodBoxAmount" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> BOX입수량</label>
                <input id="prodBoxAmount" name="prodBoxAmount" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodMinAmount" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 주문최소량</label>
                <input id="prodMinAmount" name="prodMinAmount" type="text" class="form-control col-md-8">
              </div>
            </div>
            <%-- 추가정보 --%>
            <div class="col-lg-6">
              <legend class="m-b-15">추가정보</legend>
              <div class="form-group row m-b-15">
                <label for="prodDelivery" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> DELIVERY</label>
                <select id="prodDelivery" name="customerGuaranteeType" class="form-control col-md-8" >
                  <option value="0" hidden>배송</option>
                  <c:forEach items="${deliveryList}" var="deli">
                    <option value="${deli.commonCodeNumber}">${deli.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodManageCode" class="col-form-label col-md-3">관리코드</label>
                <input id="prodManageCode" name="prodManageCode" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodSName" class="col-form-label col-md-3">상품약칭</label>
                <input id="prodSName" name="prodSName" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodExpiration" class="col-form-label col-md-3">유통기한</label>
                <input id="prodExpiration" name="prodExpiration" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodLocation" class="col-form-label col-md-3">로케이션</label>
                <input id="prodLocation" name="prodLocation" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodBarcode" class="col-form-label col-md-3">바코드</label>
                <input id="prodBarcode" type="text" class="form-control col-md-8" readonly>
              </div>
            </div>
          </div>
        </div>
        <%-- 세번째 줄 재고정보/매입정보 --%>
        <div class="col-lg-12">
          <div class="row">
            <%-- 재고정보 --%>
            <div class="col-lg-6">
              <legend class="m-b-15">재고정보</legend>
              <div class="form-group row m-b-15">
                <label for="prodStock" class="col-form-label col-md-3">재고보유여부</label>
                <select id="prodStock" name="prodStock" class="form-control col-md-8" >
                  <option value="0" hidden>재고보유여부</option>
                  <c:forEach items="${stockList}" var="stock">
                    <option value="${stock.commonCodeNumber}">${stock.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodStockAmount" class="col-form-label col-md-3">적정재고량</label>
                <input id="prodStockAmount" name="prodStockAmount" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodStockDate" class="col-form-label col-md-3">적정재고일</label>
                <input id="prodStockDate" name="prodStockDate" type="text" class="form-control col-md-8">
              </div>
              <div class="note note-secondary m-b-15">
                <h4 class="m-b-20">상품 SET</h4>
                <div class="row col-lg-12 m-b-15">
                  <input id="prodSetWeb" name="prodSetWeb" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                  <label for="prodSetWeb" class="col-form-label col-md-2 m-b-15">웹주문</label>

                  <input id="prodSetProd" name="prodSetProd" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                  <label for="prodSetProd" class="col-form-label col-md-2 m-b-15">세트상품</label>

                  <input id="prodSetZero" name="prodSetZero" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N">
                  <label for="prodSetZero" class="col-form-label col-md-2 m-b-15">0원단가</label>
                </div>
              </div>
            </div>
            <%-- 매입정보 --%>
            <div class="col-lg-6">
              <legend class="m-b-15">매입정보</legend>
              <div class="form-group row m-b-15">
                <label for="prodManufacturer" class="col-form-label col-md-3">제조사</label>
                <input id="prodManufacturer" name="prodManufacturer" type="text" class="form-control col-md-8">
              </div>
              <div class="form-group row m-b-15">
                <label for="prodOriginal" class="col-form-label col-md-3">원산지</label>
                <select id="prodOriginal" name="prodOriginal" class="form-control col-md-8" >
                  <option value="0" hidden>원산지</option>
                  <c:forEach items="${originList}" var="origin">
                    <option value="${origin.commonCodeNumber}">${origin.commonCodeName}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="form-group row m-b-15">
                <label for="prodStandard" class="col-form-label col-md-3">규격</label>
                <input id="prodStandard" name="prodStandard" type="text" class="form-control col-md-8" >
              </div>
              <div class="form-group row m-b-15">
                <label for="prodBoxWeight" class="col-form-label col-md-3">BOX중량</label>
                <input id="prodBoxWeight" name="prodBoxWeight" type="text" class="form-control col-md-8" >
              </div>
              <div class="form-group row m-b-15">
                <input id="prodEINum" name="prodEINum" type="checkbox" class="form-control col-md-1" onchange="VerifyCheck(this)" value="N" disabled>
                <label for="prodEINum" class="col-form-label col-md-3">개체식별번호 관리</label>
              </div>
            </div>
          </div>
        </div>
        <%-- 아코디언 추가정보/거래처담당/기타정보 --%>
        <div class="col-lg-12">
          <div class="card-accordion" id="accordion">
<%--            <div class="card">--%>
<%--              <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseOne">추가정보</div>--%>
<%--              <div id="collapseOne" class="collapse" data-parent="#accordion">--%>
<%--                <div class="card-body">--%>
<%--
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>

<%--            <div class="card">--%>
<%--              <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseTwo">거래처 담당</div>--%>
<%--              <div id="collapseTwo" class="collapse" data-parent="#accordion">--%>
<%--                <div class="card-body">--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>

            <%-- 기타정보 정보 (비고) --%>
            <div class="card">
              <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseThree">기타정보</div>
              <div id="collapseThree" class="collapse" data-parent="#accordion">
                <div class="card-body">
                  <div class="form-group row m-b-15">
                    <span class="col-md-5">비고</span>
                    <label for="prodUsage" class="col-form-label col-md-3">사용구분</label>
                    <select id="prodUsage" name="prodUsage" class="form-control col-md-3">
                      <c:forEach items="${useList}" var="use">
                        <option value="${use.commonCodeNumber}">${use.commonCodeName}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <textarea class="col-lg-12" id="prodNote" name="prodNote" cols="50" rows="10"></textarea>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
      <%-- 버튼 (저장/수정/삭제) --%>
      <div class="row">
        <div class="col-md-12 text-left">
          <button class="btn btn-primary" id="saveBtn">저장</button>
          <button class="btn btn-success" id="updateBtn">수정</button>
          <button class="btn btn-danger" id="deleteBtn">삭제</button>
        </div>
      </div>
    </form><%-- 사업장 폼 끝 --%>

  </div>
</div>

<%-- 오른쪽에 있는 사이드바 --%>
<div class="theme-panel theme-panel-lg">
  <a href="javascript:;" data-click="theme-panel-expand" class="theme-collapse-btn">
    <i class="fa fa-angle-double-left"></i>
  </a>
  <div class="theme-panel-content">
    <div class="result-container">
      <div class="form-group row col-md-12 m-b-15">
        <%-- 운영구분 --%>
        <div class="row col-md-6">
          <label for="categorySelect" class="col-form-label col-md-4">운영구분</label>
          <div class="col-md-8">
            <select id="categorySelect" class="form-control col-md-8">
              <option value="0">전체</option>
              <c:forEach items="${catList}" var="cat">
                <option value="${cat.commonCodeNumber}">${cat.commonCodeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
        <%-- 사용구분 --%>
        <div class="row col-md-6">
          <label for="usageSelect" class="col-form-label col-md-4">사용구분</label>
          <div class="col-md-8">
            <select id="usageSelect" class="form-control col-md-8">
              <option value="0">전체</option>
              <c:forEach items="${useList}" var="use">
                <option value="${use.commonCodeNumber}">${use.commonCodeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <div class="form-group row col-md-12 m-b-15">
        <%-- 상품구분 --%>
        <div class="row col-md-6">
          <label for="productAreaSelect" class="col-form-label col-md-4">상품구분</label>
          <div class="col-md-8">
            <select id="productAreaSelect" class="form-control col-md-8">
              <option value="0">전체</option>
              <c:forEach items="${prodAreaList}" var="area">
                <option value="${area.commonCodeNumber}">${area.commonCodeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
        <%-- 품목구분 --%>
        <div class="row col-md-6">
          <label for="prodItemSelect" class="col-form-label col-md-4">품목구분</label>
          <div class="col-md-8">
            <select id="prodItemSelect" class="form-control col-md-8">
              <option value="0">전체</option>
              <c:forEach items="${itemList}" var="item">
                <option value="${item.commonCodeNumber}">${item.commonCodeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <div class="form-group row col-md-12 m-b-15">
        <label for="searchBizName" class="col-form-label col-md-2">사업장명</label>
        <input id="searchBizName" type="text" class="form-control col-md-8">
      </div>
      <div class="form-group row col-md-12 m-b-15">
        <label for="searchProdName" class="col-form-label col-md-2">상품명</label>
        <input id="searchProdName" type="text" class="form-control col-md-8">
        <div class="input-group-append">
          <button id="searchProductBtn" type="button" class="btn btn-base">
            <i class="fa fa-search fa-fw"></i> 검색
          </button>
        </div>
      </div>
      <table id="sideTable" class="table table-bordered">
        <thead>
        <tr>
          <th>사업장명</th>
          <th>상품명</th>
        </tr>
        </thead>
        <tbody id="sideTableTBody">
          <c:forEach items="${productList}" var="prod">
            <tr>
              <td><input type="hidden" value="${prod.prodSeq}">${prod.bizName}</td>
              <td>${prod.prodName}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div><%-- 오른쪽에 있는 사이드바 끝 --%>

<%-- 배송기사 삭제시 보이는 모달 창 --%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  $(document).ready(function() {
    $("#updateBtn").hide();
    $("#deleteBtn").hide();
  });

  function VerifyCheck(checkbox){
    let checked = checkbox.checked;

    if(checked){
      checkbox.value = 'Y';
    }else{
      checkbox.value = 'N';
    }
  }

  $("#updateBtn").click (function (e){
    let prodSeq = $("#prodSeq").val();
    let prodCode = $("#prodCode").val();
    $("#formId").attr("action", "${pageContext.request.contextPath}/updateProduct");
    $("#formId").attr("method", "POST")
    $("#formId").append('<input type="hidden" name="prodSeq" value="'+prodSeq+'">');
    $("#formId").append('<input type="hidden" name="prodCode" value="'+prodCode+'">');
    $("#formId").submit();
  })

  $("#deleteBtn").click (function (e){
    let prodSeq = $("#prodSeq").val();

    $("#formId").attr("action", "${pageContext.request.contextPath}/deleteProduct");
    $("#formId").attr("method", "POST")
    $("#formId").append('<input type="hidden" name="prodSeq" value="'+prodSeq+'">');
    $("#formId").submit();
  })

  $("#prodBizArea").change(function (){
    let bizCategory = $("#prodBizArea option:selected").val()

    $.ajax({
      url: "${pageContext.request.contextPath}/optionBizArea",
      type: "POST",
      dataType : 'json',
      data : {"bizCategory" : bizCategory},
      success : function (response) {
        let html = '<option value="0" hidden>사업장명을 선택해주세요</option>';
        for(let i = 0; i < response.bizList.length; i++){
          html += '<option value="'+response.bizList[i].bizCode+'">'+response.bizList[i].bizName+'</option>';
        }

        $("#prodBizCode").prop("disabled", false);
        $("#prodBizCode option").remove();
        $("#prodBizCode").append(html);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  })

  $("#prodBizCode").change(function (){
    let bizCode = $("#prodBizCode option:selected").val()

    $.ajax({
      url: "${pageContext.request.contextPath}/optionBizCode",
      type: "POST",
      dataType : 'json',
      data : {"customerBizCode" : bizCode},
      success : function (response) {
        let html = '<option value="0" hidden>매입처를 선택해주세요</option>';
        for(let i = 0; i <  response.customerList.length; i++){
          html += '<option value="'+response.customerList[i].customerCode+'">'+response.customerList[i].customerName+'</option>';
        }

        $("#prodCustomerCode").prop("disabled", false);
        $("#prodCustomerCode option").remove();
        $("#prodCustomerCode").append(html);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  })

  $("#prodCustomerCode").change(function (){
    let customerCode = $("#prodCustomerCode option:selected").val()

    $.ajax({
      url: "${pageContext.request.contextPath}/getDealDates",
      type: "POST",
      dataType : 'json',
      data : {"customerCode" : customerCode},
      success : function (response) {
        $("#prodDealStartDate").val('');
        $("#prodDealEndDate").val('');
        $("#prodDealStartDate").val(response.customer.customerDealStartDate);
        $("#prodDealEndDate").val(response.customer.customerDealEndDate);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  })


  $(document).on("click","#sideTable tr:gt(0)",function (){
    let seq = $(this).find('td:eq(0) input').val();

    $.ajax({
      url: "${pageContext.request.contextPath}/productView",
      type: "POST",
      dataType : 'json',
      data : {"prodSeq" : seq},
      success : function (response) {
        $("#prodSeq").val(response.productList.prodSeq);
        $("#prodCode").val(response.productList.prodCode);
        $("#prodName").val(response.productList.prodName);
        $("#prodDealStartDate").val(response.productList.prodDealStartDate);
        $("#prodDealEndDate").val(response.productList.prodDealEndDate);
        $("#prodBoxAmount").val(response.productList.prodBoxAmount);
        $("#prodMinAmount").val(response.productList.prodMinAmount);
        $("#prodManageCode").val(response.productList.prodManageCode);
        $("#prodSName").val(response.productList.prodSName);
        $("#prodExpiration").val(response.productList.prodExpiration);
        $("#prodLocation").val(response.productList.prodLocation);
        $("#prodBarcode").val(response.productList.prodBarcode);
        $("#prodStockAmount").val(response.productList.prodStockAmount);
        $("#prodStockDate").val(response.productList.prodStockDate);
        $("#prodManufacturer").val(response.productList.prodManufacturer);
        $("#prodStandard").val(response.productList.prodStandard);
        $("#prodBoxWeight").val(response.productList.prodBoxWeight);
        $("#prodNote").val(response.productList.prodNote);

        // checkbox ajax
        if(response.productList.prodSetWeb == "Y"){$("#prodSetWeb").prop("checked", true);$("#prodSetWeb").val('Y');}
        if(response.productList.prodSetProd == "Y"){$("#prodSetProd").prop("checked", true);$("#prodSetProd").val('Y');}
        if(response.productList.prodSetProd == "Y"){$("#prodSetProd").prop("checked", true);$("#prodSetProd").val('Y');}
        if(response.productList.prodEINum == "Y"){$("#prodEINum").prop("checked", true);$("#prodEINum").val('Y');$("#prodEINum").prop("disabled",false)}

        // select check
        $("#prodBizArea option").each(function (){
          if(this.value == response.productList.prodBizArea){
            $("#prodBizArea option[value="+response.productList.prodBizArea+"]").attr('selected',true);
          }
        })

        $("#prodBizCode option").each(function (){
          if(this.value == response.productList.prodBizCode){
            $("#prodBizCode option[value="+response.productList.prodBizCode+"]").attr('selected',true);
          }
        })

        $("#prodCustomerCode option").each(function (){
          if(this.value == response.productList.prodCustomerCode){
            $("#prodCustomerCode option[value="+response.productList.prodCustomerCode+"]").attr('selected',true);
          }
        })

        $("#prodArea option").each(function (){
          if(this.value == response.productList.prodArea){
            $("#prodArea option[value="+response.productList.prodArea+"]").attr('selected',true);
          }
        })

        $("#prodItem option").each(function (){
          if(this.value == response.productList.prodItem){
            $("#prodItem option[value="+response.productList.prodItem+"]").attr('selected',true);
          }
        })

        $("#prodClassified option").each(function (){
          if(this.value == response.productList.prodClassified){
            $("#prodClassified option[value="+response.productList.prodClassified+"]").attr('selected',true);
          }
        })

        $("#prodWebArea option").each(function (){
          if(this.value == response.productList.prodWebArea){
            $("#prodWebArea option[value="+response.productList.prodWebArea+"]").attr('selected',true);
          }
        })

        $("#prodPicking option").each(function (){
          if(this.value == response.productList.prodPicking){
            $("#prodPicking option[value="+response.productList.prodPicking+"]").attr('selected',true);
          }
        })

        $("#prodBasicUnit option").each(function (){
          if(this.value == response.productList.prodBasicUnit){
            $("#prodBasicUnit option[value="+response.productList.prodBasicUnit+"]").attr('selected',true);
          }
        })

        $("#prodTax option").each(function (){
          if(this.value == response.productList.prodTax){
            $("#prodTax option[value="+response.productList.prodTax+"]").attr('selected',true);
          }
        })

        $("#prodDelivery option").each(function (){
          if(this.value == response.productList.prodDelivery){
            $("#prodDelivery option[value="+response.productList.prodDelivery+"]").attr('selected',true);
          }
        })

        $("#prodStock option").each(function (){
          if(this.value == response.productList.prodStock){
            $("#prodStock option[value="+response.productList.prodStock+"]").attr('selected',true);
          }
        })

        $("#prodOriginal option").each(function (){
          if(this.value == response.productList.prodOriginal){
            $("#prodOriginal option[value="+response.productList.prodOriginal+"]").attr('selected',true);
          }
        })

        $("#prodUsage option").each(function (){
          if(this.value == response.productList.prodUsage){
            $("#prodUsage option[value="+response.productList.prodUsage+"]").attr('selected',true);
          }
        })
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  })

  $("#searchProductBtn").click(function (){
    let categorySelect =    $("#categorySelect option:selected").val();
    let usageSelect =       $("#usageSelect option:selected").val();
    let productAreaSelect = $("#productAreaSelect option:selected").val();
    let prodItemSelect =    $("#prodItemSelect option:selected").val();
    let searchBizName =     $("#searchBizName").val();
    let searchProdName =    $("#searchProdName").val();

    $.ajax({
      url: "${pageContext.request.contextPath}/searchProduct",
      type: "POST",
      dataType : 'json',
      data : {"categorySelect" : categorySelect, "usageSelect" : usageSelect, "productAreaSelect" : productAreaSelect,
        "prodItemSelect" : prodItemSelect, "bizName" : searchBizName, "prodName" : searchProdName},
      success : function (response) {
          let html = "";
          for(let i = 0; i < response.productList.length; i++){
            html += '<tr>';
            html += "<td>"
            html += '<input type="hidden" value="'+response.productList[i].prodSeq+'"/>';
            html += response.productList[i].bizName+"</td>";
            html += "<td>"+response.productList[i].prodName+"</td>";
            html += '</tr>';
          }

          $("#searchBizName").val('');
          $("#searchProdName").val('');

          $("#sideTableTBody tr").remove();
          $("#sideTableTBody").append(html);
      },
      error : function (error){
        alert("error : " + error.data);
      }
    })
  });
</script>