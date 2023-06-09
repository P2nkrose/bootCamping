<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>수성못 캠핑장</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

  <style>

    /*사진*/

    #site4{
      width: 700px;
      height: 500px;
      margin-left: 100px;
    }

    /*캠핑명소 타이틀*/

    h2 {
      position: relative;
      z-index: 0;
      margin-left: 100px;
    }
    h2::before {
      position: absolute;
      top: 50%;
      left: -15px;
      -webkit-transform: translateY(-50%);
      transform: translateY(-50%);
      z-index: -1;
      content: '';
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: #b2ebf2;
    }

    /*제목*/

    #siteTitle {
      position: relative;
      display: inline-block;
      padding: 0.7rem 1rem;
    }
    #siteTitle::before, #siteTitle::after {
      position: absolute;
      display: inline-block;
      content: '';
      width: 20px;
      height: 30px;
    }
    #siteTitle::before {
      top: 0px;
      left: 0px;
      border-top: 2px solid #f44336;
      border-left: 2px solid #f44336;
    }
    #siteTitle::after {
      right: 0px;
      bottom: 0px;
      border-right: 2px solid #f44336;
      border-bottom: 2px solid #f44336;
    }

    #all{
      display: flex;
    }

    #text{
      margin-left: 100px;
    }

    #add{
      color: #5c636a;
    }

    #intro{
      font-size: large;
      color: #5c636a;
    }

    #map{
      margin: 0 auto;
      margin-bottom: 30px;
    }
  </style>

  <%@include file="../incl/header.jsp"%>
  <jsp:include page="../incl/nav.jsp"/>
</head>
<body>
<br>
<br>
<h2>캠핑 명소</h2>
<br>
<br>
<div id="all">
  <div>
    <img id="site4" src="../resources/images/site4.jpg" class="img-fluid img-thumbnail" alt="수성못 캠핑장">
  </div>

  <div id="text">
    <h3 id="siteTitle">수성못 캠핑장</h3>
    <p id="add">
      &nbsp;&nbsp;&nbsp;수성동 수성길 13
    </p>
    <br>
    <br>
    <p id="intro">
      수성못은 자연의 아름다움과 낭만적인 분위기를 느낄 수 있는 최적의 장소로, <br><br>
      마치 동화 속으로 들어온 듯한 특별한 경험을 선사합니다.<br><br>
      수성못 캠핑장은 도심에서 가까운 위치에 있어 접근성이 우수하며, <br><br>
      자연 속에서의 여유로움과 휴식을 동시에 누릴 수 있는 최고의 선택입니다. <br><br>
      당신의 특별한 순간을 만들고 싶다면 수성못 캠핑장으로 떠나보는 건 어떨까요? <br><br>
      그곳에서 펼쳐지는 아름다운 풍경과 추억은 당신을 환상적인 여행으로 안내해줄 것입니다.

    </p>
  </div>
</div>
</body>
<br>
<br>
<br>
<h2 id="h2">상세 위치</h2>
<div class="card" id="map" style="width:1200px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=664e6cf3486c53e59e3bad5b550a7686"></script>
<script>
  var container = document.getElementById('map');
  var options = {
    center: new kakao.maps.LatLng(35.87139, 128.601763),
    level: 9
  };

  var map = new kakao.maps.Map(container, options);

  var markerData = [
    {
      position: new kakao.maps.LatLng(35.8390924,   128.6749278
      ), // 마커 3의 위치
      name: '수성못 캠핑장',
      description: '수성동 수성길 13'
    },
    // 필요한 만큼 더 많은 마커 정보를 추가할 수 있습니다.
  ];

  var infowindows = [];

  for (var i = 0; i < markerData.length; i++) {
    var marker = new kakao.maps.Marker({
      position: markerData[i].position
    });
    marker.setMap(map);

    var infowindow = new kakao.maps.InfoWindow({
      content: '<div style="width:150px;text-align:center;padding:6px 0;">' +
              '<strong>' + markerData[i].name + '</strong><br>' + markerData[i].description + '</div>'
    });
    infowindows.push(infowindow);

    kakao.maps.event.addListener(marker, 'click', makeClickListener(infowindow, map, marker));
  }

  function makeClickListener(infowindow, map, marker) {
    return function() {
      closeAllInfoWindows();
      infowindow.open(map, marker);
    };
  }

  function closeAllInfoWindows() {
    for (var i = 0; i < infowindows.length; i++) {
      infowindows[i].close();
    }
  }


</script>
<jsp:include page="../incl/footer.jsp"/>
</html>