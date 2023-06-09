<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../incl/header.jsp"%>
<html>
<head>
    <title>BOOT CAMPING</title>
    <style>
        #detailNav {
            display: flex;
            justify-content: center;
        }

        .logo {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 1000px;
            height: 300px; /* 그림의 크기를 조정 */
            background-image: url("/resources/images/logo.png");
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
        }

        /* 네비게이션 스타일 */
        #detailNav {
            list-style: none;
            padding: 0;
            margin: 40px 0; /* 버튼 간격을 조정 */
            display: flex;
            justify-content: center;
        }

        #detailNav li {
            margin: 0 40px; /* 버튼 간격을 조정 */
        }

        #detailNav li a {
            display: inline-block;
            padding: 15px 30px; /* 버튼 크기를 조정 */
            text-align: center;
            text-decoration: none;
            background-color: #57c280; /* 초록색 계열의 배경색 */
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        #detailNav li a:hover {
            background-color: #3a9d5d; /* 마우스 오버 시 더 진한 초록색 */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo"></div>
    <nav>
        <ul id="detailNav">
            <li><a href="/customer/myPage/cart">장바구니</a></li>
            <li><a href="/customer/myPage/modifyCustomer">회원정보 수정</a></li>
            <li><a href="#">결제목록</a></li>
        </ul>
    </nav>
</div>
<%@include file="../../incl/footer.jsp"%>
</body>
</html>