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
<link rel="stylesheet" href="/softleader-iii-eeit78/css/animate.css">
<script src="/softleader-iii-eeit78/scripts/jquery-2.1.3.min.js"></script>
<script src="/softleader-iii-eeit78/js/bootstrap.min.js"></script>
<script src="/softleader-iii-eeit78/scripts/jquery-easing-1.3.js"></script>
<script src="/softleader-iii-eeit78/js/wow.min.js"></script>
<script>
	new WOW().init();
</script>


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

strong {
	font-size: 36px;
}
.choosed{
color: orangered;
text-shadow: 1px 0px 1px orange;
}
@media{
marquee{width: 100%}
.forSidebar{text-align: left;
border-bottom: 1px silver solid;
margin-top: 0px;
}
}
@media ( min-width : 992px) {
marquee{width: 50%}
.forSidebar{text-align: center;
border-bottom: none;
margin-top: 62px;
}
}
</style>
</head>
<body id="body">
	<jsp:include page="../../header.jsp" />

	<div class="container" style="background-color: #f2f2f2; margin-top: 20px;">
			<div class="row" style="text-align:center; color:darkslategray;">
				<h1 style="margin-top: 30px; font-weight: bolder;">統計資料</h1>
<!-- 				<marquee scrollamount="10" id="marquee" style="font-family:DFKai-sb"></marquee> -->
				<div class="wow fadeInRight" data-wow-duration="1.5s" id="marquee"></div>
			</div>
	</div>

	<div class="container" style="margin-top: 20px">
		<div class="row ">
			<div  class="col-md-3 forSidebar">
					<div id="side-nav">
				<nav  class="navbar" role="navigation">


						<div>

							<ul class="nav nav-stacked" >
								<li><a
									href="/softleader-iii-eeit78/util/statChart_map">活動位置分布圖&nbsp<span
										class="pull-right glyphicon glyphicon-map-marker"></span></a></li>
								<li><a id="piChart">活動類型圓餅圖&nbsp<span
										class="pull-right fa fa-pie-chart"></span></a></li>
								<li><a id="barChart">年齡分布橫條圖&nbsp<span
										class="pull-right showopacity glyphicon glyphicon-align-center"></span></a></li>
							</ul>
						</div>

				</nav>
									</div>
			</div>
			<div class="col-md-9">

				<div id="distribution1" style="border-bottom: 1px silver solid">
					<h2 class="sub-header" style="font-family: Microsoft JhengHei">活動類型分布比例</h2>
					<div id="type_distribution"
						style="min-width: 310px; height: 400px; margin: 0 auto"></div>
					<br>
					<!-- 					<p>目前本站所活動類型的分布比例</p> -->
				</div>
				<div id="distribution2"
					style="margin-top: 60px; margin-bottom: 30px;">
					<h2 class="sub-header" style="font-family: Microsoft JhengHei">捐款註冊年齡分布</h2>
					<div id="age_distribution"
						style="min-width: 310px; height: 400px; margin: 0 auto"></div>
					<br>
					<!-- 					<p>目前本站所有捐款會員的年齡層分布</p> -->
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
// 	$('text[text-anchor="end"]').hide();
	
	data = JSON.parse(data);
	$('#marquee').html("<p style='font-size:20px'>目前有<strong>" + data.onlineCount +"</strong>人在線上"
					 + "&nbsp&nbsp共有<strong>" + data.giverCount +"</strong>個Givers和<strong>"+ data.raiserCount +"</strong>個公益團體為了公益努力</p>");
	if ("${param.chart}" == 'pi') {
		moveTo({data : {to : $('#distribution1')}})
		$('#piChart').addClass('choosed');
	} else if ("${param.chart}" == 'bar') {
		moveTo({data : {to : $('#distribution2')}})
		$('#barChart').addClass('choosed');
	} else{};
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
	
// 	var sum = 0;
// 	for(var i in type){
// 		sum += type[i];
// 		console.log(i);
// 		console.log(type[i]);
// 	}
	
	
    Highcharts.getOptions().plotOptions.pie.colors = (function () {
        var colors = [],
            base = Highcharts.getOptions().colors[0],
            i;

        for (i = 0; i < 10; i += 1) {
            colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
        }
        return colors;
    }());

    // Build the chart
    $('#type_distribution').highcharts({
        chart: {
        	backgroundColor: '#FFFCEC',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },credits:{
    		enabled : false
    	},
        title: {
            text: '',
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
            data: keys
            	
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
            	backgroundColor: '#FFFCEC',
                type: 'bar'
            },credits:{
        		enabled : false
        	},
            title: {
                text: '',
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


// 	function test() {
// 		console.log($('#distribution1').offset().top);
// 		$(html).scrollTop(
// 				$('#distribution1').offset().top
// 						- $('#header-wrapper').height());
// 	}


//smooth move to chart
	$('#piChart').on('click', {
		to : $('#distribution1')
	}, moveTo);
	$('#barChart').on('click', {
		to : $('#distribution2')
	}, moveTo);
	function moveTo(event) {
		var to = event.data.to;
		var top = $(to).offset().top - $('#header-wrapper').height()-10;
		$('html, body').animate({
			scrollTop : top
		}, 600, 'easeInOutExpo');
		changeChoosed(this);
	}

//change sidebar color when move to somewhere
	function changeChoosed(a) {
		$('.choosed').removeClass('choosed');
		$(a).addClass('choosed');
	}
	
	$(window).scroll(function() {
		if ($(window).scrollTop() > 100 && $(window).width() >600) {
			var sideTop = $('#header-wrapper').height()+40;
			$('#side-nav').stop().css({ top: sideTop , position: 'fixed'});
			} else {
			$('#side-nav').stop().css({ top: 'auto' , position: 'relative'});
				}

		});
	
	
</script>



</html>