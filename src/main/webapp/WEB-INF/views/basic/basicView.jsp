<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-inverse">
  <div class="panel-heading">
    <h4 class="title">게시글 작성</h4>
  </div>
  <div class="panel-body ">
    <%--  form은 데이터를 name을 가지고 보내기 때문에 VO에 들어가 있는 이름으로 만들어서 보낸다  --%>
    <form method="post" action="${pageContext.request.contextPath}/fbInsert">
      <div class="form-group">
        <label for="fbTitle" class="text-primary">게시글 제목</label>
        <input type="text" class="form-control" id="fbTitle" name="fbTitle" placeholder="제목을 입력해주세요">
      </div>
      <div class="form-group">
        <label for="summernote" class="text-primary">게시글 내용</label>
        <textarea name="fbContent" id="summernote" class="summernote"></textarea>
      </div>
      <hr clas="sidebar-divider">
      <%--   필요한 데이터를 input type="hidden"으로 숨겨서 값을 보낸다   --%>
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
  // summernote를 만들기 위한 펑션
  $(document).ready(function() {
    $('.summernote').summernote({
      height:200,
      lang:"ko-KR"
    });
  });
</script>
