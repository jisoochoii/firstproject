<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" name="bizSeq" id="bizSeq" value="${bizList.bizSeq}">
<div class="panel panel-inverse">
    <div class="panel-body">
        <form id="formId" method="post" action="${pageContext.request.contextPath}/insertBiz">
            <input type="hidden" id="bizEditor" name="bizEditor" value="${loginInfo.userSeq}">
            <input type="hidden" id="bizRegi" name="bizRegi" value="${loginInfo.userSeq}">
            <div class="row">
                <%-- 첫번째 줄 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">필수정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="bizCategory" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 운영구분</label>
                                <select id="bizCategory" name="bizCategory" class="form-control col-md-8">
                                    <c:forEach items="${catList}" var="cat">
                                        <option value="${cat.commonCodeNumber}">${cat.commonCodeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizCode"class="col-form-label col-md-3">사업장코드</label>
                                <input id="bizCode" type="text" class="form-control col-md-8" readonly>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizName" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업장명</label>
                                <input id="bizName" name="bizName" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">기초정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="bizNumber" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업자번호</label>
                                <input id="bizNumber" name="bizNumber" type="tel" class="form-control col-md-8"
                                       maxlength="12" oninput="bussiness_num(this.value,'bizNumber')" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizRegiNumber" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 등록번호</label>
                                <input id="bizRegiNumber" name="bizRegiNumber" type="text" class="form-control col-md-8 regiNum"
                                       maxlength="14" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizCEO" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 대표자</label>
                                <input id="bizCEO" name="bizCEO" type="text" class="form-control col-md-8" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizStatus" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 업태</label>
                                <input id="bizStatus" name="bizStatus" type="text" class="form-control col-md-8" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizItem" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 종목</label>
                                <input id="bizItem" name="bizItem" type="text" class="form-control col-md-8" >
                            </div>
                        </div>
                    </div>
                </div>
                <%-- 두번째 줄 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">주소정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="bizPostCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 우편번호</label>
                                <input id="bizPostCode" name="bizPostCode" type="text" class="form-control col-md-5">
                                <a id="searchPost" type="text" class="btn btn-success col-md-3" href="javascript:DaumPostcode()">주소찾기</a>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizAddress" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 주소</label>
                                <input id="bizAddress" name="bizAddress" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizAddressDetail" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 상세주소</label>
                                <input id="bizAddressDetail" name="bizAddressDetail" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">계좌정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="bizBankName" class="col-form-label col-md-3">은행</label>
                                <select id="bizBankName" name="bizBankName" type="text" class="form-control col-md-8">
                                    <c:forEach items="${bankList}" var="bank">
                                        <option value="${bank.commonCodeNumber}">${bank.commonCodeName}은행</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizBankNumber" class="col-form-label col-md-3">계좌번호</label>
                                <input id="bizBankNumber" name="bizBankNumber" type="text" class="form-control col-md-8" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="bizNominee" class="col-form-label col-md-3">명의자</label>
                                <input id="bizNominee" name="bizNominee" type="text" class="form-control col-md-8" >
                            </div>
                        </div>
                    </div>
                </div>

                <hr>
                <div class="col-lg-12">
                    <div class="card-accordion" id="accordion">

                        <%-- 추가정보 정보 (전화번호, 휴대전화번호, FAX, 이메일) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseOne">추가정보</div>
                            <div id="collapseOne" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <label for="bizPhone" class="col-form-label col-md-2">전화번호</label>
                                        <input id="bizPhone" name="bizPhone" type="tel" class="form-control col-md-10 phoneNumber"
                                               maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="bizMobile" class="col-form-label col-md-2">휴대전화번호</label>
                                        <input id="bizMobile" name="bizMobile" type="tel" class="form-control col-md-10 phoneNumber"
                                               maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="bizFAX" class="col-form-label col-md-2">FAX 번호</label>
                                        <input id="bizFAX" name="bizFAX" type="tel" class="form-control col-md-10 phoneNumber"
                                               maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="bizEmail" class="col-form-label col-md-2">이메일</label>
                                        <input id="bizEmail" name="bizEmail" class="form-control col-md-3">
                                        <span class="col-xs-1"><i class="fas fa-lg fa-fw m-r-10 fa-at"></i></span>
                                        <input id="email2" class="form-control col-md-3" >
                                        <input type="hidden" id="bizEmailDetail" name="bizEmailDetail" class="form-control col-md-3">
                                        <span class="col-xs-1"></span>
                                        <select id="selectEmail" class="form-control col-md-3" >
                                            <option value="direct">직접입력</option>
                                            <c:forEach items="${emailList}" var="email">
                                                <option value="${email.commonCodeNumber}">${email.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 기타정보 정보 (비고) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseTwo">기타정보</div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <span class="col-md-5">비고</span>
                                        <label for="usage" class="col-form-label col-md-3">사용구분</label>
                                        <select id="usage" name="bizNoteUsage" class="form-control col-md-3">
                                            <c:forEach items="${useList}" var="use">
                                                <option value="${use.commonCodeNumber}">${use.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <textarea class="col-lg-12" name="bizNote" cols="50" rows="10"></textarea>
                                </div>
                            </div>
                        </div>

                        <%-- 담당자 정보 (담당자명, 전화번호) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseThree">담당자 정보</div>
                            <div id="collapseThree" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <label for="bizManager" class="col-form-label col-md-3">담당자</label>
                                        <input id="bizManager" name="bizManager" type="text" class="form-control col-md-8" >
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="bizManagerPhone" class="col-form-label col-md-3">담당자 전화번호</label>
                                        <input id="bizManagerPhone" name="bizManagerPhone" type="tel" class="form-control col-md-8 phoneNumber"
                                               maxlength="13">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 가상 계좌연동 정보 (연동 아이디, 연동 키) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseFour">가상 계좌연동 정보</div>
                            <div id="collapseFour" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <label for="bizLinkageID" class="col-form-label col-md-3">연동 아이디</label>
                                        <input id="bizLinkageID" name="bizLinkageID" type="text" class="form-control col-md-8" value="${bizList.bizLinkageID}">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="bizLinkageKey" class="col-form-label col-md-3">연동 키</label>
                                        <input id="bizLinkageKey" name="bizLinkageKey" type="text" class="form-control col-md-8 " value="${bizList.bizLinkageKey}">
                                    </div>
                                </div>
                            </div>
                        </div><%-- 가상 계좌연동 정보 --%>

                    </div>
                </div>

                <%--      아코디언 끝       --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-12 text-left">
                            <button class="btn btn-success" id="saveBtn">저장</button>
                            <a class="btn btn-warning" href="${pageContext.request.contextPath}/biz">리스트</a>
                        </div>
                    </div>
                </div>

            </div><%-- row 끝 --%>

        </form>
        <hr>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-md-6 text-left">
                </div>
                <div class="col-md-6 text-right">
                    <a class="btn btn-success" id="addBtn" href="javascript:addRow();"><i class="fas fa-lg fa-fw m-r-10 fa-plus"></i></a>
<%--                    <a class="btn btn-danger" href="javascript:deleteRow();"><i class="fas fa-lg fa-fw m-r-10 fa-minus"></i></a>--%>
                </div>
            </div>
            <table id="AddTable" class="table table-bordered">
                <thead>
                <tr>
                    <th>구분</th>
                    <th>브랜드명</th>
                    <th>마감시간</th>
                    <th>시간환산</th>
                    <th>최소주문금액</th>
                    <th>등록일자</th>
                    <th>등록자</th>
                    <th>수정일자</th>
                    <th>수정자</th>
                    <th></th>
                </tr>
                </thead>
                <tbody id="addTableTBody">

                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // $(document).ready(function() {
    //     if($("#bizCode").val() == null){
    //         $("#addBtn").hide();
    //     }
    // })

    // phoneNumber class를 가지고 있으면 자동으로 번호에 하이픈(-)을 넣어준다
    $(document).on("keyup", ".phoneNumber", function() {
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });

    $(document).on("keyup", ".regiNum", function() {
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/^(\d{0,6})(\d{0,7})$/g, '$1-$2').replace(/-{1,2}$/g, ''));
    });

    // 사업장 번호에 하이픈(-)을 자동으로 넣어준다
    function bussiness_num(str, id) {
        str = str.replace(/[^0-9]/g, '');
        let tmp = '';
        if( str.length < 4){
            $("#"+id).val(str);
        }else if(str.length < 6){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            $("#"+id).val(tmp);
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 2);
            tmp += '-';
            tmp += str.substr(5);
            $("#"+id).val(tmp);
        }
    }

    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("bizAddress").value = extraAddr;

                } else {
                    document.getElementById("bizAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('bizPostCode').value = data.zonecode;
                document.getElementById("bizAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("bizAddressDetail").focus();
            }
        }).open();
    }

    $('#selectEmail').change(function(){
        $("#selectEmail option:selected").each(function () {
            if($(this).val()== 'direct'){            //직접입력일 경우
                $("#email2").val('');                //값 초기화
                $("#email2").attr("disabled",false); //활성화
            }else{ //직접입력이 아닐경우
                $("#email2").val($(this).text());    //선택값 입력
                $("#email2").attr("disabled", true);  //비활성화
            }
        });
    });

    $("#formId").submit(function (){
        if($("#bizName").val() == null || $("#bizName").val() == ''){
            swal("입력오류", "사업장명을 입력해주세요", "warning");
            $("#bizName").focus();
            return false;
        }

        if($("#bizNumber").val() == null || $("#bizNumber").val() == ''){
            swal("입력오류", "사업자번호를 입력해주세요", "warning");
            $("#bizNumber").focus();
            return false;
        }

        if($("#bizRegiNumber").val() == null || $("#bizRegiNumber").val() == ''){
            swal("입력오류", "등록번호를 입력해주세요", "warning");
            $("#bizRegiNumber").focus();
            return false;
        }

        if($("#bizCEO").val() == null || $("#bizCEO").val() == ''){
            swal("입력오류", "대표자를 입력해주세요", "warning");
            $("#bizCEO").focus();
            return false;
        }

        if($("#bizStatus").val() == null || $("#bizStatus").val() == ''){
            swal("입력오류", "업태를 입력해주세요", "warning");
            $("#bizStatus").focus();
            return false;
        }

        if($("#bizItem").val() == null || $("#bizItem").val() == ''){
            swal("입력오류", "종목을 입력해주세요", "warning");
            $("#bizItem").focus();
            return false;
        }

        if($("#bizPostCode").val() == null || $("#bizPostCode").val() == ''){
            swal("입력오류", "우편번호를 입력해주세요", "warning");
            $("#bizPostCode").focus();
            return false;
        }

        if($("#bizAddress").val() == null || $("#bizAddress").val() == ''){
            swal("입력오류", "주소를 입력해주세요", "warning");
            $("#bizAddress").focus();
            return false;
        }

        if($("#bizAddressDetail").val() == null || $("#bizAddressDetail").val() == ''){
            swal("입력오류", "상세주소를 입력해주세요", "warning");
            $("#bizAddressDetail").focus();
            return false;
        }

        // if($("#bizEmail").val() == null || $("#bizEmail").val() == ''){
        //     swal("입력오류", "정확한 이메일을 입력해주세요", "warning");
        //     $("#bizEmail").focus();
        //     return false;
        // }

        if($("#selectEmail option:selected").val() == "direct"){
            $("#bizEmailDetail").val($("#email2").val());
        }else{
            $("#bizEmailDetail").val($("#selectEmail option:selected").val());
        }
    })

    function addRow() {
        // table element 찾기
        const table = document.getElementById('AddTable');

        // 새 행(Row) 추가
        const newRow = table.insertRow();

        // 새 행(Row)에 Cell 추가
        const newCell1 = newRow.insertCell(0);  // 구분
        const newCell2 = newRow.insertCell(1);  // 브랜드명
        const newCell3 = newRow.insertCell(2);  // 마감시간
        const newCell4 = newRow.insertCell(3);  // 시간환산
        const newCell5 = newRow.insertCell(4);  // 최소주문금액
        const newCell6 = newRow.insertCell(5);  // 최소주문금액
        const newCell7 = newRow.insertCell(6);  // 최소주문금액
        const newCell8 = newRow.insertCell(7);  // 최소주문금액
        const newCell9 = newRow.insertCell(8);  // 최소주문금액
        const newCell10 = newRow.insertCell(9); // 저장버튼

        // Cell에 텍스트 추가
        newCell1.innerHTML = '<select class="form-control input-white"><option value="4001">위탁</option><option value="4002">도매</option></select>';
        newCell2.innerHTML = '<input class="form-control input-white" type="text">';
        newCell3.innerHTML = '<input class="form-control input-white" type="text">';
        newCell4.innerHTML = '<input class="form-control input-white" type="text">';
        newCell5.innerHTML = '<input class="form-control input-white" type="text">';
        newCell10.innerHTML = '<button class="btn btn-success saveBtn" type="button">저장</button>';
    }

    // 브랜드 저장
    <%--$(document).on("click", ".saveBtn", function() {--%>
    <%--    let thisRow = $(this).closest('tr');--%>

    <%--    let bizCode = $("#bizCode").val();--%>
    <%--    let cat = thisRow.find('td:eq(0)').find('select').val();--%>
    <%--    let name = thisRow.find('td:eq(1)').find('input').val();--%>
    <%--    let endTime = thisRow.find('td:eq(2)').find('input').val();--%>
    <%--    let deadline = thisRow.find('td:eq(3)').find('input').val();--%>
    <%--    let minCost = thisRow.find('td:eq(4)').find('input').val();--%>

    <%--    let regi = $("#bizEditor").val();--%>

    <%--    $.ajax({--%>
    <%--        url: "${pageContext.request.contextPath}/saveBrand",--%>
    <%--        type: "POST",--%>
    <%--        dataType : 'json',--%>
    <%--        data : {"brandBizCode" : bizCode, "brandCategory" : cat, "brandName" : name, "brandEndTime" : endTime,--%>
    <%--            "brandDeadline" : deadline, "brandMinCost" : minCost, "brandRegi" : regi, "brandEditor" : regi },--%>
    <%--        success : function (response) {--%>
    <%--            let html = '';--%>
    <%--            for(let i = 0; i < response.brandList.length;i++){--%>
    <%--                html += '<tr>';--%>
    <%--                html += "<td>"--%>
    <%--                html += '<input type="hidden" name="brandSeq" value="'+response.brandList[i].brandSeq+'"/>';--%>
    <%--                html += response.brandList[i].category+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandName+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandEndTime+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandDeadline+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandMinCost+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandRegiDate+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandRegi+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandEditDate+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandEditor+"</td>";--%>
    <%--                html += '<td><button class="btn btn-danger deleteBtn" type="button">삭제</button></td>';--%>
    <%--                html += '</tr>';--%>
    <%--            }--%>

    <%--            $("#addTableTBody tr").remove();--%>
    <%--            $("#addTableTBody").append(html);--%>
    <%--        },--%>
    <%--        error : function (error){--%>
    <%--            alert("error : " + error.data);--%>
    <%--        }--%>
    <%--    })--%>
    <%--});--%>
    // 브랜드 저장 끝

    // 브랜드 삭제시 나오는 모달창
    // $(document).on("click", ".deleteBtn", function() {
    //     let thisRow = $(this).closest('tr');
    //     let brandSeq = thisRow.find('td:eq(0)').find('input').val();
    //     let regi = $("#bizEditor").val();
    //
    //     $("#WarningModal").modal("show", $("#seq").val(brandSeq), $("#regi").val(regi));
    // });
    // 브랜드 삭제시 나오는 모달창

    // 브랜드 삭제
    <%--$("#delGroupBtn").click(function (){--%>
    <%--    let seq = $("#seq").val();--%>
    <%--    let edit = $("#regi").val();--%>
    <%--    let bizCode = $("#bizCode").val();--%>

    <%--    $.ajax({--%>
    <%--        url: "${pageContext.request.contextPath}/deleteBrand",--%>
    <%--        type: "POST",--%>
    <%--        dataType : 'json',--%>
    <%--        data : {"brandSeq" : seq, "brandEditor" : edit, "brandBizCode" : bizCode },--%>
    <%--        success : function (response) {--%>
    <%--            let html = '';--%>
    <%--            for(let i = 0; i < response.brandList.length;i++){--%>
    <%--                html += '<tr>';--%>
    <%--                html += "<td>"--%>
    <%--                html += '<input type="hidden" name="brandSeq" value="'+response.brandList[i].brandSeq+'"/>';--%>
    <%--                html += response.brandList[i].category+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandName+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandEndTime+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandDeadline+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandMinCost+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandRegiDate+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandRegi+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandEditDate+"</td>";--%>
    <%--                html += "<td>"+response.brandList[i].brandEditor+"</td>";--%>
    <%--                html += '<td><button class="btn btn-danger deleteBtn" type="button">삭제</button></td>';--%>
    <%--                html += '</tr>';--%>
    <%--            }--%>

    <%--            $("#addTableTBody tr").remove();--%>
    <%--            $("#addTableTBody").append(html);--%>
    <%--        },--%>
    <%--        error : function (error){--%>
    <%--            alert("error : " + error.data);--%>
    <%--        }--%>
    <%--    })--%>
    <%--})--%>
</script>