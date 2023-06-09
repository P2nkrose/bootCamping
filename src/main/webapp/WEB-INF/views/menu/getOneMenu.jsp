<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <title>개별 상품 페이지</title>

    <style>
        .navbar-nav {
            justify-content: flex-start;
        }

        #allwrap {
            display: flex;
            justify-content: space-evenly;
        }

        #iteminfo {
            padding-top: 100px;
        }
    </style>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<jsp:include page="../incl/nav.jsp"/>
<div class="container-fluid">
    <div class="row">


        <!--  header end  -->
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-body">

                        <%-- 그림 --%>
                        <div id="allwrap">
                            <div id="img">
                                <img src="/img/menu/<c:out value="${dto.filename}"></c:out>" style="width: 500px; height: 500px;/>

                                <div class="input-group mb-3">
                                <div >
                                    <span class="input-group-text"> 상품명</span>
                                    <input type="text" name="name" class="form-control" value="<c:out value="${dto.name}"></c:out>" readonly>
                                </div>
                                <br>
                                <div class="input-group mb-3">
                                    <span class="input-group-text">카테고리 타입</span>
                                    <input type="text" name="menutype" class="form-control" value="<c:out value="${dto.menutype}"></c:out>" readonly>
                                </div>
                                <br>
                                <div class="input-group mb-3">
                                    <span class="input-group-text">가격</span>
                                    <input type="text" name="price" class="form-control" value="<c:out value="${dto.price}"></c:out>" readonly>
                                </div>
                                <br>

                                <form class="cart-form" method="post">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">수량</span>
                                        <input type="hidden" name="mid" value="${dto.mid}">
                                        <input type="hidden" name="cid" value="${customer.cid}">
                                        <input type="number" name="amount" class="form-control" value="1" readonly>
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">-</button>
                                            <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">+</button>
                                        </div>
                                        <button type="button" class="btn btn-primary btn-gocart">장바구니 담기</button>
                                        <button type="button" class="btn btn-secondary btn-purchase" onclick="location.href='/cart/myCart'">구매하기
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>


                        <script>
                            var quantity = 1; // 초기값 설정

                            function decreaseQuantity() {
                                var inputElement = document.getElementsByName("amount")[0];
                                if (quantity > 1) {
                                    quantity--;
                                    inputElement.value = quantity;
                                }
                            }

                            function increaseQuantity() {
                                var inputElement = document.getElementsByName("amount")[0];
                                quantity++;
                                inputElement.value = quantity;
                            }
                        </script>

                        <div class="my-4">
                            <div class="float-end">

                            </div>
                        </div>

                        <script>
                            const form = document.querySelector(".cart-form");
                            document.querySelector(".btn-gocart").addEventListener("click", function () {
                                form.method = 'post';
                                form.action = "/cart/addcart";  // 경로 수정요망
                                form.submit();
                            });
                            // document.querySelector(".btn-gocart").addEventListener("click", function () {
                            //     form.action = "/cart/myCart";  // 경로 수정요망
                            //     form.submit();
                            // });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>





<jsp:include page="../incl/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>