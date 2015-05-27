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

<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>


<style>
#city_distribution {
    height: 500px; 
    min-width: 310px; 
    max-width: 800px; 
    margin: 0px auto; 
}

body{
 	background-color: #DFFFDF; 
}

</style>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container-fluid" style="padding-top: 50px;">
		<div class="row">
			<div class="col-md-3 sidebar">
				<ul class="nav nav-sidebar" style="background-color: #FFFFB9;">
					<li>
						<a href="/softleader-iii-eeit78/util/statChart_map">地圖分布</a>
					</li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active">
						<a href="#distribution1">活動類型分布比例</a>
					</li>
					<li>
<!-- 						<a href="#distribution2">活動類型分布比例</a> -->
					</li>
				</ul>
			</div>
			<div class="col-md-9">
				<h1 class="page-header">統計圖表</h1>
				<div id="distribution1">
					<h2 class="sub-header">活動類型分布比例</h2><br>
					<p>統計各個活動類型分布比例</p>
					<div id="type_distribution" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
				</div>
				
			</div>
		</div>
	</div>
	

	
	<jsp:include page="/footer2.jsp" />
</body>
<script>
	
</script>

<script>

$.post("/softleader-iii-eeit78/util/utilAction!util", getType);
$.post("/softleader-iii-eeit78/util/utilAction!util", function(data){
	data = JSON.parse(data);
	console.log(data);
});


function getType(type) {
	type = JSON.parse(type).typeCount;
// 	console.log(type);
// 	console.log(Object.keys(type))
// 	console.log(type[Object.keys(type)[0]])
// 	console.log(Object.keys(type).length)
	
	var sum = 0;
	for(var i in type){
		sum += type[i];
// 		console.log(i);
// 		console.log(type[i]);
	}
	
	
    // Make monochrome colors and set them as default for all pies
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            // Start out with a darkened base color (negative brighten), and end
            // up with a much brighter color
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    $('#type_distribution').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '活動類型分布比例',
            style : { "color": "red", "fontSize": "20px" }
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: '活動類型',
            data: [
                [Object.keys(type)[0],   type[Object.keys(type)[0]]/sum],  //兒福教育
                [Object.keys(type)[1],   type[Object.keys(type)[1]]/sum],  //弱勢照護       
                [Object.keys(type)[2],   type[Object.keys(type)[2]]/sum],  //環境保護
                [Object.keys(type)[3],   type[Object.keys(type)[3]]/sum],  //婦幼關懷
                [Object.keys(type)[4],   type[Object.keys(type)[4]]/sum]   //其他類型
            ]
        }]
    });
};


</script>



</html>