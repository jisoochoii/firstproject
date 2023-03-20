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
                    <div class="col-lg-12 text-right" id="titleGroup">

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
    <%--  검색 모달  --%>
    <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <%-- 모달창의 머리 (제목을 가지고 있다) --%>
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">사용자 추가</h5>
                    <%-- bootstrap4에서는 data-dismiss 사용, bootstrap5에서는 data-dismiss 사용 --%>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
                    </button>
                </div>
                <%-- 모달창의 몸통 (내용을 가지고 있다) --%>
                <div class="modal-body">
                    <div class="col-lg-12 card-margin">
                        <div class="card search-form">
                            <div class="card-body p-0">
                                <div id="search-form">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row no-gutters">
                                                <div class="col-lg-10 col-md-6 col-sm-12 p-0">
                                                    <input id="keyword" type="text" name="keyword" class="form-control form-control-lg" style="outline: none;">
                                                </div>
                                                <div class="col-lg-2 col-md-3 col-sm-12 p-0">
                                                    <button type="button" class="btn btn-base" id="searchBtn">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                             stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                             class="feather feather-search">
                                                            <circle cx="11" cy="11" r="8"></circle>
                                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                                        </svg>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>이름</th>
                                    <th>사용자 아이디</th>
                                </tr>
                            </thead>
                            <tbody id="userBody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <%-- 모달창의 다리 (버튼을 가지고 있다) --%>
                <div class="modal-footer">
                    <button class="btn btn-success" id="addGroupUser" data-dismiss="modal">추가</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <%--  그룹 추가  --%>
    <div class="modal fade" id="groupAddModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold text-primary" id="modalLabel">그룹 등록</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
                    </button>
                </div>
                <form action="${pageContext.request.contextPath}/groupInsert">
                    <input type="hidden" name="groupRegi" value="${loginInfo.userSeq}">
                    <input type="hidden" name="groupEditor" value="${loginInfo.userSeq}">
                    <div class="modal-body text-gray-800">
                        <div class="row">
                            <div class="col-lg-4">
                                <h3>그룹명</h3>
                            </div>
                            <div class="col-lg-8">
                                <input type="text" id="groupName" name="groupName" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" id="addGroupBtn" type="submit">그룹 추가</button>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%--  사용자 그룹 탈퇴  --%>
    <div class="modal fade" id="groupOutModal" tabindex="-1" role="dialog" aria-labelledby="modalLabels"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold text-primary" id="modalLabels">사용자 그룹삭제</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true"><i class="fas fa-lg fa-fw m-r-10 fa-times"></i></span>
                    </button>
                </div>
                <div class="modal-body text-gray-800">
                    <input type="hidden" id="ugSeq" name="ugSeq">
                    <input type="hidden" id="ugGroupSeq" name="ugGroupSeq">
                    <h2>그룹에서 삭제하시겠습니까?</h2>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" id="delGroupBtn" data-dismiss="modal">그룹에서 삭제</button>
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                </div>
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
        $('#dataTable').DataTable( {
            language : lang_kor
        });
    });

    $("#dataTable tr:gt(0)").click(function() {
        // 모달창을 나오게 하는 메서드
        let groupSeq = $(this).find('td:eq(0)').text();
        $.ajax({
            url: "${pageContext.request.contextPath}/groupUserList",
            type: "GET",
            dataType : 'json',
            data : {"groupSeq" : groupSeq},
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
                $("#titleGroup button").remove();
                $("#titleGroup").append('<button id="addUser" class="btn btn-success">사용자 추가</button>');
                $("#tbody").append(html);

                let test = '';
                test += '<input type="hidden" id="groupSeq" value="'+groupSeq+'"/>';

                $("#titleGroup").append(test);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    // dataTable의 정보를 클릭하면 ajax로 사용자 추가버튼과 사용자 테이블을 만들어준다
    // $("#dataTable tr:gt(0)").click(function() {
    //
    // });

    $("#keyword").keydown(function (event) {
        if(event.keyCode === 13){
            $("#searchBtn").click();
        }
    })

    // id가 searchBtn인 버튼을 클릭했을 때, ajax를 실행한다. (사용자를 검색한다)
    $("#searchBtn").click(function (){
        let keyword = $("#keyword").val();
        let groupSeq = $("#groupSeq").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/groupUserSearch",
            type: "GET",
            dataType : 'json',
            data : {"keyword" : keyword, "groupSeq" : groupSeq},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.userList.length;i++){
                    html += '<tr>';
                    html += "<td>" + response.userList[i].userSeq + "</td>";
                    html += "<td>" + response.userList[i].userName + "</td>";
                    html += "<td>" + response.userList[i].userID + "</td>";
                    html += '</tr>';
                }
                $("#userBody tr").remove();
                $("#userBody").append(html);
            },
            error : function (error){
                alert("error : " + error.userList);
            }
        })
    })

    // 위에서 검색한 내용을 토대로 그룹과 연결하여 insert를 하고 dataTables에 테이블과 버튼을 만들어준다
    $("#addGroupUser").click(function (){
        let userSeq = $("#userInfoSeq").val();
        let ugGroupSeq = $("#groupSeq").val();
        let ugUserSeq = $("#userBody tr td:eq(0)").text();
        $.ajax({
            url: "${pageContext.request.contextPath}/userList",
            type: "GET",
            dataType : 'json',
            data : {"userSeq" : userSeq, "ugGroupSeq" : ugGroupSeq, "ugUserSeq" : ugUserSeq},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.userList.length;i++){
                    html += '<tr>';
                    html += "<td>"+response.userList[i].ugSeq+"</td>";
                    html += "<td>"+response.userList[i].groupName+"</td>";
                    html += "<td>"+response.userList[i].userName+"</td>";
                    html += '</tr>';
                }
                $("#tbody tr").remove();
                $("#titleGroup button").remove();
                $("#titleGroup").append('<button id="addUser" class="btn btn-success">그룹 추가</button>');
                $("#tbody").append(html);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    })

    $(document).on("click", "#dataTables tr:gt(0)", function() {
        // 모달창을 나오게 하는 메서드
        let ugSeq = $(this).find("td:eq(0)").text();
        $("#groupOutModal").modal("show", $("#ugSeq").val(ugSeq));
    });

    // 그룹에서 사용자를 삭제하는 메서드
    $("#delGroupBtn").click(function (){
        let ugSeq = $("#ugSeq").val();
        let ugGroupSeq = $("#groupSeq").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/groupUserDel",
            type: "GET",
            dataType : 'json',
            data : {"ugSeq" : ugSeq, "ugGroupSeq" : ugGroupSeq},
            success : function (response) {
                let html = '';
                for(let i = 0; i < response.userList.length;i++){
                    html += '<tr>';
                    html += "<td>"+response.userList[i].ugSeq+"</td>";
                    html += "<td>"+response.userList[i].groupName+"</td>";
                    html += "<td>"+response.userList[i].userName+"</td>";
                    html += '</tr>';
                }
                
                $("#tbody tr").remove();
                $("#titleGroup button").remove();
                $("#titleGroup").append('<button id="addUser" class="btn btn-success">그룹 추가</button>');
                $("#tbody").append(html);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    // 동적으로 생성된 버튼에 클릭기능을 사용할 수 있게하는 메서드
    $(document).on("click", "#addUser", function() {
        // 모달창을 나오게 하는 메서드
        $("#searchModal").modal("show");
    });

    $("#addGroup").click(function (){
        $("#groupAddModal").modal("show");
    })
</script>