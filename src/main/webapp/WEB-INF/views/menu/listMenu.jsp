<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        #menu-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 30px;
            margin-top: 30px;
        }

        .menu-item {
            width: calc(33.33% - 20px);
            margin-bottom: 30px;
            text-align: center;
            background-color: rgba(255, 250, 185, 0.7);
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: box-shadow 0.3s ease-in-out;
        }

        .menu-item:hover {
            box-shadow: 0px 0px 10px 1px rgba(0, 0, 0, 0.6);
        }

        .menu-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px 5px 0 0;
        }

        .menu-title {
            margin-top: 10px;
            font-size: 20px;
            font-weight: bold;
        }

        /*.menu-description {*/
        /*    margin-top: 5px;*/
        /*    font-size: 16px;*/
        /*    color: #777;*/
        /*    height: 40px;*/
        /*    overflow: hidden;*/
        /*}*/

        .menu-price {
            margin-top: 10px;
            font-size: 20px;
            font-weight: bold;
            color: #ff5e00;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<jsp:include page="../incl/nav.jsp"/>

<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div id="menu-container">

                <c:forEach var="d" items="${dto}">
                    <div class="menu-item">
                        <a href="/menu/getOneMenu?mid=${d.mid}" class="menu-information">
                            <input type="hidden" value="${d.menutype}">
                            <img src="/img/menu/${d.filename}" alt="메뉴1" class="menu-img">
                            <h2 class="menu-title">${d.name}</h2>
                            <p class="menu-price">${d.price}</p>
                        </a>
                    </div>
                </c:forEach>

                <!-- 메뉴 추가 -->
            </div>
        </div>
    </div>

    <script>
        const menuOne = document.querySelectorAll(".menu-information");
        console.log(menuOne);

        menuOne.forEach((menu,i)=>{
            menu.addEventListener("click",()=>{

            })
        })

    </script>
    <jsp:include page="../incl/footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>