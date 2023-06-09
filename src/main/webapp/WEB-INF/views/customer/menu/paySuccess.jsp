<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 완료</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../incl/header.jsp"/>
<div class="container">
    <div class="row mt-5">
        <div class="col">
            <h1>결제 완료</h1>
            <p>결제가 성공적으로 완료되었습니다.</p>
            <table class="table">
                <thead>
                <tr>
                    <th>물건</th>
                    <th>수량</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>상품 1</td>
                    <td>2개</td>
                </tr>
                <tr>
                    <td>상품 2</td>
                    <td>1개</td>
                </tr>
                </tbody>
            </table>
            <p>총 결제금액: <span id="totalAmount">300,000원</span></p>
            <p>감사합니다!</p>
        </div>
    </div>
</div>
<jsp:include page="../../incl/footer.jsp"/>
</body>
</html>
