<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">

<%@include file="/common/header-front.jsp"%>
<title>天津市扬帆教育</title>
</head>
    <body class="body111">
            <header>
                <div id="top-header">
                    <div class="container">
                        <div class="row">
                        </div>
                    </div>
                </div>
                <div id="main-header" style="background-color:#FFEFDB">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-2">
                                <div class="logo">
                                    <a href="#"><img src="images/logo.png" title="扬帆教育" alt="扬帆教育" ></a>
                                </div>
                            </div>
                            <div class="col-md-10">
                                <div class="main-menu">
                                    <ul>
                                        <li><a href="index.html">主页</a></li>
                                        <li><a href="item.html">幼儿培训</a></li>
                                        <li><a href="item.html">艺术教师输出</a></li>
										<li><a href="item.html">园长资格证</a></li>
										<li><a href="item.html">教师资格证</a></li>
										<li><a href="item.html">学历提升</a></li>
										<li><a href="item.html">微信公众号制作</a></li>
										<li><a href="contact-us.html">加入我们</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

			<div class="pinned note-container">
				<div class="note">
					<h5>联系我们</h5>
					<p><a href="tencent://message/?uin=1026514749&amp;Site=有事Q我&amp;Menu=yes">  
						<img style="border:0px;" src=http://wpa.qq.com/pa?p=1:707321921:9>客服00001</a></p>
					<p><a href="tencent://message/?uin=1026514749&amp;Site=有事Q我&amp;Menu=yes">  
						<img style="border:0px;" src=http://wpa.qq.com/pa?p=1:707321921:9>客服00001</a></p>
					<p><a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=huzv4761tr_zsrfG9-eo5enr" style="text-decoration:none;">公司邮箱</a></p>
				</div>
			</div>
			
			
            <div id="view"></div>

			<footer>
                <div class="container">
                    <div class="main-footer">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="recent-posts">
                                    <h4 class="footer-title">最新活动</h4>
                                    <div class="recent-post">
                                        <div class="recent-post-thumb">
                                            <img src="images/recent-post1.jpg" alt="">
                                        </div>
                                        <div class="recent-post-info">
                                            <h6><a href="#">园长资格证报名</a></h6>
                                            <span>2016-10-17</span>
                                        </div>
                                    </div>
                                    <div class="recent-post">
                                        <div class="recent-post-thumb">
                                            <img src="images/recent-post2.jpg" alt="">
                                        </div>
                                        <div class="recent-post-info">
                                            <h6><a href="#">教师资格证报名</a></h6>
                                            <span>2016-10-17</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="more-info">
                                    <h4 class="footer-title">更多信息</h4>
                                    <p>如果你想要对我们公司有更深刻的了解，以下是我们公司的联系方式</p>
                                    <ul>
                                        <li><i class="fa fa-phone"></i>010-020-0340</li>
                                        <li><i class="fa fa-globe"></i>天津市xx区xx路xx大楼xxx</li>
                                        <li><i class="fa fa-envelope"></i><a href="#">yangfangjiaoyu@126.com</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom-footer">
                        <p>Copyright © 2084 <a href="#">扬帆教育</a> Collect from </p>
                    </div>
                    
                </div>
            </footer>
		<script type="text/javascript">
		$(function(){
			$(".pinned").pin({
				minWidth: 940
			});
			openColumn("index");
		});	
		function openColumn(code){
			$("#view").load("${path}/index/openColumn.do?code="+code);
		}
		</script>
    </body>
</html>