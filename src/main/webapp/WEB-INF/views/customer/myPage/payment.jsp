<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    <title>주문 결제 BOOT CAMPING</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        #title {
            padding: 30px 0;
            display: flex;
            justify-content: center;
        }

        .card-body1 {
            width: 650px;
        }

        .card-body2 {
            width: 350px;
        }

        .card-title {
            padding: 20px 0;
        }

        #cardwrap {
            display: flex;
            justify-content: space-evenly;
        }

        #image {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            width: 200px;
            height: 200px;
            background-color: #0dcaf0;
        }

        #payment {
            padding-top: 50px;
            display: flex;
            justify-content: center;
        }

        #payment-button {
            width: 100%;
            padding: 15px;
            background-color: #3065AC;
            color: white;
            border-radius: 3px;
            font-size: 16px;
            border: none;
            margin-top: 10px
        }

    </style>
</head>
<body>
<jsp:include page="../../incl/header.jsp"/>

<div class="container">
    <h3 id="title">상품 결제하기</h3>
    <h4>상품정보</h4>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">메뉴명</th>
            <th scope="col">수량</th>
            <th scope="col">가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="items" items="${purchase}">
            <tr class="items-container">
                <td value="/img/menu/${items.filename}"><img src="/img/menu/${items.filename}" width="50px"
                                                             height="50px"></td>
                <td value="${items.mid}">${items.name}</td>
                <td value="${items.amount}"><span class="amount">${items.amount}</span></td>
                <td value="${items.price}"><span class="price">${items.price * items.amount}</span></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div id="cardwrap" style="margin-top: 50px">

        <div class="card">
            <div class="card-body card-body1">
                <h4 class="card-title">배송지 정보</h4>
                <br>
                <div class="form-group row">
                    <label class="col-sm-3">주문자 이름</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="name" value="${customer.name}" placeholder="NAME"
                               id="name">
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-3">전화번호</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="phone" value="${customer.phone}"
                               placeholder="PHONE" id="phone">
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-3">주소</label>
                    <div class="col-sm-9">
                        <input name="address1" type="text" class="form-control" value="${customer.address1}"
                               placeholder="주소">
                        <input name="address2" type="text" class="form-control" value="${customer.address2}"
                               placeholder="세부주소">
                    </div>
                </div>
                <br>
                <div class="form-group row">
                    <label class="col-sm-3">요청사항</label>
                    <div class="col-sm-9">
                        <input name="request" type="text" class="form-control" placeholder="요청사항을 직접 입력합니다.">
                    </div>
                </div>

            </div>
        </div>


<%--        <div class="card">--%>
<%--            <div class="card-body card-body2">--%>
<%--                <h4 class="card-title">개별 상세내역</h4>--%>

<%--                <div id="image"><img src="" class="item_img" style="width: 200px; height: 200px"></div>--%>
<%--                <br>--%>

<%--                <div class="form-group row">--%>
<%--                    <label class="col-sm-3">메뉴명</label>--%>
<%--                    <div class="col-sm-8">--%>
<%--                        <input class="items_name form-control" type="text" value="---" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label class="col-sm-3">수량</label>--%>
<%--                    <div class="col-sm-8">--%>
<%--                        <input class="items_amount form-control" type="text" value="---" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="form-group row">--%>
<%--                    <label class="col-sm-3">가격</label>--%>
<%--                    <div class="col-sm-8">--%>
<%--                        <input class="items_total_price form-control" type="text" value="---" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

    </div>

    <div class="form-group row" style="margin: 50px auto">
        <label class="col-sm-3">전체 결제 가격</label>
        <div class="col-sm-9">
            <input class="total_price form-control" type="text" value="${totalprice}" readonly>
        </div>
    </div>

    <%--    <!-- 결제 방법 영역-->--%>
    <%--    <div id="payment-method"></div>--%>
    <%--    <div id="agreement"></div>--%>

    <%--    <!-- 결제 버튼 -->--%>
    <form>
        <input type="hidden" value="">
    </form>
    <button id="payment-button" onclick="redirectToOtherPage()">결제하기</button>

    <script>
        let totalprice = 0;
            document.querySelectorAll(".price").forEach(p => {
            totalprice = totalprice + parseInt(p.innerText);
            document.querySelector(".total_price").value = totalprice;
        })

        function redirectToOtherPage() {
            window.location.href = "/customer/menu/tossPayment";
        }

        const items_img = document.querySelector(".item_img");
        const items_name = document.querySelector(".items_name");
        const items_amount = document.querySelector(".items_amount");
        const items_total_price = document.querySelector(".items_total_price");



        const item_tr = document.querySelectorAll(".items-container");
        item_tr.forEach(a => {
            a.addEventListener("click", function (e) {
                const clickedRow = e.target.closest("tr");
                const imgCell = clickedRow.querySelector("td:nth-child(1) img");
                const nameCell = clickedRow.querySelector("td:nth-child(2)");
                const amountCell = clickedRow.querySelector("td:nth-child(3)");
                const priceCell = clickedRow.querySelector("td:nth-child(4)");

                items_img.src = imgCell.src;
                console.log(items_img);
                items_name.value = nameCell.textContent;
                items_amount.value = amountCell.textContent;
                items_total_price.value = priceCell.textContent;


            })

        })

        let total_price = 0;
        let amount = document.querySelectorAll('.amount');
        let prices = document.querySelectorAll('.price');
        prices.forEach(b=>{
            amount.forEach(b=>{
                prices += b.textContent * b.textContent;
            })
        })
        console.log(prices);


    </script>
    <%--    <script>--%>
    <%--        // ------ 클라이언트 키로 객체 초기화 --------%>
    <%--        var clientKey = 'test_ck_Z0RnYX2w532N6xLoLxk3NeyqApQE'--%>
    <%--        var tossPayments = TossPayments(clientKey)--%>

    <%--        // ------ 결제창 띄우기 --------%>
    <%--        tossPayments.requestPayment('카드', { // 결제수단 파라미터 (카드, 계좌이체, 가상계좌, 휴대폰 등)--%>
    <%--            // 결제 정보 파라미터--%>
    <%--            // 더 많은 결제 정보 파라미터는 결제창 Javascript SDK에서 확인하세요.--%>
    <%--            // https://docs.tosspayments.com/reference/js-sdk--%>
    <%--            amount: 100, // 결제 금액--%>
    <%--            orderId: 'nCEzwBvO0dOU7OnoNEeaM', // 주문 ID(주문 ID는 상점에서 직접 만들어주세요.)--%>
    <%--            orderName: '테스트 결제', // 주문명--%>
    <%--            customerName: '김토스', // 구매자 이름--%>
    <%--            successUrl: 'http://localhost:8080/customer/menu/paySuccess', // 결제 성공 시 이동할 페이지(이 주소는 예시입니다. 상점에서 직접 만들어주세요.)--%>
    <%--            failUrl: 'https://localhost:8080/customer/menu/payment', // 결제 실패 시 이동할 페이지(이 주소는 예시입니다. 상점에서 직접 만들어주세요.)--%>
    <%--        })--%>
    <%--                // ------결제창을 띄울 수 없는 에러 처리 --------%>
    <%--                // 메서드 실행에 실패해서 reject 된 에러를 처리하는 블록입니다.--%>
    <%--                // 결제창에서 발생할 수 있는 에러를 확인하세요.--%>
    <%--                // https://docs.tosspayments.com/reference/error-codes#결제창공통-sdk-에러--%>
    <%--                .catch(function (error) {--%>
    <%--                    if (error.code === 'USER_CANCEL') {--%>
    <%--                        // 결제 고객이 결제창을 닫았을 때 에러 처리--%>
    <%--                    } else if (error.code === 'INVALID_CARD_COMPANY') {--%>
    <%--                        // 유효하지 않은 카드 코드에 대한 에러 처리--%>
    <%--                    }--%>
    <%--                });--%>
    <%--    </script>--%>
</div>


<jsp:include page="../../incl/footer.jsp"/>
</body>
</html>