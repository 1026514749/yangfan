<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="slider">
   <div class="flexslider">
      <ul class="slides">
      	<c:forEach items="${simples}" var="simple">
      		<li>
            	<div class="slider-caption">
                	<h1>${simple.title}</h1>
                 	<p>${simple.content}</p>
                    <a href="javaScript:" onclick = "openColumn(${simple.code})">${simple.button}</a>
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
                      <img src="images/under-heading.png" alt="" >
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
                       <img src="images/under-heading.png" alt="" >
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
                       <i class="fa fa-bullhorn"></i>
                   </div>
                   <h4>贴心服务</h4>
                   <p>24小时随时待命，让您体会到最贴心的服务</p>
              </div>
          </div>
          <div class="col-md-3 col-sm-6">
              <div class="service-item">
                   <div class="icon">
                       <i class="fa fa-bell"></i>
                   </div>
              	   <h4>专业指导</h4>
                   <p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
              </div>
           </div>
           <div class="col-md-3 col-sm-6">
              <div class="service-item">
                   <div class="icon">
                       <i class="fa fa-heart"></i>
                   </div>
                   <h4>满意度</h4>
                   <p>客户的满意，是我们前进的最大动力</p>
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
                        <img src="images/under-heading.png" alt="" >
                  </div>
             </div>
        </div>
        <c:forEach items="${ cases}" var="ncase">
        	<div class="row">
        		<div class="col-md-4 col-sm-6">
             		<div class="blog-post">
                  		<div class="blog-thumb">
                      		<img src="${ncase.image}" alt="" />
                 		</div>
                  		<div class="blog-content">
                      		<div class="content-show">
                          		<h4><a href="javaScript:" onclick="openCase(${ncase.id})">红星幼儿园</a></h4>
                          		<span>${ncase.time}</span>
                      		</div>
                  			<div class="content-hide">
                      			<p>${ncase.simple}</p>
                  			</div>
              			</div>
         			</div>
         		</div>
         	</div>
        </c:forEach>
   </div>
</div>

<div id="our-team">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="heading-section">
                                <h2>我们的团队</h2>
                                <img src="images/under-heading.png" alt="" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="authors">
                            <div class="col-md-3 col-sm-6">
                                <div class="team-thumb">
                                    <div class="author">
                                        <img src="images/author1.jpg" alt="Tracy - templatemo">
                                    </div>
                                    <div class="overlay">
                                        <div class="author-caption">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="author-details">
                                     <h2>张三</h2>
                                     <span>设计师</span>
                                 </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="team-thumb">
                                    <div class="author">
                                        <img src="images/author2.jpg" alt="Mary - templatemo">
                                    </div>
                                    <div class="overlay">
                                        <div class="author-caption">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="author-details">
                                     <h2>李四</h2>
                                     <span>开发人员</span>
                                 </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="team-thumb">
                                    <div class="author">
                                        <img src="images/author3.jpg" alt="Julia - templatemo">
                                    </div>
                                    <div class="overlay">
                                        <div class="author-caption">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="author-details">
                                     <h2>赵五</h2>
                                     <span>CEO</span>
                                 </div>
                            </div>
                            <div class="col-md-3 col-sm-6">
                                <div class="team-thumb">
                                    <div class="author">
                                        <img src="images/author4.jpg" alt="Linda - templatemo">
                                    </div>
                                    <div class="overlay">
                                        <div class="author-caption">
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="author-details">
                                     <h2>孙六</h2>
                                     <span>经理</span>
                                 </div>
                            </div>
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
                                <img src="images/under-heading.png" alt="" >
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="testimonails-slider">
                              <ul class="slides">
                                <li>
                                    <div class="testimonails-content">
                                        <p>刚刚拿到了我的园长资格证，非常的满意</p>
                                        <h6>张三 - <a href="#">园长资格证</a></h6>
                                    </div>
                                </li>
                                <li>
                                    <div class="testimonails-content">
                                        <p>我的小孩在这里培训了三个月，已经会说一些简单的英文单词，还拿了好多小红花，看着他开心，我也是很欣慰</p>
                                        <h6>李四 - <a href="#">幼儿培训</a></h6>
                                    </div> 
                                </li>
                                <li>
                                    <div class="testimonails-content">
                                        <p>准备开一个自己的幼儿园，但是不知道到哪里去找幼儿教师，扬帆给我推荐了好几个优秀的老师，现在幼儿园办的非常好</p>
                                        <h6>赵五 - <a href="#">艺术老师输出</a></h6>
                                    </div>
                                </li>
                              </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>