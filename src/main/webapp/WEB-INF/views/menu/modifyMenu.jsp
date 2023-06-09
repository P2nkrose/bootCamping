<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">메뉴 수정</h1>
    </div>
</div>

<div class="container">
    <form name="frmMemberInsert" class="form-horizontal form" action="/menu/modifyMenu" method="post"
          onsubmit="return checkForm()">
        <input type="hidden" name="mid" value="${dto.mid}">
        <div class="form-group row">
            <label class="col-sm-2">메뉴이름</label>
            <div class="col-sm-3">
                <input name="name" type="text" class="form-control" placeholder="${dto.name}">
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">메뉴타입</label>
            <%--            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">--%>
            <%--                메뉴 타입--%>
            <%--            </button>--%>
            &emsp;<select name="menutype" class="btn btn-secondary dropdown-toggle" aria-labelledby="dropdownMenuButton1">
                <option value="camp" class="dropdown-item">캠핑용품</option>
                <option value="mealkit" class="dropdown-item">밀키트</option>
            </select>
        </div>

        <div class="form-group row">
            <label class="col-sm-2">메뉴가격</label>
            <div class="col-sm-3">
                <input name="price" type="text" class="form-control" placeholder="${dto.price}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2"></label>
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">메뉴 수정</button>
                <button type="button" onclick="location.href='/menu/adminMenu'" class="btn btn-primary">취소</button>

                <button type="button" class="btn btn-danger" onclick="delMenu()">메뉴 삭제</button>

                <script>
                    function delMenu() {
                        if (confirm("해당 메뉴를 삭제하시겠습니까?")) {
                            window.location.href = "/menu/removeMenu?mid=${dto.mid}";
                        }
                    }
                </script>


            </div>

        </div>
    </form>
</div>
<jsp:include page="../incl/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
