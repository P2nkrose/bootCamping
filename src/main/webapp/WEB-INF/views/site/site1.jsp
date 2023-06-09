<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>팔공산 오토캠핑장</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <style>

        /*사진*/

        #site1{
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
        <img id="site1" src="../resources/images/site1.jpg" class="img-fluid img-thumbnail" alt="팔공산캠핑장">
    </div>

    <div id="text">
        <h3 id="siteTitle">팔공산 오토캠핑장</h3>
        <p id="add">
            &nbsp;&nbsp;&nbsp;가산면 팔공길 41
        </p>
        <br>
        <br>
        <p id="intro">
            팔공산 오토캠핑장은 아름다운 자연환경으로 둘러싸여 있어 <br><br>
            자연 속에서의 휴식과 여유로운 시간을 즐길 수 있습니다. <br><br>
            다양한 시설과 편의시설을 갖추고 있어 편안하고 편리한 캠핑<br><br>
            안전 및 보안 시설로 안심하고 캠핑을 즐길 수 있습니다. <br><br>
            가족과 친구들과 함께 소중한 시간을 보낼 수 있는 장소입니다. <br><br>
            팔공산 오토캠핑장에서, 일상에 지친 당신에게 힐링을 선물합니다.

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
            position: new kakao.maps.LatLng(35.9650709,   128.5688411

            ), // 마커 1의 위치
            name: '팔공산 오토캠핑장',
            description: '가산면 팔공길 41'
        }
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