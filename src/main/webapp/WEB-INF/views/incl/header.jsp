<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<%
    String kakaonickname = request.getParameter("kakaonickname");
%>
<style>
    * { box-sizing: border-box; }
    #ul, li { list-style: none; margin: 0; padding: 0; }

    ul {
        width: 100%;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        line-height: 50px;
        margin: 0;
    }

    li {
        margin-left: 10px;
    }

    #wrap {
        display: flex;
        justify-content: center;

    }

    #logo {
        position: absolute;
        left: 30px;
        margin-top: 10px;
    }

    a { font-size: 18px; }
</style>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <ul id="ul">
        <a href="/" id="logo"><img src="/resources/images/BootCamping.png" style="width: 200px; height: auto;"></a>
        <div id="wrap">
            <c:choose>
                <c:when test="${empty customer and empty admin}">
                    <li><a href="/customer/login">로그인</a></li>
                    <li><a href="/customer/addCustomer">회원가입</a></li>
                </c:when>
                <c:otherwise>
                    <c:if test="${not empty admin}">
                        <li style="color: white">${admin.id}님 환영합니다.</li>
                        <li><a href="/admin/index">관리자페이지</a></li>
                    </c:if>
                    <c:if test="${not empty customer}">
                        <li style="color: white">${customer.name}님 환영합니다.</li>
                        <li><a href="/customer/myPage/detailPage">마이페이지</a></li>
                    </c:if>
                    <li><a href="/customer/logout">로그아웃</a></li>

                </c:otherwise>
            </c:choose>
        </div>
    </ul>
</nav>
