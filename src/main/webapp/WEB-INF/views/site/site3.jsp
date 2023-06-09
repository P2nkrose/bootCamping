<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>동촌유원지 캠핑장</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <style>

        /*사진*/

        #site3{
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
        <img id="site3" src="../resources/images/site3.jpg" class="img-fluid img-thumbnail" alt="동촌유원지 캠핑장">
    </div>

    <div id="text">
        <h3 id="siteTitle">동촌유원지 캠핑장</h3>
        <p id="add">
            &nbsp;&nbsp;&nbsp;동촌동 동촌길 63
        </p>
        <br>
        <br>
        <p id="intro">
            동촌유원지 캠핑장은 자연과 문화를 조화롭게 담아내어 다양한 즐길 거리를 제공합니다. <br><br>
            특히 봄과 가을에는 아름다운 꽃과 단풍으로 인기를 끌며,  <br><br>
            가족이나 연인들과 함께 예쁜 피크닉과 캠핑을 즐길 수 있습니다.<br><br>
            대구 동촌유원지는 자연과 문화를 경험하고 즐길 수 있는 곳으로, <br><br>
            가족이나 연인, 친구들과 함께 방문하면 즐거운 추억을 만들 수 있습니다. <br><br>
            대구를 방문하는 여행자라면 반드시 추천하는 관광 명소 중 하나입니다.
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
            position: new kakao.maps.LatLng(35.8989085,   128.6587916), // 마커 4의 위치
            name: '동촌유원지 캠핑장',
            description: '동촌동 동촌길 63'
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
