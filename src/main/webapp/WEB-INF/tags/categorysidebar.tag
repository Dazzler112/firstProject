<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="/resources/categorysidebar.css" rel="stylesheet">
<body>
	

<div class="categorysidebar">
	<h1 style="position: static; margin: 0px 0px 30px 60px; font-size: 30px;">Home</h1>
	<!--  -->
	<!--  -->
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">패션</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				<div class="accordion-body"></div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">게임</button>
			</h2>
			<div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul class="ulstyle">
						<div>
							<li class="listyle"><a class="linkcolor" href="#">콘솔게임</a></li>
							<li class="listyle"><a class="linkcolor" href="#">pc게임</a></li>
							<li class="listyle"><a class="linkcolor" href="#">플레이스테이션</a></li>
							<li class="listyle"><a class="linkcolor" href="#">psp</a></li>
							<li class="listyle"><a class="linkcolor" href="#">닌텐도</a></li>
							<li class="listyle"><a class="linkcolor" href="#">wii</a></li>
							<li class="listyle"><a class="linkcolor" href="#">xbox</a></li>
							<li class="listyle"><a class="linkcolor" href="#">게임타이틀</a></li>
						</div>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					Accordion Item #3</button>
			</h2>
			<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
				<div class="accordion-body"></div>
			</div>
		</div>
	</div>
</div>

</body>
<%-- <table class="table">
        <thead>
            <tr>
                <th>1</th>
                <th>카테고리</th>
                <th>뭐시기뭐시기</th>
                <th>지역</th>
                <th>올린 시간</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${CategoryList}" var="product">
                <tr>
                    <td>${product.status} 1</td>
                    <td>${product.title }2</td>
                    <td>${product.price}</td>
                    <td>${product.address}</td>
                    <td>${product.inserted}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table> --%>