<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">

<title>天津市扬帆教育</title>
</head>
<style>
/*mess*/
* { font-size:13px; font-family:Georgia, "Times New Roman","瀹嬩綋"; color:#333; margin:0; padding:0; list-style:none; text-shadow:0 1px 1px #fff; }
a img { border:0;}
.demoTitle { text-align:center; font-size:30px; font-weight:bold; color:#c00; text-shadow:1px 1px 0 #fff; margin:60px 0 40px; border-bottom:1px dashed #999;border-top:1px dashed #999; padding:20px 0; background:#EEE; }
#demo1,#demo2,#demo3,#demo4,#demo5,#demo6,#demo7,#demo8 { margin:0 auto; }
#psWraper { background:#eee; padding:10px 0; margin-top:80px; border-top:1px dashed #999; }
#psText { padding-bottom:10px; margin-bottom:20px; border-bottom:1px dashed #bebebe; }
#psText samp { font-weight:bold; font-size:14px; letter-spacing:0.1em; }
#psText samp a { color:#06F;letter-spacing:0.1em; }
#psText h2 { font-size:20px; margin:10px auto; }
#psText p { padding:10px 0; line-height:25px; letter-spacing:0.1em; }
#psText ul { margin:10px auto; }
#psText ul li { line-height:25px; line-height:25px; letter-spacing:0.1em; }
#ps { width:600px; margin:0 auto; padding:30px 0; }
#ps h1 { padding-bottom:20px; text-shadow:1px 1px 0 #fff; color:#c00; font-size:23px; font-weight:bold; }
#ps h2 { line-height:20px; text-shadow:1px 1px 0 #fff; padding:10px 0; }
#ps h1 p { display:inline; font-size:16px; font-weight:bold; color:#666; margin-left:20px; }
#ps dl { padding-left:0; padding-bottom:40px; }
#ps dl dt,#ps dl dd { height:30px; line-height:30px; font-size:13px; text-shadow:1px 1px 0 #fff;  }
#ps dl dt { padding-left:10px; }
#ps dl dd { color:#ff6600; text-shadow:1px 1px 0 #fff; }
#ps dl dd span {color:#900; margin-right:50px; letter-spacing:0.01em; padding-left:10px;}
.TmpStyle { margin:50px auto;}
/* 客服代码CSS */
.jcContact{position:absolute;top:0;left:0;z-index:99;width:215px;}
.jcConraper{width:174px;background:url(${path}/images/c03.png) repeat-y 0 0;overflow:hidden;}
.jcConBtn{background:url(${path}/images/c01.png) no-repeat;position:absolute;top:0;left:0;width:41px;height:116px;cursor:pointer;}
body,ul,ol,h2,h3,h4,h5,p,dl,dt,dd,form{padding:0;margin:0;}
img{border:none;}
li{list-style:none;}
a{text-decoration:none;outline:none;color:#666666;}
a:hover{text-decoration:none}
img{border:0}
ul{list-style:none;margin:0;}
label{color:#6CBD45;font-size:14px;font-weight:bold;padding-bottom:0.5em;margin:0;}
.h3{font-size:13px;font-weight:bold;}
#show{background:url(images/photo.jpg)}
#meun{color:#fff;padding-left:10px;}
#meun img{float:left;}
#submeun{margin-left:70px;float:left;}
#submeun span{text-align:center;margin-right:10px;float:left;display:inline;}
#submeun span a{color:#fff;height:50px;line-height:50px;font-size:14px;font-weight:bold;text-align:center;padding-left:15px;padding-right:15px;display:block;}
#submeun span.cur{text-align:center;background:#82ce18;margin-right:10px;float:left;display:inline;}
#top{background-color:#000;margin:0em 0 10px 0em;border-style:solid;border-width:1px;border-color:#E5E5E5;height:50px;line-height:50px;}
label.subtitle{font-size:13px;float:right;color:#6CBD45;margin:0 10px;text-align:right;}
h1.title{height:50px;font-size:12px;background:url(logo.png) no-repeat;}
h1.title a:link,h1.title a:visited,h1.title a:hover{color:#000;text-decoration:none;}
</style>

<body>
<div id="demo3" class="jcContact">
     <div class="jcConraper">
         <!-- 自定义部分 -->
         <div style=" background:url(${path}/images/c02.png) no-repeat 0 0; height:44px;"></div>
         <ul>
             <li style="font-size:20px; text-align:center; font-weight:bold; color:#ff6600; padding:15px 0 5px;">${info.mobile }</li>
             <li style="height:140px;width:174px;"><img  src="${info.wechat }"/></li>
         </ul>
         <div style="background:url(${path}/images/c05.png) no-repeat 0 0; height:11px;"></div>
         <div style="line-height:22px; padding:5px 18px 25px;">
             <a href="tencent://message/?uin=1026514749&amp;Site=有事Q我&amp;Menu=yes" style="display:block; float:left; width:60px; height:22px; background:red; margin-right: 10px; "><img src="${path }/images/c06.png" height="22" width="60" border="0" /></a>
             <a href="tencent://message/?uin=1026514749&amp;Site=有事Q我&amp;Menu=yes" style="display:block; float:left; width:60px; height:22px; background:red; "><img src="${path }/images/c06.png" height="22" width="60" border="0" /></a>
             <div class="clear"></div>
         </div>
         <div style="background:url(${path}/images/c07.png) no-repeat; height:13px;"></div>
     </div>
	 <div class="jcConBtn"></div>
</div>
<script type="text/javascript">
$('#demo3').jcContact({
	speed:400,
	position:'bottom',
	posOffsetY : -200,
	btnPosition : 'top',
	btnPosoffsetY : 44 ,
	float:'right',
	Event : "click"			  
});
</script>
</body>
</html>