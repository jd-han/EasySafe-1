<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>나의 검색어</title>
<!-- d3 스크립트 임포트 -->
<script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
<style type="text/css">
	.node {
	  stroke-width: 1.5px;
	}
	.node:hover circle {
	  fill: grey !important;
	}
	
	text {
	  font: 18px 'Open Sans', sans-serif;;
	  text-anchor: middle;
	  pointer-events: none;
	  fill: white;
	}
	circle {
	  fill: #ccc;
	  stroke: white ;
	  stroke-width: 2px;  
	}
	.title{
		position: fixed;
		top : 52px;
		border: 25px solid transparent !important;
		border-image: url(${pageContext.request.contextPath}/resources/media/img/bluesquare.png) 50 stretch !important;
	}
	.blueborder{
		position: fixed;
		border: 10px solid transparent !important;
		border-image: url(${pageContext.request.contextPath}/resources/media/img/bluesquare.png) 50 stretch !important;
	}
	.resultList{
		position: fixed;
		left: 1100px;
		top: 160px;
		height: 600px;
		overflow: auto;
		text-align: center;
	}
	svg{
		/* border: 20px solid transparent !important;
		border-image: url(${pageContext.request.contextPath}/resources/media/img/frameborder.png) 20 round !important; */
		margin-top: 50px;
		width: 100%;
	}
	.search{
		position: absolute;		
		text-align: center;
		height: 100px;
		line-height: 100px;
		font-size: 50px;
		background-color: white;
		border-radius: 10px;
		z-index: 9999;
	}
	.keywords{
		cursor: pointer;
		background: transparent !important;
		border: 10px solid transparent !important;
		border-image: url(${pageContext.request.contextPath}/resources/media/img/woodborder.png) 40 stretch !important;
		padding: 0 0 0 0 !important;
	}
	.fadeOn{
		background-color: skyblue !important;
		transition: 0.5s;
	}
	.pan{
		background-color: white;
		display: inline-block;
		text-align: center;
		height: 40px; width: 100%;
		line-height: 100%;
		cursor: pointer;
	}
	.pan:HOVER{
		background-color: skyblue !important;
		transition: 0.5s;
	}
	.selectedWidth{
		stroke-width: 20px !important;
		stroke: black !important;
		transition: 0.5s;
	}
</style>
</head>
<body>
	<%@ include file="../nav.jsp" %>
	<!-- <span class="search"></span>
	<span class="title well"> -->
	<!-- </span> -->
	<mytag></mytag>
	<!-- <div style="margin-top: -50px; width: 1000px; text-align: center; position: absolute;"> -->
	<div style="top: 70px; width: 1000px; text-align: center; position: absolute;">
		<span class="fa fa-pie-chart fa-2x"></span>&nbsp;
		<b style="margin-top: -50px; font-size: 30px;">자주 검색한 검색어일수록 위에 나타나고<br>&nbsp;&nbsp;&nbsp;&nbsp;많이 검색한 검색어일수록 크기가 큽니다</b>
		<c:if test="${empty datas}">
			<b style="margin-top: -50px; font-size: 30px;">당신의 검색 내역은 없습니다. <br>지금 EasySafe에 참여해 보세요!</b>
		</c:if>
	</div>
	
	<span class="resultList">
	</span>
	<!-- <div class="container" id="main">
	</div> -->
	
	<script type="text/javascript">
		// GROUPS:  0 Web | 1: Adobe | 2: hybrid
		
		var sortData = [${datas}];
		sortData.sort(function (a, b){
			return a.r > b.r ? -1 : a.r < b.r ? 1 : 0;
		});
		var data = sortData;
		console.log(sortData);
		$(".resultList").append("<div class='well'>검색어 목록</div><br>");
		for(var i = 0 ; i < sortData.length ; i++)
		{			
			$(".resultList").append("<div class='list-group-item pan' data-index="+i+">"+sortData[i].name+"</div>");
		}
		$(".pan").click(function(e){
			if($(this).hasClass("fadeOn")){
				return false;
			}
			shinkCircle();
			var t = ".myNode" + $(this).data("index");
			$(".pan").removeClass("fadeOn");
			$(".selectedWidth").removeClass("selectedWidth");
			
			$(this).addClass("fadeOn");
			var position = parseInt($(t).data("posy"))-('${maxHeight}' / 3);
			/* var position = parseInt($(t).data("posy"))-('${maxHeight}' / 3); */
			
			$("html, body").animate({scrollTop : position}, 'slow');
			$(t).parent().append($(t));
			$(t).children("circle").animate({"r" : "+=50"}, 'slow')
			.addClass("selectedWidth");
		});
		
		$(document).ready(function(){
			$("mytag").css("opacity", "0");
			$("mytag").animate({"opacity": "1"}, 1000);
			// 설명문 크기 저장했다가 0 으로 만들고 다시 애니메이션으로 핌
			var wd = $(".title").css("width");
			var he = $(".title").css("height");
			$(".title").css({width : "0%", height : "0%"});
			$(".title").animate({width: wd}, 'slow').animate({height: he}, 'slow');
			/* var rehe = $(".resultList").css("height");
			$(".resultList").css("height", "7%")
			$(".resultList").animate({"left": "1250px"}, 500).animate({"height": rehe}, 'slow'); */
			/*$("g").mouseenter(function(e){
				alert("ddd");
				shinkCircle();
				var t = ".myNode" + $(e.target).parent().data("index");
				//$(".pan").removeClass("fadeOn");
				$(".selectedWidth").removeClass("selectedWidth");
				//$(this).addClass("fadeOn");
				var position = parseInt($(t).data("posy"))-('${maxHeight}' / 3);
				$("html, body").animate({scrollTop : position}, 'slow');
				$(t).parent().append($(t));
				$(t).children("circle").animate({"r" : "+=50"}, 'slow')
				.addClass("selectedWidth");
			});,function(e){
				//if(!$(e.target).hasClass("fadeOn")){
					//$(".pan").removeClass("fadeOn");
					//console.dir($(".myNode" + idx).parent());
					shinkCircle();
				//}
			});	 */		
		});
		$("html").click(function(e){
			if(!$(e.target).hasClass("fadeOn")){
				$(".pan").removeClass("fadeOn");
				//console.dir($(".myNode" + idx).parent());
				shinkCircle();
			}
		});
		
		function shinkCircle(){
			var idx = $(".selectedWidth").parent().data("idx");
			if(idx == 0){
				console.log("0번");
				$(".myNode" + idx).parent().children(".myNode1").before($(".myNode" + idx));
			}
			$(".myNode" + idx).parent().children(".myNode" + (idx-1)).after($(".myNode" + idx));
			$(".selectedWidth").animate({"r" : "-=50"}, 'slow')
			.removeClass("selectedWidth");
		}
	
		var width = window.innerWidth + 700,
		    height = '${maxHeight}';
	
		var fill = d3.scale.category10();
		var nodes = [], labels = [],
			// 0 > 1 > 2 순.
		    foci = [${pos}];
	
		var svg = d3.select("mytag").append("svg")
		    .attr("width", "100%")
		    .attr("height", height)
		    .attr("overflow", "visible");
		    //.attr("domflag", '');
	
		var force = d3.layout.force()
		    .nodes(nodes)
		    .links([])
		    .charge(-400)
		    //.chargeDistance(200)
		    .gravity(0.1)
		    .friction(0.8)
		    .size([width, height])
		    .on("tick", tick);
	
		//var node = svg.selectAll("circle");
		var node = svg.selectAll("g");
	
		var counter = 0;
	
		function tick(e) {
		  var k = .1 * e.alpha;
	
		  // Push nodes toward their designated focus.
		  nodes.forEach(function(o, i) {
		    o.y += (foci[o.id].y - o.y) * k;
		    o.x += (foci[o.id].x - o.x) * k;
		  });
	
		  node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
		  .attr("data-posy", function(d){return d.y;})
		}
	
		var isDrag  = false;
		var isPress = false;
		
		var timer = setInterval(function(){
	
		  if (nodes.length > data.length-1) { clearInterval(timer); return;}
	
		  var item = data[counter];
		  nodes.push({id: item.id, r: item.r, name: item.name, lastdate: item.lastdate});
		  force.start();
	
		  node = node.data(nodes);
	
		  var n = node.enter().append("g")
		      .attr("class", "node")
		      .attr("class", function(d){ return "myNode" + d.index; })
		      .attr("data-idx", function(d){ return d.index; })
		      .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; })
		      .style('cursor', 'pointer')		      
		      .attr("data-name", function(d){return d.name;})
		      .on('mousedown', function() {
		         var sel = d3.select(this);
		         //sel.moveToBack();
		         isPress = true;		         
		      })
		      .call(force.drag)
		      .on('click', function(d){
 		    	  if(isDrag) {
 		    		  isDrag = false;
		    		  return;
		          }
 		    	  // 해당 객체 이름 얻어와서 검색으로 이동.
		    	  self.location = "${pageContext.request.contextPath}/search.do" + "?key=" + d.name + "&user=" + '${login.uid}';
		      })
 		      .on('mousemove', function(){
				  if (!isPress) { return; }				  	
		          isDrag = true;	    		  
		      }) 
		      .on('mouseup', function(){
		    	isPress = false;
		    	if(!isDrag)
		    	{
		    		return;
		    	}		    	  
		      })
		      .on('mouseenter', function(d){
		    	  /* $(".search").css("left", d.px + (d.r));
		    	  $(".search").css("top", d.py - (d.r / 2));
		    	  $(".search").animate({"opacity": 1}, 'slow').
		    	  css("display", "block");
		    	  $(".search").html(d.name); */
		    	  //console.dir(d);
		      })
		      .on('mouseleave', function(d){
		    	  /* $(".search").html("");
		    	  $(".search").animate({"opacity": 0}, 'slow').
		    	  css("display", "none"); */
		      });
	
		  n.append("circle")
		      .attr("r",  function(d) { return d.r; })
		      .style("fill", function(d) { return fill(d.id); })
		   	
		  n.append("text")
		      .text(function(d){
		          return d.name;
		      })
		      .style("font-size", function(d) {
		          return Math.min(2 * d.r, (2 * d.r - 8) / this.getComputedTextLength() * 16) + "px"; 
		       })
		      .attr("dy", ".35em")
		  n.append("text")
		      .text(function(d){
		          return d.lastdate;
		      })
		      .style("font-size", function(d) {
		          return Math.min(2 * d.r, (2 * d.r - 8) / this.getComputedTextLength() * 8) + "px"; 
		       })
		      .style("text-shadow", function(d) {
		          return "-2px 0 #000, 0 2px #000, 2px 0 #000, 0 -2px #000";
		       })
		      .attr("dy", "-2em") 
		  n.append("text")
		  	  .text(function(){
		          return "최종검색일";
		      })
		      .style("font-size", function(d) {
		          return Math.min(2 * d.r, (2 * d.r - 8) / this.getComputedTextLength() * 8) + "px"; 
		       })
		      .style("text-shadow", function(d) {
		          return "-2px 0 #000, 0 2px #000, 2px 0 #000, 0 -2px #000";
		       })
		      .attr("dy", "-3em")
	
		  counter++;
		}, 100);
	
	
		d3.selection.prototype.moveToBack = function() {
		  return this.each(function(){			  
		    this.parentNode.appendChild(this);
		  });
		};
	
		function resize() {
		  width = window.innerWidth;
		  force.size([width, height]);
		  force.start();
		}
	
		d3.select(window).on('resize', resize);
	</script>
</body>
</html>