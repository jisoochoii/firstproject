<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="title">공지사항 작성</h4>
    </div>
    <div class="panel-body ">
        <form method="post" action="${pageContext.request.contextPath}/fbInsert">
            <div class="form-group">
                <label for="fbTitle" class="text-primary">공지사항 제목</label>
                <input type="text" class="form-control" id="fbTitle" name="fbTitle" placeholder="제목을 입력해주세요">
            </div>
            <div class="form-group">
                <label for="summernote" class="text-primary">공지사항 내용</label>
                <textarea name="fbContent" id="summernote" class="summernote">
                        </textarea>
            </div>
            <hr clas="sidebar-divider">
            <input type="hidden" name="fbRegi" value="${loginInfo.userSeq}">
            <input type="hidden" name="fbEditor" value="${loginInfo.userSeq}">
            <div>
                <a id="list" class="btn btn-warning bg-warning" href="${pageContext.request.contextPath}/">리스트</a>
                <button id="cancel" type="reset" class="btn btn-danger bg-danger">취소</button>
                <button id="submitBtn" class="btn btn-primary bg-primary">저장</button>
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
</script>
