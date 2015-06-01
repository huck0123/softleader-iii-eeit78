<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>統計圖表</title>

<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/softleader-iii-eeit78/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/softleader-iii-eeit78/css/giver.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>


<script src="http://code.highcharts.com/maps/highmaps.js"></script>
<script src="http://code.highcharts.com/maps/modules/exporting.js"></script>
<script src="http://code.highcharts.com/mapdata/countries/tw/tw-all.js"></script>

<style>
html, body{ height: 100%}
#city_distribution {
    min-height: 80%;  
    min-width: 310px; 
/*     max-width: 800px;  */
    margin: 0px auto; 
}

body{
/*  	background-color: #C4E1FF;  */
}
strong {
	font-size: 36px;
}
</style>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container" style="background-color: #f2f2f2; margin-top: 20px;">
			<div class="row" style="text-align:center; color:darkslategray;">
				<h1 style="margin-top: 30px; font-weight: bolder;">統計資料</h1>
				<marquee onMouseOver="this.stop()" onMouseOut="this.start()" scrollamount="10" id="marquee" style="font-family:DFKai-sb"></marquee>
			</div>
	</div>

	<div class="container" style="margin-top: 20px">
		<div class="row">
			<div class="col-md-3" >
			<h3 class="visible-md-block visible-lg-block">&nbsp</h3>
				<ul class="nav nav-sidebar">
					<li style="background-color: #FFFFB9;">
					<li style="background-color:#FFFFB9;">
						<a href="/softleader-iii-eeit78/util/statChart_map">地圖分布</a>
					</li>
						<a href="/softleader-iii-eeit78/util/statChart">圖表</a>
					</li>
				</ul>
			</div>
			<div class="col-md-9">
				
				<div id="distribution1">
					<h3 class="sub-header" style="font-family:Microsoft JhengHei">活動位置分布圖</h3>
					<div id="city_distribution"></div><br>
				</div>
				
			</div>
		</div>
	</div>
	

	
	<jsp:include page="/footer.jsp" />
</body>
<script>
	
</script>

<script>

$.post("/softleader-iii-eeit78/util/utilAction!util", taiwan);

// 地圖
function taiwan(city) {
	city = JSON.parse(city).cityCount;
	
    // Prepare demo data
    var data = [
        {
            "hc-key": "tw-pt",
            "value": city.屏東縣
        },
        {
            "hc-key": "tw-tn",
            "value": city.台南市
        },
        {
            "hc-key": "tw-il",
            "value": city.宜蘭縣
        },
        {
            "hc-key": "tw-ch",
            "value": city.嘉義縣
        },
        {
            "hc-key": "tw-tt",
            "value": city.台東縣
        },
        {
            "hc-key": "tw-ph",
            "value": city.澎湖縣
        },
        {
            "hc-key": "tw-km",
            "value": city.金門縣
        },
        {
            "hc-key": "tw-lk",
            "value": city.連江縣
        },
        {
            "hc-key": "tw-tw",
            "value": city.台北市
        },
        {
            "hc-key": "tw-cs",
            "value": city.嘉義市
        },
        {
            "hc-key": "tw-th",
            "value": city.台中市
        },
        {
            "hc-key": "tw-yl",
            "value": city.雲林縣
        },
        {
            "hc-key": "tw-kh",
            "value": city.高雄市
        },
        {
            "hc-key": "tw-tp",
            "value": city.新北市
        },
        {
            "hc-key": "tw-hs",
            "value": city.新竹市
        },
        {
            "hc-key": "tw-hh",
            "value": city.新竹縣
        },
        {
            "hc-key": "tw-cl",
            "value": city.基隆市
        },
        {
            "hc-key": "tw-ml",
            "value": city.苗栗縣
        },
        {
            "hc-key": "tw-ty",
            "value": city.桃園市
        },
        {
            "hc-key": "tw-cg",
            "value": city.彰化縣
        },
        {
            "hc-key": "tw-hl",
            "value": city.花蓮縣
        },
        {
            "hc-key": "tw-nt",
            "value": city.南投縣
        }
    ];

    // Initiate the chart
    $('#city_distribution').highcharts('Map', {
		chart : {
			backgroundColor: '#D2E9FF'
		},
    	
        title : {
            text : '',
            style : { "color": "red", "fontSize": "20px" }
        },

//         subtitle : {
//             text : 'Source map: <a href="http://code.highcharts.com/mapdata/countries/tw/tw-all.js">Taiwan</a>'
//         },

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        colorAxis: {
            min: 0
        },

        series : [{
            data : data,
            mapData: Highcharts.maps['countries/tw/tw-all'],
            joinBy: 'hc-key',
//             name: 'Random data',
            states: {
                hover: {
                    color: '#BADA55'
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }]
    });
}
//所有圖形載入點
function onload(data){
	getType(data);
	ageDistribution(data);
	$('text[text-anchor="end"]').hide();
	
	data = JSON.parse(data);
	$('#marquee').html("<p style='font-size:24px'>目前有<strong>" + data.onlineCount +"</strong>人在線上"
					 + "&nbsp&nbsp共有<strong>" + data.giverCount +"</strong>個Givers和<strong>"+ data.raiserCount +"</strong>個公益團體為了公益努力</p>");
}
</script>



</html>