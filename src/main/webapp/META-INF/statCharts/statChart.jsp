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
/*  	background-color: #DFFFDF;  */
}

</style>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container-fluid" style="padding-top: 50px;">
		<div class="row">
			<div class="col-md-3 sidebar" style="padding-top: 50px;">
				<ul class="nav nav-sidebar" style="position:fixed;">
					<li style="background-color:#FFFFB9;">
						<a href="/softleader-iii-eeit78/util/statChart_map">地圖分布</a>
					</li>
					<li class="active">
						<a href="#distribution1">活動類型分布比例</a>
					</li>
					<li>
						<a href="#distribution2">捐款註冊年齡分布</a>
					</li>
				</ul>
			</div>
			<div class="col-md-9">
				<h1 class="page-header">統計圖表</h1>
				<div id="distribution1">
					<h2 class="sub-header">活動類型分布比例</h2><br>
					<p>目前本站所活動類型分布比例，</p>
					<div id="type_distribution" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
				</div>
				<div id="distribution2" style="padding-top: 50px; padding-bottom: 50px;">
					<h2 class="sub-header">捐款註冊年齡分布</h2><br>
					<div id="age_distribution" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>
				</div>
				
			</div>
		</div>
	</div>
	

	
	<jsp:include page="/footer.jsp" />
</body>
<script>
	
</script>

<script>

$.post("/softleader-iii-eeit78/util/utilAction!util", onload);

//所有圖形載入點
function onload(data){
	getType(data);
	ageDistribution(data);
	$('text[text-anchor="end"]').hide();
}

//活動類型分布圖
function getType(type) {
	type = JSON.parse(type).typeCount;

	//將 object物件轉成array
	var keys = $.map( type, function( value, key ) {
	  return [[key,value]];
	});
	
	
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
        	backgroundColor: '',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '活動類型分布比例',
            style : { "color": "red", "fontSize": "20px" }
        },
        tooltip: {
            pointFormat: ': <b>{point.percentage:.1f}%</b>'
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
//             name: '活動類型',
            data: keys
            	
//             [
//                 [Object.keys(type)[0],   type[Object.keys(type)[0]]/sum],  //兒福教育
//                 [Object.keys(type)[1],   type[Object.keys(type)[1]]/sum],  //弱勢照護       
//                 [Object.keys(type)[2],   type[Object.keys(type)[2]]/sum],  //環境保護
//                 [Object.keys(type)[3],   type[Object.keys(type)[3]]/sum],  //婦幼關懷
//                 [Object.keys(type)[4],   type[Object.keys(type)[4]]/sum]   //其他類型
//             ]
        }]
    });
};

//年齡分布圖型
function ageDistribution(data) {
	data = JSON.parse(data);
	console.log(data);
	
	var maleArray = [ data.maleAgeInterval["0~9"],
	  				data.maleAgeInterval["10~19"], data.maleAgeInterval["20~29"],
	  				data.maleAgeInterval["30~39"], data.maleAgeInterval["40~49"],
	  				data.maleAgeInterval["50~59"], data.maleAgeInterval["60~69"],
	  				data.maleAgeInterval["70up"] ];

  	var femaleArray = [ data.femaleAgeInterval["0~9"],
  	   				data.femaleAgeInterval["10~19"], data.femaleAgeInterval["20~29"],
  					data.femaleAgeInterval["30~39"], data.femaleAgeInterval["40~49"],
  					data.femaleAgeInterval["50~59"], data.femaleAgeInterval["60~69"],
  					data.femaleAgeInterval["70up"] ]; 
	
	
    var categories = ['0-9', '10-19', '20-29', '30-39', '40-49',
                      '50-59', '60-69','70+ '];
    $(document).ready(function () {
        $('#age_distribution').highcharts({
            chart: {
                type: 'bar'
            },
            title: {
                text: '捐款註冊年齡分布',
                style : { "color": "red", "fontSize": "20px" }
            },
            xAxis: [{
                categories: categories,
                reversed: false,
                labels: {
                    step: 1
                }
            }, { // mirror axis on right side
                opposite: true,
                reversed: false,
                categories: categories,
                linkedTo: 0,
                labels: {
                    step: 1
                }
            }],
            yAxis: {
                title: {
                    text: null
                },
                labels: {
                    formatter: function () {
                        return (Math.abs(this.value) / 1) + '人';
                    }
                },
                min: -10,
                max: 10
            },

            tooltip: {
                formatter: function () {
                    return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                        '人數: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
                }
            },

            series: [{
                name: '男性',
                data: maleArray
            }, {
                name: '女性',
                data: femaleArray
            }]
        });
    });
};


</script>



</html>