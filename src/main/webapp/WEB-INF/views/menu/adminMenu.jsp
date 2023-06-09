<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<div class="jumbotron">
    <div class="container">
        <h1 class="display-3">메뉴 목록</h1>
    </div>
</div>

<div class="row content">
    <div class="col">
        <div class="card">
            <%--            <div class="card-header">--%>
            <%--                Featured--%>
            <%--                <button type="button" class="btn btn-primary btn-sm">total : ${menuDTO.total}</button>--%>
            <%--            </div>--%>
            <div class="card-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">메뉴번호 [mid]</th>
                        <th scope="col">메뉴이름</th>
                        <th scope="col">메뉴가격</th>
                        <th scope="col">메뉴타입</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="d" items="${dto2}">
                        <tr>
                                <%--                            <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none"--%>
                                <%--                                   data-tno="${d.mid}">--%>
                                <%--                                <c:out value="${d.name}"/>--%>
                                <%--                            </a></td>--%>
                                    <td>${d.mid}</td>
                                    <td><a href="/menu/modifyMenu?mid=${d.mid}">${d.name}</a></td>
                            <td>${d.price}</td>
                                <%--                            <td>${d.dueDate}</td>--%>
                            <td>${d.menutype}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <jsp:include page="../incl/footer.jsp"/>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
