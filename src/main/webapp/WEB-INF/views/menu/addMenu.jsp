<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">메뉴 추가</h1>
    </div>
</div>

<div class="container">
    <form name="frmMemberInsert" class="form-horizontal form" enctype="multipart/form-data" action="/menu/addMenu"
          method="post"
          onsubmit="return checkForm()">
        <div class="form-group row">
            <label class="col-sm-2">메뉴이름</label>
            <div class="col-sm-3">
                <input name="name" type="text" class="form-control" placeholder="메뉴이름">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">메뉴타입</label>
            <%--            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">--%>
            <%--                메뉴 타입--%>
            <%--            </button>--%>
            &emsp;<select name="menutype" class="btn btn-secondary dropdown-toggle"
                          aria-labelledby="dropdownMenuButton1">
            <option value="camp" class="dropdown-item">캠핑용품</option>
            <option value="mealkit" class="dropdown-item">밀키트</option>
        </select>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">메뉴가격</label>
            <div class="col-sm-3">
                <input name="price" type="text" class="form-control" placeholder="메뉴가격">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">메뉴수량</label>
            <div class="col-sm-3">
                <input name="amount" type="number" class="form-control" placeholder="메뉴수량">
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 control-label">첨부파일</label>
            <div class="col-sm-8">
                <input class="form-control" type="file" name="file" onchange="readURL(this)">
            </div>
        </div>

        <div>
            <img id="preview">
        </div>

        <div class="form-group row">
            <label class="col-sm-2"></label>
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">메뉴등록</button>
                <input type="reset" class="btn btn-primary" value="취소" onclick="reset()">
            </div>
        </div>
    </form>

    <script>
        //이미지 미리보기
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('preview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview').src = "";
            }
        }

        //값 유효성검사
        const formMain = document.querySelector('.frmMemberInsert');

        function checkForm() {
            if (!formMain.name.value) {
                alert("제목를 입력하세요.");
                return false;
            }
            if (!formMain.content.value) {
                alert("내용을 입력하세요.");
                return false;
            }
            if (!formMain.content.value) {
                alert("내용을 입력하세요.");
                return false;
            }
        }


    </script>
</div>
<jsp:include page="../incl/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
