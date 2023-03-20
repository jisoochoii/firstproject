<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" id="centerSeq">
<div class="panel panel-inverse">
    <div class="panel-body">
        <%-- 사업장 폼  --%>
        <form id="formId" method="post" action="${pageContext.request.contextPath}/insertCenter">
            <input type="hidden" id="centerBizCode" name="centerBizCode" value="${loginInfo.userBizCode}">
            <input type="hidden" id="centerEditor" name="centerEditor" value="${loginInfo.userSeq}">
            <input type="hidden" id="centerRegi" name="centerRegi" value="${loginInfo.userSeq}">
            <div class="row">
                <%-- 첫번째 줄 --%>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <legend class="m-b-15">필수정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="centerCode"class="col-form-label col-md-3">창고코드</label>
                                <input id="centerCode" type="text" class="form-control col-md-8" readonly>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerName" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 창고명</label>
                                <input id="centerName" name="centerName" type="text" class="form-control col-md-8" >
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">기초정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="centerBizNumber" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 사업자번호</label>
                                <input id="centerBizNumber" name="centerBizNumber" type="tel" class="form-control col-md-8"
                                       maxlength="12" oninput="business_num(this.value,'centerBizNumber')">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerBizCEO" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 대표자</label>
                                <input id="centerBizCEO" name="centerBizCEO" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerBizStatus" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 업태</label>
                                <input id="centerBizStatus" name="centerBizStatus" type="text" class="form-control col-md-8" >
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerBizItem" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 종목</label>
                                <input id="centerBizItem" name="centerBizItem" type="text" class="form-control col-md-8">
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
                                <label for="centerPostCode" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 우편번호</label>
                                <input id="centerPostCode" name="centerPostCode" type="text" class="form-control col-md-5">
                                <a id="searchPost" type="text" class="btn btn-success col-md-3" href="javascript:DaumPostcode()">주소찾기</a>
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerAddress" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 주소</label>
                                <input id="centerAddress" name="centerAddress" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerAddressDetail" class="col-form-label col-md-3"><i class="fas fa-lg fa-fw m-r-10 fa-asterisk" style="color: red"></i> 상세주소</label>
                                <input id="centerAddressDetail" name="centerAddressDetail" type="text" class="form-control col-md-8">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <legend class="m-b-15">타입정보</legend>
                            <div class="form-group row m-b-15">
                                <label for="centerSName" class="col-form-label col-md-3">창고약칭</label>
                                <input id="centerSName" name="centerSName" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerType" class="col-form-label col-md-3">창고타입</label>
                                <input id="centerType" name="centerType" type="text" class="form-control col-md-8">
                            </div>
                            <div class="form-group row m-b-15">
                                <label for="centerTemp" class="col-form-label col-md-3">보관온도</label>
                                <input id="centerTemp" name="centerTemp" type="text" class="form-control col-md-8">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <sup>o</sup>C
                                    </span>
                                </div>
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
                                        <label for="centerPhone" class="col-form-label col-md-2">전화번호</label>
                                        <input id="centerPhone" name="centerPhone" type="tel" class="form-control col-md-10 phoneNumber"
                                               maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="centerMobile" class="col-form-label col-md-2">휴대전화번호</label>
                                        <input id="centerMobile" name="centerMobile" type="tel" class="form-control col-md-10 phoneNumber"
                                               maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="centerFAX" class="col-form-label col-md-2">FAX 번호</label>
                                        <input id="centerFAX" name="centerFAX" type="tel" class="form-control col-md-10 phoneNumber"
                                               maxlength="13">
                                    </div>
                                    <div class="form-group row m-b-15">
                                        <label for="centerEmail" class="col-form-label col-md-2">이메일</label>
                                        <input id="centerEmail" name="centerEmail" class="form-control col-md-3" >

                                        <span class="col-xs-1"><i class="fas fa-lg fa-fw m-r-10 fa-at"></i></span>

                                        <input id="email2" class="form-control col-md-3">
                                        <input type="hidden" id="centerEmailDetail" name="centerEmailDetail" class="form-control col-md-3">
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
                        </div><%-- 추가정보 정보 --%>

                        <%-- 기타정보 정보 (비고) --%>
                        <div class="card">
                            <div class="card-header bg-black text-white pointer-cursor collapsed" data-toggle="collapse" data-target="#collapseTwo">기타정보</div>
                            <div id="collapseTwo" class="collapse" data-parent="#accordion">
                                <div class="card-body">
                                    <div class="form-group row m-b-15">
                                        <span class="col-md-5">비고</span>
                                        <label for="centerNoteUsage" class="col-form-label col-md-3">사용구분</label>
                                        <select id="centerNoteUsage" name="centerNoteUsage" class="form-control col-md-3">
                                            <c:forEach items="${useList}" var="use">
                                                <option value="${use.commonCodeNumber}">${use.commonCodeName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <textarea class="col-lg-12" id="centerNote" name="centerNote" cols="50" rows="10"></textarea>
                                </div>
                            </div>
                        </div><%-- 기타정보 정보 끝 --%>

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
                    <option value="centerName">창고명</option>
                    <option value="centerCode">창고코드</option>
                </select>
                <input type="text" id="searchBox" name="searchBox" class="form-control col-md-7">
                <button class="btn btn-base col-md-3" id="searchBtn">
                    <i class="fa fa-search fa-fw"></i> 검색
                </button>
            </div>
            <table id="sideTable" class="table table-bordered">
                <thead>
                <tr>
                    <th>창고코드</th>
                    <th>창고명</th>
                </tr>
                </thead>
                <tbody id="sideTableTBody">
                <c:forEach items="${centerList}" var="center">
                    <tr>
                        <td><input type="hidden" value="${center.centerBizCode}">${center.centerCode}</td>
                        <td><input type="hidden" value="${center.centerSeq}">${center.centerName}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div><%-- 오른쪽에 있는 사이드바 끝 --%>

<%-- 창고 삭제시 보이는 모달 창 --%>
<div class="modal fade" id="WarningModal" tabindex="-1" role="dialog" aria-labelledby="modalLabels" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold text-primary" id="modalLabels">브랜드 삭제</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
                </button>
            </div>
            <div class="modal-body text-gray-800">
                <input type="hidden" id="seq" name="brandSeq">
                <input type="hidden" id="regi" name="brandEditor">
                <h2>브랜드를 삭제하시겠습니까?</h2>
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger" id="delGroupBtn" data-dismiss="modal">삭제</button>
                <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<%-- 브랜드 삭제시 보이는 모달 창 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(document).ready(function() {
        if($("#centerCode").val() == null || $("#centerCode").val() == ''){
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
                    document.getElementById("centerAddress").value = extraAddr;

                } else {
                    document.getElementById("centerAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('centerPostCode').value = data.zonecode;
                document.getElementById("centerAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("centerAddressDetail").focus();
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
                $("#centerEmailDetail").val($(this).val());    //선택값 입력
                $("#email2").attr("disabled", true);  //비활성화
            }
        });
    });
    // 셀렉에 있는 이메일 끝

    // 창고 수정
    $("#updateBtn").click (function (e){
        let centerSeq = $("#centerSeq").val();
        let centerCode = $("#centerCode").val();
        $("#formId").attr("action", "${pageContext.request.contextPath}/updateCenter");
        $("#formId").attr("method", "POST")
        $("#formId").append('<input type="hidden" name="centerSeq" value="'+centerSeq+'">');
        $("#formId").append('<input type="hidden" name="centerCode" value="'+centerCode+'">');
        $("#formId").submit();
    })
    // 창고 수정 끝

    // 창고 삭제
    $("#deleteBtn").click (function (e){
        let centerSeq = $("#centerSeq").val();

        $("#formId").attr("action", "${pageContext.request.contextPath}/deleteCenter");
        $("#formId").attr("method", "POST")
        $("#formId").append('<input type="hidden" name="centerSeq" value="'+centerSeq+'">');
        $("#formId").submit();
    })
    // 창고 삭제 끝

    // 창고 서브밋
    $("#formId").submit(function (){
        if($("#centerName").val() == null || $("#centerName").val() == ''){
            swal("입력오류", "창고명을 입력해주세요", "warning");
            $("#centerName").focus();
            return false;
        }

        if($("#centerBizNumber").val() == null || $("#centerBizNumber").val() == ''){
            swal("입력오류", "사업자번호를 입력해주세요", "warning");
            $("#centerBizNumber").focus();
            return false;
        }

        if($("#centerBizCEO").val() == null || $("#centerBizCEO").val() == ''){
            swal("입력오류", "대표자를 입력해주세요", "warning");
            $("#centerBizCEO").focus();
            return false;
        }

        if($("#centerBizStatus").val() == null || $("#centerBizStatus").val() == ''){
            swal("입력오류", "업태를 입력해주세요", "warning");
            $("#centerBizStatus").focus();
            return false;
        }

        if($("#centerBizItem").val() == null || $("#centerBizItem").val() == ''){
            swal("입력오류", "종목을 입력해주세요", "warning");
            $("#centerBizItem").focus();
            return false;
        }

        if($("#centerPostCode").val() == null || $("#centerPostCode").val() == ''){
            swal("입력오류", "우편번호를 입력해주세요", "warning");
            $("#centerPostCode").focus();
            return false;
        }

        if($("#centerAddress").val() == null || $("#centerAddress").val() == ''){
            swal("입력오류", "주소를 입력해주세요", "warning");
            $("#centerAddress").focus();
            return false;
        }

        if($("#centerAddressDetail").val() == null || $("#centerAddressDetail").val() == ''){
            swal("입력오류", "상세주소를 입력해주세요", "warning");
            $("#centerAddressDetail").focus();
            return false;
        }

        if($("#selectEmail option:selected").val() == "direct"){
            $("#centerEmailDetail").val($("#email2").val());
        }else{
            $("#centerEmailDetail").val($("#selectEmail option:selected").val());
        }

    })
    // 창고 서브밋 끝


    // 정보 조회 검색부분
    $("#searchBtn").click(function (){
        let search = $("#searchBox").val();
        let select = $("#searchOption option:selected").val();
        let centerBizCode = $("#centerBizCode").val();

        $.ajax({
            url: "${pageContext.request.contextPath}/searchCenter",
            type: "POST",
            dataType : 'json',
            data : {"search" : search, "searchOption" : select, "centerBizCode" : centerBizCode},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.searchList.length;i++){
                    html += '<tr>';
                    html += '<td><input type="hidden" value="'+response.searchList[i].centerBizCode+'">'+response.searchList[i].centerCode+'</td>';
                    html += '<td><input type="hidden" value="'+response.searchList[i].centerSeq+'">'+response.searchList[i].centerName+'</td>';
                    html += '</tr>';
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
        let centerSeq = $(this).find('td:eq(1) input').val();

        $.ajax({
            url: "${pageContext.request.contextPath}/ajaxCenter",
            type: "POST",
            dataType : 'json',
            data : {"centerSeq" : centerSeq},
            success : function (response) {
                $("#centerBizCode").val(response.viewList.centerBizCode);

                $("#centerSeq").val(response.viewList.centerSeq);
                $("#centerCode").val(response.viewList.centerCode);
                $("#centerName").val(response.viewList.centerName);
                $("#centerBizNumber").val(response.viewList.centerBizNumber);
                $("#centerBizCEO").val(response.viewList.centerBizCEO);
                $("#centerBizStatus").val(response.viewList.centerBizStatus);
                $("#centerBizItem").val(response.viewList.centerBizItem);
                $("#centerSName").val(response.viewList.centerSName);
                $("#centerType").val(response.viewList.centerType);
                $("#centerTemp").val(response.viewList.centerTemp);
                $("#centerPhone").val(response.viewList.centerPhone);
                $("#centerMobile").val(response.viewList.centerMobile);
                $("#centerFAX").val(response.viewList.centerFAX);
                $("#centerEmail").val(response.viewList.centerEmail);
                $("#centerPostCode").val(response.viewList.centerPostCode);

                $("#centerAddress").val(response.viewList.centerAddress);
                $("#centerAddressDetail").val(response.viewList.centerAddressDetail);
                $("#centerNote").val(response.viewList.centerNote);
                $("#centerNoteUsage").val(response.viewList.centerNoteUsage);

                $("#updateBtn").show();
                $("#deleteBtn").show();
                $("#saveBtn").hide();

                $("#selectEmail option").each(function (){
                    if(this.value == response.viewList.centerEmailDetail){
                        $("#selectEmail option[value="+response.viewList.centerEmailDetail+"]").attr('selected',true);
                        $("#email2").val(response.viewList.emailCommon);
                    }
                })

                if($("#selectEmail option[value='direct']").val() == true){
                    $("#centerEmailDetail").val(response.viewList.centerEmailDetail);
                    $("#email2").val(response.viewList.centerEmailDetail);
                    $("#selectEmail option[value='direct']").attr('selected', true);
                }

                $("#centerNoteUsage option").each(function (){
                    if(this.value == response.viewList.centerNoteUsage){
                        $("#centerNoteUsage option[value="+response.viewList.centerNoteUsage+"]").attr('selected',true);
                    }
                })
            },
            error : function (error){
                alert("error : " + error);
            }
        })
    })
</script>