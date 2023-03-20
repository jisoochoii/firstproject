<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="panel-title">썸네일 게시글 작성</h4>
    </div>
    <div class="panel-body">
        <form id="forms" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/tnbInsert" >
            <div class="form-group">
                <label for="tnbTitle" class="text-primary">게시글 제목</label>
                <input type="text" class="form-control" id="tnbTitle" name="tnbTitle" placeholder="제목을 입력해주세요">
            </div>
            <div class="form-group">
                <input type="file" accept="image/jpeg, image/png, image/gif" name="file" id="files" >
                <input type="hidden" id="tnbImageName" name="tnbImageName">
            </div>
            <div class="form-group">
                <label for="summernote" class="text-primary">게시글 내용</label>
                <textarea name="tnbContent" id="summernote" class="summernote"></textarea>
            </div>
            <hr clas="sidebar-divider">
            <input type="hidden" name="tnbRegi" value="${loginInfo.userSeq}">
            <input type="hidden" name="tnbEditor" value="${loginInfo.userSeq}">
            <div>
                <a id="list" class="btn btn-warning bg-warning" href="${pageContext.request.contextPath}/tnb">리스트</a>
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

  $("#forms").on("submit", function (e){
      $("#tnbImageName").val($("#files").val());
      $("#forms").submit();
  });
</script>
