<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>고객 목록</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  <script src="js/customer.js"></script>
  <script>
    jQuery.noConflict();
  </script>
</head>
<body>
<jsp:include page="../incl/header.jsp"/>
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">고객 목록</h1>
  </div>
</div>

<div class="row content">
  <div class="col">
    <div class="card">
      <div class="card-body">
        <table class="table">
          <thead>
          <tr>
            <th scope="col">고객 번호[cid]</th>
            <th scope="col">고객 성함</th>
            <th scope="col">고객 아이디</th>
            <th scope="col">고객 전화번호</th>
            <th scope="col"></th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="customer" items="${customerList}">
            <tr>
              <td>${customer.cid}</td>
              <td>${customer.name}</td>
              <td>${customer.id}</td>
              <td>${customer.phone}</td>
              <td>
                <button class="btn-danger" onclick="deleteCustomer(${customer.cid})">삭제</button>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script>
  const deleteCustomer = function (i){
    customerDelete(i).then(result => {
      console.log(result);
      alert(result.data.result);
      // 삭제 성공 후 페이지 새로고침
      location.reload();
    }).catch(error => {
      console.error(error);
      alert("회원 삭제 실패");
    });
  }
</script>

<jsp:include page="../incl/footer.jsp"/>
</body>
</html>