<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style>
    #nav {
        justify-content: center;
    }

    #navUl {
        justify-content: center;
    }
    .nav-link{font-size: 20px;}
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="nav">
        <ul class="navbar-nav" id="navUl">

            <li class="nav-item">
                <a class="nav-link" href="/menu/listMenu" style="color: #4CAF50">전체 상품</a>
            </li>&emsp;&emsp;

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="campingDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    캠핑용품
                </a>
                <div class="dropdown-menu" aria-labelledby="campingDropdown">
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=1">TENT</a>
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=2">TABLE</a>
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=3">CHAIR</a>
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=4">SLEEPING BAG</a>
                </div>
            </li>&emsp;
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="mealKitDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    밀키트
                </a>
                <div class="dropdown-menu" aria-labelledby="mealKitDropdown">
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=5">부대찌개</a>
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=6">마라탕</a>
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=7">떡볶이</a>
                    <a class="dropdown-item" href="/menu/getOneMenu?mid=8">볶음밥</a>
                </div>
            </li>&emsp;
            <li class="nav-item">
                <a class="nav-link" href="/customer/board/getListBoard">커뮤니티</a>
            </li>&emsp;

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="siteDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">대구 캠핑명소</a>
                <div class="dropdown-menu" aria-labelledby="siteDropdown">
                    <a class="dropdown-item" href="http://localhost:8080/site/site1">팔공산 오토캠핑장</a>
                    <a class="dropdown-item" href="http://localhost:8080/site/site2">두류 오토캠핑장</a>
                    <a class="dropdown-item" href="http://localhost:8080/site/site3">동촌유원지 캠핑장</a>
                    <a class="dropdown-item" href="http://localhost:8080/site/site4">수성못 캠핑장</a>
                </div>
            </li>

        </ul>
    </div>
</nav>