<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="title">공지사항 수정 및 삭제</h4>
    </div>
    hello world
    <div class="panel-body ">
        <form id="forms" method="post" action="${pageContext.request.contextPath}/fbUpdate">
            <div class="form-group">
                <label for="fbTitle" class="text-primary">공지사항 제목</label>
                <input type="text"  readonly class="form-control" id="fbTitle" name="fbTitle" value="${notice.fbTitle}">
            </div>
            <div class="form-group">
                <label for="summernote" class="text-primary">공지사항 내용</label>
                <textarea name="fbContent" value="only read" readonly id="summernote" class="col-md-12">${notice.fbContent}
                </textarea>
            </div>
            <hr clas="sidebar-divider">
            <input type="hidden" name="fbSeq" value="${notice.fbSeq}">
            <div class="form-group">
                <a id="list" class="btn btn-warning bg-warning" href="${pageContext.request.contextPath}/jsNotice">리스트</a>

                <!--<button id="cancel" type="reset" class="btn btn-danger bg-danger">취소</button>
                <button id="deleteBtn" class="btn btn-success bg-success">삭제</button>
                <button id="submitBtn" class="btn btn-primary bg-primary">수정</button>
                -->
            </div>
        </form>
    </div>
</div>
<script>
    $("#deleteBtn").on("click", function (e){
        $("#forms").attr("action", "${pageContext.request.contextPath}/fbDel");
        $("#forms").submit();
    })
</script>
