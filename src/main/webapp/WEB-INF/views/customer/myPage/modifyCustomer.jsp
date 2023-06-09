<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../../incl/header.jsp"%>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <h4 class="card-title">회원정보수정</h4>
            <form action="/customer/update" method="post">
                <input type="hidden" name="cid" value="${customer.cid}">
                <div class="form-group">
                    <lavel for="id">id : </lavel>
                    <input type="text" class="form-control" value="${customer.id}" name="id" readonly id="id">
                </div>
                <c:if test="${customer.passwd != null}">
                    <div class="form-group">
                        <lavel for="passwd">passwd : </lavel>
                        <input type="password" class="form-control" name="passwd" placeholder="PASSWD" id="passwd">
                    </div>
                </c:if>

                <div class="form-group">
                    <lavel for="name">이름 : </lavel>
                    <input type="text" class="form-control" name="name" value="${customer.name}" placeholder="NAME" id="name">
                </div>
                <div class="form-group">
                    <lavel for="phone">전화번호 : </lavel>
                    <input type="text" class="form-control" name="phone" value="${customer.phone}" placeholder="PHONE" id="phone">
                </div>
                <div class="form-group">
                    <lavel for="name">우편번호 </lavel>
                    <input name="zipcode" type="text" class="form-control" placeholder="우편번호" value="${customer.zipcode}" readonly>
                    <input type="button" value="우편번호 검색" onclick="execDaumPostcode();">
                </div>
                <div class="form-group">
                    <lavel for="phone">주소 : </lavel>
                    <input name="address1" type="text" class="form-control" value="${customer.address1}"  placeholder="주소" readonly>
                </div>
                <div class="form-group">
                    <lavel for="phone">주소 : </lavel>
                    <input name="address2" type="text" class="form-control" value="${customer.address2}" placeholder="세부주소">
                </div>
                <div class="form-group">
                    <lavel for="name">생년월일 :<fmt:formatDate value="${customer.birth}" pattern="yyyy-MM-dd"/></lavel>
                </div>
                <button type="submit" class="btn btn-primary">회원정보 수정</button>
                <button type="button" class="btn btn-danger" onclick="confirmWithdrawal()">회원탈퇴</button>
            </form>
        </div>
    </div>
</div>
<%@include file="../../incl/footer.jsp"%>

<%--   우편번호--%>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                }
                else { // 사용자가 지번 주소를 선택했을 경우(J)boardid
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector('input[name=zipcode]').value = data.zonecode; //5자리 새우편번호 사용
                document.querySelector('input[name=address1]').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.querySelector('input[name=address2]').focus();
            }
        }).open();
    }
</script>
<script>
    function confirmWithdrawal() {
        if (confirm("회원탈퇴를 진행하시겠습니까?")) {
            window.location.href = "/customer/delete?cid=${customer.cid}";
        }
    }
</script>
</body>
</html>