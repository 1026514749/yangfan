<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
<!-- BEGIN META --> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="sjm">
<title>扬帆教育</title>
<%@include file="/common/header-front.jsp" %>
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
                        <div class="col-md-12">
                            <div id="googleMap" style="height:420px;"></div>
                        </div>
                    </div>     
                </div>
            </div>
    
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">

</script>
</html>