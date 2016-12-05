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
    <body>
        <jsp:include page="header.jsp"></jsp:include>
         
    	<jsp:include page="relate.jsp"></jsp:include>
<div id="slider">        
   <div class="flexslider">
      <ul class="slides">
      	<c:forEach items="${simples}" var="simple">
      		<li>
            	<div class="slider-caption">
                	<h1>${simple.title}</h1>
                	<br>
                 	<p>${simple.content}</p>
                 	<br><br>
                    <a href="javaScript:" onclick = "openColumn('${simple.code}')">${simple.button}</a>
                </div>
                <img src="${simple.image}" alt="" />
            </li>
      	</c:forEach>
      </ul>
    </div>
</div>


<div id="timeline-post">
    <div class="container">
         <div class="row">
              <div class="col-md-12">
                  <div class="heading-section">
                      <h2>我们是</h2>
                      <img src="${path}/images/under-heading.png" alt="" >
                  </div>
              </div>
         </div>
         <div class="row">
              <div class="col-md-6">
                  <h3>公司简介</h3>
                  <p>Duis efficitur, est ut sollicitudin efficitur, nulla eros tempus lacus, non auctor mi leo ut justo. Proin euismod sapien nec risus bibendum aliquam. Quisque non maximus augue. Vivamus mattis placerat faucibus. Fusce nec facilisis justo. Vestibulum tristique et purus condimentum dignissim. Curabitur mollis, sem nec condimentum consequat, velit diam consequat ex, nec rhoncus risus purus eget nibh. Sed a mollis dolor.</p>
              </div>
              <div class="col-md-6">
                  <h3>团队管理</h3>
                  <p>Nam id felis nec libero posuere pretium ut ut tortor. Maecenas molestie dolor sed lectus vestibulum viverra. Morbi quis augue massa. Curabitur vel imperdiet justo, ut commodo sem. Donec ac elementum dolor, at finibus ex. Curabitur viverra venenatis gravida. Proin augue libero, accumsan sit amet ullamcorper in, posuere ac erat. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
              </div>
          </div>
     </div>
</div>


<div id="services">
     <div class="container">
          <div class="row">
              <div class="col-md-12">
                   <div class="heading-section">
                       <h2>服务宗旨</h2>
                       <img src="${path}/images/under-heading.png" alt="" >
                   </div>
              </div>
          </div>
          <div class="row">
              <div class="col-md-3 col-sm-6">
                   <div class="service-item">
                       <div class="icon">
                           <i class="fa fa-pencil"></i>
                       </div>
                       <h4>个性化定制</h4>
                       <p>可根据客户的情况提供不同的解决方案，帮助客户找到最合适的方案</p>
                   </div>
              </div>
              <div class="col-md-3 col-sm-6">
                   <div class="service-item">
                       <div class="icon">
                           <i class="fa fa-pencil"></i>
                       </div>
                       <h4>贴心服务</h4>
                       <p>24小时随时待命，让您体会到最贴心的服务</p>
                   </div>
              </div>
              <div class="col-md-3 col-sm-6">
                   <div class="service-item">
                       <div class="icon">
                           <i class="fa fa-pencil"></i>
                       </div>
                       <h4>专业指导</h4>
                       <p>24小时随时待命，让您体会到最贴心的服务</p>
                   </div>
              </div>
          	  <div class="col-md-3 col-sm-6">
                   <div class="service-item">
                       <div class="icon">
                           <i class="fa fa-pencil"></i>
                       </div>
                       <h4>专业指导</h4>
                       <p>24小时随时待命，让您体会到最贴心的服务</p>
                   </div>
              </div>
          </div>
    </div>
</div>

<div id="latest-blog">
    <div class="container">
        <div class="row">
             <div class="col-md-12">
                  <div class="heading-section">
                        <h2>经典案例</h2>
                        <img src="${path}/images/under-heading.png" alt="" >
                  </div>
             </div>
        </div>
        <div class="row">
        	<c:forEach items="${ cases}" var="ncase">
        		<div class="col-md-4 col-sm-6">
             		<div class="blog-post">
                  		<div class="blog-thumb">
                      		<img src="${ncase.image}" style="width:100%; height:100;" alt="" />
                 		</div>
                  		<div class="blog-content">
                      		<div class="content-show">
                          		<h4><a href="javaScript:" onclick="openCase('${ncase.id}')">${ncase.title}</a></h4>
                          		<span>${ncase.time}</span>
                      		</div>
                  			<div class="content-hide">
                      			<p>${ncase.simple}</p>
                  			</div>
              			</div>
         			</div>
         		</div>
        	</c:forEach>
        </div>
   </div>
</div>

<div id="our-team">
   <div class="container">
        <div class="row">
            <div class="col-md-12">
                 <div class="heading-section">
                     <h2>我们的团队</h2>
                     <img src="${path}/images/under-heading.png" alt="" >
                 </div>
            </div>
        </div>
        <div class="row">
            <div class="authors">
                 <c:forEach items="${employees }" var="employee">
                     <div class="col-md-3 col-sm-6">
                         <div class="team-thumb">
                             <div class="author">
                                 <img src="${employee.image}" alt="">
                             </div>
                             <div class="overlay">
                                 <div class="author-caption">
                                      <ul>
                                         <li style="background: fff"><label>手机号：${employee.phone }</label></li>
                                      </ul>
                                 </div>
                             </div>
                         </div>
                         <div class="author-details">
                             <h2>${employee.name }</h2>
                             <span>${employee.position }</span>
                         </div>
                     </div>
                 </c:forEach>
            </div>
        </div>
   </div>
</div>
			
			
<div id="testimonails">
      <div class="container">
            <div class="row">
                  <div class="col-md-12">
                       <div class="heading-section">
                           <h2>客户评价</h2>
                           <img src="${path}/images/under-heading.png" alt="" >
                       </div>
                  </div>
            </div>
            <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                       <div class="testimonails-slider">
                           <ul class="slides">
                           		<c:forEach items="${evaluates}" var="evaluate">
                           			<li>
                                    	<div class="testimonails-content">
                                        	<p>${evaluate.content}</p>
                                        	<h6>${evaluate.name} -  ${evaluate.time} - <a href="#">${evaluate.column}</a></h6>
                                    	</div>
                                	</li>
                           		</c:forEach>
                           </ul>
                       </div>
                  </div>
            </div>
      </div>
</div>
       <jsp:include page="footer.jsp"></jsp:include>
			
			
<script type="text/javascript">
	function openCase(id){
		location.href = "${path}/index/case.do?id="+id;
	}
</script>
    </body>
</html>