<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<body>
<%@ include file="../incl/header.jsp"%>
<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <h4 class="card-title">로그인</h4>
            <form action="/customer/login" method="post">
                <div class="form-group">
                    <label>id : </label><input type="text" class="form-control" placeholder="ID" name="id">
                </div>
                <div class="form-group">
                    <label>passwd : </label><input type="password" class="form-control" placeholder="passwd" name="passwd">
                </div>
                <div class="form-group form-check">
                    <label class="form-check-label"><input class="form-check-input" type="checkbox" name="remember-me">Remember me</label>
                </div>
                <button type="submit" class="btn btn-primary">로그인</button>

                <a href=${"https://kauth.kakao.com/oauth/authorize?client_id=9ece7e8bcc9e1fe9d07b28c5bcee367d&redirect_uri=http://localhost:8080/auth/kakao/callback&response_type=code"}>
                    <img src="../resources/images/kakao_login.png" width="77px" height="39px">
                </a>

            </form>

            <form action="/admin/login" method="get" class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-danger">관리자 로그인</button>
            </form>
        </div>
    </div>
</div>
<%@ include file="../incl/footer.jsp"%>
</body>
</html>