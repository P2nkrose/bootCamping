<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin Page</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Core theme CSS -->
    <link href="/admin/css/styles.css" rel="stylesheet">
</head>

<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="border-end bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading border-bottom bg-light">
            <a href="/admin/index" class="navbar-brand">Admin</a>
        </div>
        <div class="list-group list-group-flush">
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/menu/addMenu">메뉴 추가</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/menu/adminMenu">메뉴 수정 및 삭제</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="listCustomer">회원 목록 관리</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">게시물 관리</a>
            <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">기타</a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page content wrapper -->
    <div id="page-content-wrapper">
        <!-- Top navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
            <div class="container-fluid">
                <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                        <c:if test="${admin != null}">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">${admin.id}님 반갑습니다.</a>
                            </li>
                            <li>
                                <a class="nav-link" href="../">메인페이지로</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- /Top navigation -->

        <!-- Page content -->
        <div class="container-fluid">
            <h1 class="mt-4">관리자페이지</h1><br>
            <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed
                on larger screens. When toggled using the button below, the menu will change.</p>
            <p>
                Make sure to keep all page content within the
                <code>#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an
                element with the
                <code>#sidebarToggle</code> ID which will toggle the menu when clicked.
            </p>
        </div>
        <!-- /Page content -->
    </div>
    <!-- /#page-content-wrapper -->
</div>
<!-- /#wrapper -->

<!-- Bootstrap core JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS -->
<script src="js/scripts.js"></script>
</body>

</html>