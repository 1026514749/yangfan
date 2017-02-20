<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">
<title>天津市扬帆教育</title>
<%@include file="/common/header-front.jsp" %>

<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=h6HG0gT9qzmHWNHPtHwy2r31RQQTzaK5"></script>

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
         
    <jsp:include page="relate.jsp"></jsp:include>
    
    <div id="product-post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="heading-section">
                                <h2>喜欢就加入我们吧</h2>
                                <img src="${path }/images/under-heading.png" alt="" >
                            </div>
                        </div>
                    </div>
                    <div id="contact-us">
                        <div class="container">
                            <div class="row">
                                <div class="product-item col-md-12">
                                    <div class="row">
                                        <div class="col-md-8">  
                                            <div class="message-form">
                                               	<p style="color: red; font-size: 30px; height: 50px;">不做孩子未来路上的主宰，只做他身边的陪伴！</p>
                                               	<p>
                                               	</p>
												<p style="color: green; font-size: 30px; height: 50px;">扬帆教育陪伴您的孩子健康成长！</p>
												<img src="${path }/images/hezuo.jpg" />
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="info">
                                                <p>如有意向可以随时与我们联系，联系方式如下 </p>
                                                <ul>
                                                    <li><i class="fa fa-phone"></i>${info.mobile }</li>
                                                    <li><i class="fa fa-globe"></i>${info.addr }</li>
                                                    <li><i class="fa fa-envelope"></i><a href="#">${info.email }</a></li>
                                                </ul>
                                            </div>
                                        </div>     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="heading-section">
                                <h2>公司位置</h2>
                                <img src="${path }/images/under-heading.png" alt="" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div style="width:100%;height:550px;border:#ccc solid 1px;" id="allmap"></div>
                        </div>
                    </div>     
                </div>
            </div>
    
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
var map = new BMap.Map("allmap");
var point = new BMap.Point(117.101783,39.109173);
map.centerAndZoom(point, 15);
var marker = new BMap.Marker(point);  // 创建标注
map.addOverlay(marker);               // 将标注添加到地图中
marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
var label = new BMap.Label("扬帆教育在这哟",{offset:new BMap.Size(20,-10)});
marker.setLabel(label);

</script>
</html>



