<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<input type="hidden" id="sgRegi" value="${loginInfo.userSeq}">
<input type="hidden" id="sgEditor" value="${loginInfo.userSeq}">
<div class="panel panel-inverse">
    <!-- Page Heading -->
    <div class="panel-heading">
        <h4 class="panel-title">권한 관리</h4>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-lg-12">
                <div class="result-container">
                    <div class="input-group input-group-lg m-b-20">
                        <select id="groupOption" class="form-control form-control-lg">
                            <c:forEach var="auth" items="${authGroup}">
                                <option value="${auth.groupSeq}">${auth.groupName}</option>
                            </c:forEach>
                        </select>
                        <button class="btn btn-base" id="btnGroup">
                            <i class="fa fa-search fa-fw"></i> 검색
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-5" id="notInList">
                    <table class="table table-bordered" id="notInTable">
                        <thead>
                        <tr>
                            <th style="width: 10%;"><input type="checkbox" id="checkAllOut"></th>
                            <th>No.</th>
                            <th>화면명</th>
                        </tr>
                        </thead>
                        <tbody id="notIn">

                        </tbody>
                    </table>
                </div>
                <div class="col-lg-2">
                    <button id="insertScreenGroup" class="btn btn-success"><i class="fas fa-lg fa-fw m-r-10 fa-plus"></i></button>
                    <button id="deleteScreenGroup" class="btn btn-danger"><i class="fas fa-lg fa-fw m-r-10 fa-minus"></i></button>
                </div>
                <div class="col-lg-5" id="inList">
                    <table class="table table-bordered" id="inTable">
                        <thead>
                        <tr>
                            <th style="width: 10%;"><input type="checkbox" id="checkAllIn"></th>
                            <th style="width: 10%">No.</th>
                            <th>화면명</th>
                            <th>읽기</th>
                            <th>읽기+쓰기</th>
                        </tr>
                        </thead>
                        <tbody id="inBody">

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    $("#btnGroup").click(function (){
        let selectGroup = document.getElementById("groupOption").value;
        $.ajax({
            url: "${pageContext.request.contextPath}/groupScreenList",
            type: "GET",
            dataType : 'json',
            data : {"groupSeq" : selectGroup},
            success : function (response) {
                let inHtml = '';
                let html = '';
                for(let i = 0; i < response.outList.length; i++){
                    html += '<tr>';
                    html += "<td><input type='checkbox' name='insertCheck'/></td>";
                    html += "<td>"+response.outList[i].screenSeq+"</td>";
                    html += "<td>"+response.outList[i].screenName+"</td>";
                    html += '</tr>';
                }

                for(let i = 0; i < response.inList.length; i++){
                    inHtml += '<tr>';
                    inHtml += "<td><input type='checkbox' name='deleteCheck'/></td>";
                    inHtml += "<td>" + response.inList[i].sgSeq+"</td>";
                    inHtml += "<td>"+response.inList[i].screenName+"</td>";
                    if(response.inList[i].sgAuth == "RW"){
                        inHtml += "<td><input type='checkbox' name='rCheck' disabled/></td>";
                        inHtml += "<td><input type='checkbox' name='rwCheck' checked/></td>";
                    }else{
                        inHtml += "<td><input type='checkbox' name='rCheck' checked/></td>";
                        inHtml += "<td><input type='checkbox' name='rwCheck' disabled/></td>";
                    }
                    inHtml += '</tr>';
                }

                $("#notIn tr").remove();
                $("#notIn").append(html);

                $("#inBody tr").remove();
                $("#inBody").append(inHtml);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    $("#insertScreenGroup").click(function (){
        let tdArr = [];

        let checkbox = $("input[name=insertCheck]:checked");
        let groupSeq = $("#groupOption").val();
        let editSeq = $("#sgEditor").val();
        let regiSeq = $("#sgRegi").val();

        // 체크된 체크박스 값을 가져온다
        checkbox.each(function(i) {
            // checkbox.parent() : checkbox의 부모는 <td>이다.
            // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
            let tr = checkbox.parent().parent().eq(i);
            let td = tr.children();

            let rowData = {};

            // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
            rowData['sgScreenSeq'] = td.eq(1).text();
            // rowData['screenName'] = td.eq(2).text();
            rowData['sgGroupSeq'] = groupSeq;
            rowData['sgEditor'] = editSeq;
            rowData['sgRegi'] = regiSeq;

            tdArr.push(rowData);
        });

        $.ajax({
            url: "${pageContext.request.contextPath}/ajaxScreenGroupInsert",
            type: "POST",
            dataType : 'json',
            contentType : "application/json; charset=utf-8",
            data : JSON.stringify(tdArr),
            success : function (response) {
                let inHtml = '';
                let html = '';
                for(let i = 0; i < response.outList.length; i++){
                    html += '<tr>';
                    html += "<td><input type='checkbox' name='insertCheck'/></td>";
                    html += "<td>"+response.outList[i].screenSeq+"</td>";
                    html += "<td>"+response.outList[i].screenName+"</td>";
                    html += '</tr>';
                }

                for(let i = 0; i < response.inList.length; i++){
                    inHtml += '<tr>';
                    inHtml += "<td><input type='checkbox' name='deleteCheck'/></td>";
                    inHtml += "<td>" + response.inList[i].sgSeq+"</td>";
                    inHtml += "<td>"+response.inList[i].screenName+"</td>";
                    if(response.inList[i].sgAuth == "RW"){
                        inHtml += "<td><input type='checkbox' name='rCheck' disabled/></td>";
                        inHtml += "<td><input type='checkbox' name='rwCheck' checked/></td>";
                    }else{
                        inHtml += "<td><input type='checkbox' name='rCheck' checked/></td>";
                        inHtml += "<td><input type='checkbox' name='rwCheck' disabled/></td>";
                    }
                    inHtml += '</tr>';
                }

                $("#notIn tr").remove();
                $("#notIn").append(html);

                $("#inBody tr").remove();
                $("#inBody").append(inHtml);
                $("#checkAllOut").prop("checked",false);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });

    $("#deleteScreenGroup").click(function (){
        let tdArr = [];

        let checkbox = $("input[name=deleteCheck]:checked");
        let groupSeq = $("#groupOption").val();


        // 체크된 체크박스 값을 가져온다
        checkbox.each(function(i) {
            // checkbox.parent() : checkbox의 부모는 <td>이다.
            // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
            let tr = checkbox.parent().parent().eq(i);
            let td = tr.children();

            let rowData = {};

            // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
            rowData['sgSeq'] = td.eq(1).text();
            rowData['sgGroupSeq'] = groupSeq;
            tdArr.push(rowData);
        });

        $.ajax({
            url: "${pageContext.request.contextPath}/ajaxScreenGroupDelete",
            type: "POST",
            dataType : 'json',
            contentType : "application/json; charset=utf-8",
            data : JSON.stringify(tdArr),
            success : function (response) {
                let inHtml = '';
                let html = '';
                for(let i = 0; i < response.outList.length; i++){
                    html += '<tr>';
                    html += "<td><input type='checkbox' name='insertCheck'/></td>";
                    html += "<td>"+response.outList[i].screenSeq+"</td>";
                    html += "<td>"+response.outList[i].screenName+"</td>";
                    html += '</tr>';
                }

                for(let i = 0; i < response.inList.length; i++){
                    inHtml += '<tr>';
                    inHtml += "<td><input type='checkbox' name='deleteCheck'/></td>";
                    inHtml += "<td>" + response.inList[i].sgSeq+"</td>";
                    inHtml += "<td>"+response.inList[i].screenName+"</td>";
                    if(response.inList[i].sgAuth == "RW"){
                        inHtml += "<td><input type='checkbox' name='rCheck' disabled/></td>";
                        inHtml += "<td><input type='checkbox' name='rwCheck' checked/></td>";
                    }else{
                        inHtml += "<td><input type='checkbox' name='rCheck' checked/></td>";
                        inHtml += "<td><input type='checkbox' name='rwCheck' disabled/></td>";
                    }
                    inHtml += '</tr>';
                }

                $("#notIn tr").remove();
                $("#notIn").append(html);

                $("#inBody tr").remove();
                $("#inBody").append(inHtml);
                $("#checkAllIn").prop("checked",false);
            },
            error : function (error){
                alert("error : " + error.data);
            }
        })
    });


    // checkbox 전체 체크 이벤트
    $("#checkAllIn").click(function (){
        let checked = $("#checkAllIn").is(":checked");

        if(checked) {
            $("input[name='deleteCheck']").prop("checked", true);
            $("#checkAllOut").prop("disabled", true);
        }else {
            $("input[name='deleteCheck']").prop("checked", false);
            $("#checkAllOut").prop("disabled", false);
        }
    })

    $("#checkAllOut").click(function (){
        let checked = $("#checkAllOut").is(":checked");

        if(checked){
            $("input[name='insertCheck']").prop("checked",true);
            $("#checkAllIn").prop("disabled", true);
        }else{
            $("input[name='insertCheck']").prop("checked",false);
            $("#checkAllIn").prop("disabled", false);
        }

    })

    // checkbox event
    $(document).on("click", "input[name='insertCheck']", function() {
        if($("input[name='insertCheck']").prop('checked') == true){
            $("input[name='deleteCheck']").attr("disabled", true);
            $("#checkAllIn").attr("disabled", true);
        }else{
            $("input[name='deleteCheck']").attr("disabled", false);
            $("#checkAllIn").attr("disabled", false);
        }
    })

    $(document).on("click", "input[name='deleteCheck']", function() {
        if($("input[name='deleteCheck']").prop('checked') == true){
            $("input[name='insertCheck']").attr("disabled", true);
            $("#checkAllOut").attr("disabled", true);
        }else{
            $("input[name='insertCheck']").attr("disabled", false);
            $("#checkAllOut").attr("disabled", false);
        }
    });

    function clickCheckBox(event){
        if(event.target.checked){
            $(this).prop("checked",false);
        }
    }

    $(document).on("click", "input[name='rCheck']", function() {
        if($(this).prop('checked') == true){
            $("input[name='rwCheck']").prop("disabled", true);
            $("input[name='rwCheck']").prop("checked", false);
            $("input[name='rCheck']").prop("disabled", false);
            $("input[name='rCheck']").prop("checked", true);
        }else{
            $("input[name='rwCheck']").prop("disabled", false);
            $("input[name='rwCheck']").prop("checked", true);
            $("input[name='rCheck']").prop("disabled", true);
            $("input[name='rCheck']").prop("checked", false);
        }
    });

    $(document).on("click", "input[name='rwCheck']", function() {
        if($(this).prop('checked') == true){
            $("input[name='rCheck']").prop("disabled", true);
            $("input[name='rCheck']").prop("checked", false);
            $("input[name='rwCheck']").prop("disabled", false);
            $("input[name='rwCheck']").prop("checked", true);
        }else{
            $("input[name='rCheck']").prop("disabled", false);
            $("input[name='rCheck']").prop("checked", true);
            $("input[name='rwCheck']").prop("disabled", true);
            $("input[name='rwCheck']").prop("checked", false);
        }
    });

</script>