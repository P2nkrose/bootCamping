<%--
  Created by IntelliJ IDEA.
  User: toyto
  Date: 2023-05-01
  Time: 오후 2:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../incl/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>


    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?apikey=API_KEY_HERE"></script>
    <script>
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullAddr = ''; // 최종 주소 변수
                    var extraAddr = ''; // 조합형 주소 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        fullAddr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        fullAddr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                    if (data.userSelectedType === 'R') {
                        //법정동명이 있을 경우 추가한다.
                        if (data.bname !== '') {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있을 경우 추가한다.
                        if (data.buildingName !== '') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                        fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
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
    <%-- //// 주소관련 ////--%>


    <%-- 입력 폼관련--%>
    <script type="text/javascript">
        let idCheckDuplicated = "check";
        function checkForm() {
            const formObj = document.frmMemberInsert;
            console.log(formObj)
            if (formObj.id.value === "") {
                alert("아이디를 입력해주세요.");
                return false;
            }

            if(idCheckDuplicated === "check"){
                alert("아이디 중복확인을 해주세요");
                return false;
            }

            if(idCheckDuplicated === "true"){
                alert("아이디가 이미 존재합니다");
                return false;
            }

            if (formObj.passwd.value === "") {
                alert("비밀번호를 입력해주세요.");
                return false;
            }

            if (formObj.passwd_confirm.value === "") {
                alert("비밀번호 확인을 입력해주세요.");
                return false;
            }

            if (formObj.passwd.value !== formObj.passwd_confirm.value) {
                alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }

            if (formObj.name.value === "") {
                alert("성명을 입력해주세요.");
                return false;
            }
            if (formObj.birthyy.value === "") {
                alert("생년월일을 입력해주세요.");
                return false;
            }
            if (formObj.birthmm.value === "월") {
                alert("생년월일을 입력해주세요.");
                return false;
            }
            if (formObj.birthdd.value === "") {
                alert("생년월일을 입력해주세요.");
                return false;
            }
            if (formObj.phone.value === "") {
                alert("전화번호를 입력해주세요.");
                return false;
            }
            if (formObj.zipcode.value === "") {
                alert("우편번호를 입력해주세요.");
                return false;
            }
            if (formObj.address1.value === "") {
                alert("주소를 입력해주세요.");
                return false;
            }
            if (formObj.address2.value === "") {
                alert("상세주소를 입력해주세요.");
                return false;
            }

            if (formObj.email.value === "") {
                alert("이메일을 입력해주세요.");
                return false;
            }

            if (formObj.emailconfirm.value === "") {
                alert("이메일 인증번호를 입력해주세요.");
                return false;
            }
            if (emconfirmchk === false) {
                alert("인증번호가 틀렸습니다.");
                return false;
            }

            // 필수 입력 항목을 모두 채웠을 경우에만 true 반환
            return true;
        }
    </script>
</head>

<%--주소 관련--%>

<%-- //// 입력 폼관련 ////--%>

<body>
<div class="container">
    <div class="card m-2">
        <div class="card-body">
            <h4 class="card-title">회원가입</h4>
            <form name="frmMemberInsert" class="form-horizontal form" action="/addCustomer" method="post">
                <div class="form-group row">
                    <label class="col-sm-2">아이디</label>
                    <div class="col-sm-3">
                        <input name="id" type="text" class="form-control" placeholder="id"><span class="idCheck"></span>
                        <br><input type="button" name="btnIsDuplication_ajax" value="아이디 중복 확인">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">비밀번호</label>
                    <div class="col-sm-3">
                        <input name="passwd" type="text" class="form-control" placeholder="passwd">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">비밀번호확인</label>
                    <div class="col-sm-3">
                        <input name="passwd_confirm" type="text" class="form-control" placeholder="password confirm">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">성명</label>
                    <div class="col-sm-3">
                        <input name="name" type="text" class="form-control" placeholder="name">
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">생일</label>
                    <input type="hidden" name="birth" id="birth">
                    <div class="col-sm-4">
                        <input type="text" name="birthyy" maxlength="4" placeholder="년(4글자)" size="6" class="birthyy">
                        <select name="birthmm" class="birthmm">
                            <option value="월">월</option>
                            <option value="01">1</option>
                            <option value="02">2</option>
                            <option value="03">3</option>
                            <option value="04">4</option>
                            <option value="05">5</option>
                            <option value="06">6</option>
                            <option value="07">7</option>
                            <option value="08">8</option>
                            <option value="09">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select> <input type="text" name="birthdd" class="birthdd" maxlength="2" placeholder="일" size="4">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">전화번호</label>
                    <div class="col-sm-3">
                        <input name="phone" type="text" class="form-control" placeholder="phone">
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">우편번호</label>
                    <div class="col-sm-2">
                        <input name="zipcode" type="text" class="form-control" placeholder="zipcode" readonly>
                        <input type="button" value="우편번호검색" onclick="execDaumPostcode()">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2">주소1</label>
                    <div class="col-sm-5">
                        <input name="address1" type="text" class="form-control" placeholder="address1" readonly>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">주소2</label>
                    <div class="col-sm-5">
                        <input name="address2" type="text" class="form-control" placeholder="address2">
                    </div>
                </div>

                <div class="form-group last mb-4 email_input">
                    <label for="email" id="mailTxt">이메일을 입력해주세요</label>
                    <input type="text" class="form-control" name="email" id="email" required>
                </div>
                <!-- 이메일 인증번호 -->
                <button class="btn btn-outline-primary" type="button" id="checkEmail" required>인증번호</button>
                <div class="form-group last mb-4 check_input">
                    <label for="emailconfirm" id="emailconfirmTxt">인증번호를 입력해주세요</label>
                    <input name="emailconfirm" type="text" class="form-control" id="emailconfirm" required>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2"></label>
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-primary insertBtn">회원가입</button>
                        <input type="reset" class="btn btn-primary" value="초기화" onclick="reset()">
                    </div>
                </div>
            </form>

            <script>
                const frmMemberInsert = document.frmMemberInsert;
                const xhr = new XMLHttpRequest();
                const ajaxbtnIsDuplication = document.querySelector('input[name=btnIsDuplication_ajax]');
                ajaxbtnIsDuplication.addEventListener('click', function () {
                    const id = frmMemberInsert.id.value;
                    const idCheck = document.querySelector('.idCheck');
                    xhr.open('GET', 'ajaxIdCheck?id=' + id,true);
                    xhr.send();
                    xhr.onreadystatechange = () => {

                        if (xhr.readyState !== XMLHttpRequest.DONE) return;

                        if (xhr.status === 200) {
                            console.log(xhr.response);
                            const json = JSON.parse(xhr.response);
                            if (json.result === 'true') {
                                idCheck.style.color = 'red';
                                idCheck.innerHTML = "동일한 아이디가 있습니다.";
                                idCheckDuplicated = "true";
                                // alert('동일한 아이디가 있습니다.');
                            } else {
                                idCheck.style.color = 'black';
                                idCheck.innerHTML = "동일한 아이디가 없습니다.";
                                idCheckDuplicated = "false";
                                // alert('동일한아이디가 없습니다.');
                            }
                        } else {
                            console.error('Error', xhr.status, xhr.statusText);
                        }
                    }
                })

                const form = document.querySelector('.form');
                const insertBtn = document.querySelector('.insertBtn');
                insertBtn.addEventListener("click",function (e){
                    // e.stopPropagation();
                    // e.preventDefault();
                    var birth = document.getElementById('birth');
                    var birthyy = document.querySelector('.birthyy').value;
                    var birthmm = document.querySelector('.birthmm').value;
                    var birthdd = document.querySelector('.birthdd').value;

                    birth.value = birthyy+"-"+birthmm+"-"+birthdd;
                    console.log(birth);
                    if(checkForm()){
                        frmMemberInsert.submit();
                    };






                });

            </script>

        </div>
    </div>
</div>
<%@include file="../incl/footer.jsp"%>

<script>
    // 이메일 인증번호
    var checkEmail = document.querySelector('#checkEmail');
    var memail = document.querySelector('#email');
    var memailconfirm = document.querySelector('#emailconfirm');
    var memailconfirmTxt = document.querySelector('#emailconfirmTxt');

    checkEmail.addEventListener('click', function() {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/api/mail/confirm.json');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                var data = xhr.responseText;
                alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.");
                console.log("data: " + data);
                chkEmailConfirm(data, memailconfirm, memailconfirmTxt);
            }
        };
        var email = document.frmMemberInsert.email.value;
        var params = "email=" + encodeURIComponent(email);
        xhr.send(params);
    });

    // 이메일 인증번호 체크 함수
    function chkEmailConfirm(data, memailconfirm, memailconfirmTxt) {
        memailconfirm.addEventListener('keyup', function() {
            if (data !== memailconfirm.value) {
                emconfirmchk = false;
                memailconfirmTxt.innerHTML = "<span id='emconfirmchk'>인증번호가 잘못되었습니다</span>";
                document.querySelector("#emconfirmchk").style.color = "#FA3E3E";
                document.querySelector("#emconfirmchk").style.fontWeight = "bold";
                document.querySelector("#emconfirmchk").style.fontSize = "10px";
            } else {
                emconfirmchk = true;
                memailconfirmTxt.innerHTML = "<span id='emconfirmchk'>인증번호 확인 완료</span>";
                document.querySelector("#emconfirmchk").style.color = "#0D6EFD";
                document.querySelector("#emconfirmchk").style.fontWeight = "bold";
                document.querySelector("#emconfirmchk").style.fontSize = "10px";
            }
        });
    }

</script>

</body>
</html>