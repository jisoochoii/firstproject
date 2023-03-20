<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="panel-title">썸네일 게시글 수정 및 삭제</h4>
    </div>
    <div class="panel-body">
        <form id="forms" method="post" action="${pageContext.request.contextPath}/tnbUpdate" enctype="multipart/form-data">
            <div class="form-group">
                <label for="tnbTitle" class="text-primary">게시글 제목</label>
                <input type="text" class="form-control" id="tnbTitle" name="tnbTitle" value="${tnbList.tnbTitle}">
            </div>
            <div class="form-group">
                <input type="file" name="files" id="tnbImage" accept="image/jpeg, image/png, image/gif">
                <input type="hidden" name="tnbImagePath" value="${tnbList.tnbImagePath}">
            </div>
            <div class="form-group">
                <label for="summernote" class="text-primary">게시글 내용</label>
                <textarea name="tnbContent" id="summernote" class="summernote">${tnbList.tnbContent}
                </textarea>
            </div>
            <hr clas="sidebar-divider">
            <input type="hidden" name="tnbRegi" value="${loginInfo.userSeq}">
            <input type="hidden" name="tnbEditor" value="${loginInfo.userSeq}">
            <input type="hidden" name="tnbSeq" value="${tnbList.tnbSeq}">
            <div>
                <a id="list" class="btn btn-warning bg-warning" href="${pageContext.request.contextPath}/tnb">리스트</a>

                <button id="cancel" type="reset" class="btn btn-danger bg-danger">취소</button>
                <button id="deleteBtn" class="btn btn-success bg-success">삭제</button>
                <button id="submitBtn" class="btn btn-primary bg-primary">수정</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.summernote').summernote({
            height:200,
            lang:"ko-KR"
        });
    });

    $("#deleteBtn").on("click", function (e){
        $("#forms").attr("action", "${pageContext.request.contextPath}/tnbDel");
        $("#forms").submit();
    })
</script>
