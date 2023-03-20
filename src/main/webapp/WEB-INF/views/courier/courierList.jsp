<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" id="courierSeq">
<input type="hidden" id="courierBizCode" name="courierBizCode" value="${bizCode}">
<div class="panel panel-inverse">
    <div class="panel-body">
        <%-- 사업장 폼  --%>
        <form id="formId" method="post" action="${pageContext.request.contextPath}/courierInsert">
            <input type="hidden" id="bizCode" name="courierBizCode">
            <input type="hidden" id="courierEditor" name="courierEditor" value="${loginInfo.userSeq}">
            <input type="hidden" id="courierRegi" name="courierRegi" value="${loginInfo.userSeq}">
            <div class="row">
                <%-- 첫번째 줄 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">필수정보</legend>
<%--                            <c:if test="${loginInfo.group == 'admin'}">--%>
<%--                                <div class="form-group row m-b-15">--%>
<%--                                    <label for="zz" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업장</label>--%>
<%--                                    <select id="zz" name="bizCode" class="form-control col-md-8">--%>
<%--                                        <c:forEach items="${bizList}" var="biz">--%>
<%--                                            <option value="${biz.bizCode}">${biz.bizName}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>


                            <div class="form-group row m-b-15">
                                <label for="courierCenter" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 배송센터</label>
                                <select id="courierCenter" name="courierCenter" class="form-control col-md-8" >
                                    <c:forEach items="${centerList}" var="center">
                                        <option value="${center.centerCode}">${center.centerName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierCode"class="col-form-label col-md-3">기사코드</label>
                                <input id="courierCode" type="text" class="form-control col-md-8" readonly>
<%--                                <input type="hidden" name="courierCode" value="0">--%>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierName" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 배송기사명</label>
                                <input id="courierName" name="courierName" type="text" class="form-control col-md-8" >
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">기초정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="courierPhone" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 전화번호</label>
                                <input id="courierPhone" name="courierPhone" type="tel" class="form-control col-md-8 phoneNumber"
                                       maxlength="13">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierMobile" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 휴대전화번호</label>
                                <input id="courierMobile" name="courierMobile" type="tel" class="form-control col-md-8 phoneNumber"
                                       maxlength="13">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierWorkDistance" class="col-form-label col-md-3">출근거리</label>
                                <input id="courierWorkDistance" name="courierWorkDistance" type="text" class="form-control col-md-8" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierJoinDate" class="col-form-label col-md-3">입사일자</label>
                                <input id="courierJoinDate" name="courierJoinDate" type="date" class="form-control col-md-8">
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
                                <label for="courierPostCode" class="col-form-label col-md-3">우편번호</label>
                                <input id="courierPostCode" name="courierPostCode" type="text" class="form-control col-md-5">
                                <a id="searchPost" type="text" class="btn btn-success col-md-3" href="javascript:DaumPostcode()">주소찾기</a>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierAddress" class="col-form-label col-md-3">주소</label>
                                <input id="courierAddress" name="courierAddress" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierAddressDetail" class="col-form-label col-md-3">상세주소</label>
                                <input id="courierAddressDetail" name="courierAddressDetail" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">운송사정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="courierBelong" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 소속</label>
                                <input id="courierBelong" name="courierBelong" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierContact" class="col-form-label col-md-3">연락처</label>
                                <input id="courierContact" name="courierContact" type="tel" class="form-control col-md-8 phoneNumber"
                                       maxlength="13">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="courierManager" class="col-form-label col-md-3">담당자</label>
                                <input id="courierManager" name="courierManager" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="col-lg-12">
                    <div class="card-accordion" id="accordion">

                        <%-- 차량정보 (소유자, 차량번호, 차종, 차량연식, 차량톤수, 차량도색, 온도기록계) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseOne">차량정보</div>
                            <div id="collapseOne" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarOwner" class="col-form-label col-md-3">소유자</label>
                                        <input id="courierCarOwner" name="courierCarOwner" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarNumber" class="col-form-label col-md-3">차량번호</label>
                                        <input id="courierCarNumber" name="courierCarNumber" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarModel" class="col-form-label col-md-3">차종</label>
                                        <input id="courierCarModel" name="courierCarModel" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarModelYear" class="col-form-label col-md-3">차량연식</label>
                                        <input id="courierCarModelYear" name="courierCarModelYear" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarTonnage" class="col-form-label col-md-3">차량톤수</label>
                                        <input id="courierCarTonnage" name="courierCarTonnage" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarColor" class="col-form-label col-md-3">차량도색</label>
                                        <input id="courierCarColor" name="courierCarColor" type="text" class="form-control col-md-8">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="courierCarTemp" class="col-form-label col-md-3">온도기록계</label>
                                        <input id="courierCarTemp" name="courierCarTemp" type="text" class="form-control col-md-8">
                                    </div>
                                </div>
                            </div>
                        </div><%-- 추가정보 정보 --%>

                        <%-- 기타정보 정보 (비고) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseTwo">기타정보</div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <span class="col-md-5">비고</span>
                                        <label for="courierUsage" class="col-form-label col-md-3">사용구분</label>
                                        <select id="courierUsage" name="courierUsage" class="form-control col-md-3">
                                            <c:forEach items="${useList}" var="use">
                                                <option value="${use.commonCodeNumber}">${use.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <textarea class="col-lg-12" name="courierNote" cols="50" rows="10"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <%--      아코디언 끝       --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-12 text-left">
                            <button class="btn btn-primary" id="saveBtn">저장</button>
                            <button class="btn btn-success" id="updateBtn">수정</button>
                            <button class="btn btn-danger" id="deleteBtn">삭제</button>
                        </div>
                    </div>
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
            <div class="input-group row col-md-12">
                <select id="searchOption" class="form-control col-md-2">
                    <option value="courierName">배송기사명</option>
                    <option value="courierCode">기사코드</option>
                </select>
                <input type="text" id="searchBox" name="searchBox" class="form-control col-md-7">
                <button class="btn btn-base col-md-3" id="searchBtn">
                    <i class="fa fa-search fa-fw"></i> 검색
                </button>
            </div>
            <table id="sideTable" class="table table-bordered">
                <thead>
                <tr>
                    <th>기사코드</th>
                    <th>배송센터</th>
                    <th>배송기사명</th>
                </tr>
                </thead>
                <tbody id="sideTableTBody">
                <c:forEach items="${courierList}" var="courier">
                    <tr>
                        <td><input type="hidden" value="${courier.courierSeq}">${courier.courierCode}</td>
                        <td><input type="hidden" value="${courier.centerCode}">${courier.centerName}</td>
                        <td>${courier.courierName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div><%-- 오른쪽에 있는 사이드바 끝 --%>

<%-- 배송기사 삭제시 보이는 모달 창 --%>
<div class="modal fade" id="WarningModal" tabindex="-1" role="dialog" aria-labelledby="modalLabels" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold text-primary" id="modalLabels">배송기사 삭제</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body text-gray-800">
                <input type="hidden" id="seq" name="courierSeq">
                <input type="hidden" id="regi" name="courierEditor">
                <h2>배송기사를 삭제하시겠습니까?</h2>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" id="delGroupBtn" data-dismiss="modal">삭제</button>
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(document).ready(function() {
        if($("#courierCode").val() == null || $("#courierCode").val() == ''){
            $("#updateBtn").hide();
            $("#deleteBtn").hide();
        }
    });

    // 전화번호 정규식 (자동 하이픈(-))
    $(document).on("keyup", ".phoneNumber", function() {
        $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
    });
    // 전화번호 정규식 (자동 하이픈)

    // 사업자번호 정규식 (자동 하이픈(-))
    function business_num(str, id) {
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
    // 사업자번호 정규식 (자동 하이픈(-)) 끝

    // 다음 주소찾기
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
                    document.getElementById("courierAddress").value = extraAddr;

                } else {
                    document.getElementById("courierAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('courierPostCode').value = data.zonecode;
                document.getElementById("courierAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("courierAddressDetail").focus();
            }
        }).open();
    }
    // 다음 주소찾기 끝

    // 셀렉에 있는 이메일
    $('#selectEmail').change(function(){
        $("#selectEmail option:selected").each(function () {
            if($(this).val()== 'direct'){            //직접입력일 경우
                $("#email2").val('');                //값 초기화
                $("#email2").attr("disabled",false); //활성화
            }else{ //직접입력이 아닐경우
                $("#email2").val($(this).text());    //선택값 입력
                $("#courierEmailDetail").val($(this).val());    //선택값 입력
                $("#email2").attr("disabled", true);  //비활성화
            }
        });
    });
    // 셀렉에 있는 이메일 끝

    // 배송기사 수정
    $("#updateBtn").click (function (e){
        let courierSeq = $("#courierSeq").val();
        let courierCode = $("#courierCode").val();
        $("#formId").attr("action", "${pageContext.request.contextPath}/updateCourier");
        $("#formId").attr("method", "POST")
        $("#formId").append('<input type="hidden" name="courierSeq" value="'+courierSeq+'">');
        $("#formId").submit();
    })
    // 배송기사 수정 끝

    // 배송기사 삭제
    $("#deleteBtn").click (function (e){
        let courierSeq = $("#courierSeq").val();

        $("#formId").attr("action", "${pageContext.request.contextPath}/deleteCourier");
        $("#formId").attr("method", "POST")
        $("#formId").append('<input type="hidden" name="courierSeq" value="'+courierSeq+'">');
        $("#formId").submit();
    })
    // 배송기사 삭제 끝

    // 배송기사 서브밋
    $("#formId").submit(function (){
        if($("#courierName").val() == null || $("#courierName").val() == ''){
            swal("입력오류", "배송기사명을 입력해주세요", "warning");
            $("#courierName").focus();
            return false;
        }

        if($("#courierPhone").val() == null || $("#courierPhone").val() == ''){
            swal("입력오류", "전화번호를 입력해주세요", "warning");
            $("#courierPhone").focus();
            return false;
        }

        if($("#courierMobile").val() == null || $("#courierMobile").val() == ''){
            swal("입력오류", "휴대전화번호를 입력해주세요", "warning");
            $("#courierMobile").focus();
            return false;
        }

        if($("#courierBelong").val() == null || $("#courierBelong").val() == ''){
            swal("입력오류", "소속을 입력해주세요", "warning");
            $("#courierBelong").focus();
            return false;
        }

        $("#bizCode").val($("#courierBizCode").val());
    })
    // 배송기사 서브밋 끝


    // 정보 조회 검색부분
    $("#searchBtn").click(function (){
        let search = $("#searchBox").val();
        let select = $("#searchOption option:selected").val();
        let courierBizCode = $("#courierBizCode").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/searchCourier",
            type: "POST",
            dataType : 'json',
            data : {"search" : search, "searchOption" : select, "courierBizCode" : courierBizCode},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.searchList.length;i++) {
                    html += '<tr>';
                    html += '<td><input type="hidden" value="' + response.searchList[i].courierSeq + '">' + response.searchList[i].courierCode + '</td>';
                    html += '<td><input type="hidden" value="' + response.searchList[i].centerCode + '">' + response.searchList[i].centerName + '</td>';
                    html += '<td>' + response.searchList[i].courierName + '</td>';
                }

                $("#sideTableTBody tr").remove();
                $("#sideTableTBody").append(html);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });
    // 정보 조회 검색부분

    // 오른쪽 사이드 테이블에서 클릭시
    $(document).on("click", "#sideTable tr:gt(0)", function (){
        let courierSeq = $(this).find('td:eq(0) input').val();

        $.ajax({
            url: "${pageContext.request.contextPath}/ajaxCourier",
            type: "POST",
            dataType : 'json',
            data : {"courierSeq" : courierSeq},
            success : function (response) {
                $("#courierBizCode").val(response.viewList.courierBizCode);

                $("#courierSeq").val(courierSeq);
                $("#courierCode").val(response.viewList.courierCode);
                $("#courierCenter").val(response.viewList.courierCenter);
                $("#courierName").val(response.viewList.courierName);
                $("#courierPhone").val(response.viewList.courierPhone);
                $("#courierMobile").val(response.viewList.courierMobile);
                $("#courierWorkDistance").val(response.viewList.courierWorkDistance);
                $("#courierJoinDate").val(response.viewList.courierJoinDate);
                $("#courierPostCode").val(response.viewList.courierPostCode);
                $("#courierAddress").val(response.viewList.courierAddress);
                $("#courierAddressDetail").val(response.viewList.courierAddressDetail);
                $("#courierBelong").val(response.viewList.courierBelong);
                $("#courierContact").val(response.viewList.courierContact);
                $("#courierManager").val(response.viewList.courierManager);
                $("#courierCarOwner").val(response.viewList.courierCarOwner);
                $("#courierCarNumber").val(response.viewList.courierCarNumber);
                $("#courierCarModel").val(response.viewList.courierCarModel);
                $("#courierCarModelYear").val(response.viewList.courierCarModelYear);
                $("#courierCarTonnage").val(response.viewList.courierCarTonnage);
                $("#courierCarColor").val(response.viewList.courierCarColor);
                $("#courierCarTemp").val(response.viewList.courierCarTemp);
                $("#courierUsage").val(response.viewList.courierUsage);
                $("#courierNote").val(response.viewList.courierNote);

                $("#updateBtn").show();
                $("#deleteBtn").show();
                $("#saveBtn").hide();

                $("#centerNoteUsage option").each(function (){
                    if(this.value == response.viewList.centerUsage){
                        $("#centerNoteUsage option[value="+response.viewList.centerNoteUsage+"]").attr('selected',true);
                    }
                })

                $("#courierCenter option").each(function (){
                    if(this.value == response.viewList.courierCenter){
                        $("#courierCenter option[value="+response.viewList.courierCenter+"]").attr('selected',true);
                    }
                })
            },
            error : function (error){
                alert("error : " + error);
            }
        })
    })
</script>