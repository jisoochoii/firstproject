<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-inverse">
    <div class="panel-heading">
        <h4 class="title">클레임 작성</h4>
    </div>
    <div class="panel-body ">
        <form id="forms" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/claimInsert">
            <div class="form-group">
                <label for="claReason" class="text-primary">클레임 사유</label>
                <div>
                    <select name="claReason" id="claReason">
                                                            <option value="">:선택:</option>

                                                                <option value="0001">오주문</option>

                                                                <option value="0002">오수주</option>

                                                                <option value="0003">미배송/오배송</option>

                                                                <option value="0005">상품불만</option>

                                                                <option value="0006">배송서비스불만</option>

                                                                <option value="0007">기타</option>

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="claTitle" class="text-primary">클레임 제목</label>
                <input type="text" class="form-control" id="claTitle" name="claTitle" placeholder="제목을 입력해주세요">
            </div>
            <div class="form-group">
                <input type="file" accept="image/jpeg, image/png, image/gif" name="file" id="files" >
                <input type="hidden" id="claImageName" name="claImageName">
            </div>
            <div class="form-group">
                <label for="summernote" class="text-primary">클레임 내용</label>
                <textarea name="claContent" id="summernote" class="summernote">
                        </textarea>
            </div>
            <hr clas="sidebar-divider">
            <div>
                <a id="list" class="btn btn-warning bg-warning" href="${pageContext.request.contextPath}/claimBoard">리스트</a>
                <button id="cancel" type="reset" class="btn btn-danger bg-danger">취소</button>
                <button id="submitBtn" type="submit" class="btn btn-primary bg-primary">저장</button>
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
