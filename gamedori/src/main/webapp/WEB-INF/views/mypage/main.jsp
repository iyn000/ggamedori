
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/head.jsp" %>
<main>
	<!-- 마이페이지 클릭 시 첫 화면 ------------------------------------------------------------------------------------------------->
	<div id="mypage_inner" class="container">
		<h3>마이페이지</h3>
		<div id="mypage_1" class="col">
			<ul>
				<li>
					<h4>등급</h4>
					<p>
					<c:choose>
						<c:when test="${level == 1}">
						    <c:out value="브론즈" />
						</c:when>
						<c:when test="${level == 2}">
						    <c:out value="실버" />
						 </c:when>
						 <c:when test="${level == 3}">
						    <c:out value="골드" />
						 </c:when>
						 
					</c:choose>
					</p>
				</li>
				<li>
					<h4>적립금</h4>
					<p><c:out value="${PointBalance}"/>원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
					<!--s_money_check.html -->
				</li>
				<li>
					<h4>쿠폰</h4>
					<p> <c:out value="${CouponCount}"/>개</p> <a href="<c:url value='/mypage/coupon.do' />">쿠폰 확인 > </a> <!-- coupon_check.html -->
				</li>
				<li>
					<h4>나의 후기</h4>
					<p><c:out value="${ReviewCount}"/>개</p> <a href="<c:url value='/mypage/reviewlist.do' />">후기 확인 > </a> <!-- review_list.html -->
				</li>
			</ul>
		</div>

		<div id="mypage_inner2" class="container">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<span>${sessionScope.Login.member_name}</span>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group list-group-numbered">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodlist.do' />">주문내역</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="detail_inner" class="col-8">
				<ul>
					<li>
						<div id="product_page" class="container">
							<p>최근 주문 내역</p>
						</div>
						<div id="product" class="container">
							<table class="table table-hover align-middle" class="container">
								<thead>
									<tr>
										<th scope="col">주문 상태</th>
										<th scope="col">상품 이미지</th>
										<th scope="col">상품명</th>
										<th scope="col">주문 일자</th>
										<th scope="col">주문 금액</th>
										<th scope="col">주문 상세</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="Orderlist" items="${Orderlist}">
									<tr>
										<td class="align-middle">
										<c:choose>
											<c:when test="${Orderlist.order_state == 1}">
											    <c:out value="주문완료" />
											</c:when>
											<c:when test="${Orderlist.order_state == 2}">
											    <c:out value="배송중" />
											 </c:when>
											 <c:when test="${Orderlist.order_state == 3}">
											    <c:out value="배송완료" />
											 </c:when>
										</c:choose>
										</td>
										<td class="align-middle">
											<img style="width:85px; height:85px;" src="<c:url value='/images/${Orderlist.prod_imgt}' />">
										</td>
										<td class="align-middle">${Orderlist.prod_name}</td>
										<td class="align-middle">${fn:substring(Orderlist.order_date,0,10)}</td>
										<td class="align-middle">
											<fmt:formatNumber var="payPrice" value="${Orderlist.pay_price_real}" pattern="#,###"/>
											${payPrice}원
										</td>
										<td class="align-middle"><button>상세보기</button></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/prodlist.do' />">...더보기</a>
							</p>
							<!-- product_list.html -->
						</div>
					</li>

					<li>
						<div id="enquiry_page" class="container">
							<p>상품 문의</p>

						</div>
						<div id="enquiry" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품 명</th>
										<th scope="col">문의 제목</th>
										<th scope="col">주문 번호</th>
										<th scope="col">작성 일자</th>
										<th scope="col">처리 상태</th>
									</tr>
								</thead>
								<tbody>
								
								<c:forEach items="${selectQAList}" var="vo" varStatus="status">
									<c:if test="${status.index < 4}">
										<tr>
											<td>${vo.prod_q_idx}</td>
											<td><a href="../prod/detail.do?prod_idx=${vo.product_tb_idx}">${vo.prod_name}</a></td>
											<td>
												<c:choose>
													<c:when test="${vo.prod_q_secret == 1}">
														<img src= "<c:url value='/images/비밀글자물쇠.png'/>" style="width:20px;">
													</c:when>
												</c:choose>
												${vo.prod_q_title}
											</td>
											<td>${vo.product_tb_idx}</td>	
											<td class="wdate">${vo.prod_q_wdate}</td>
										<td>
										<c:choose>
											<c:when test="${vo.prod_q_yn == 1}">
												<c:out value="답변완료" />
											</c:when>
											<c:when test="${vo.prod_q_yn == 2}">
												<c:out value="접수완료" />
											</c:when>
										</c:choose>
										</td>
										</tr>
									</c:if>
								</c:forEach>
								
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/prodqa.do' />">...더보기</a>
							</p>
							<!-- enquiry_list.html -->
						</div>

					</li>

					<li>
						<div id="one_to_one_page" class="container">
							<p>1 : 1 문의</p>

						
						</div>
						<div id="one_to_one" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">문의 제목</th>
										<th scope="col">작성 일자</th>
										<th scope="col">처리 상태</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${selectOtoListD}" var="vo" varStatus="status">
								    <c:if test="${status.index < 4}">
								        <tr>				   
								            <td class="table_number">${vo.qa_idx}</td>
								            <td>${vo.qa_title}</td>				             
								            <td class="wdate">${vo.qa_wdate}</td>
								            <td>
								                <c:choose>
								                    <c:when test="${vo.qa_yn == 1}">
								                        <c:out value="답변 완료" />
								                    </c:when>
								                    <c:when test="${vo.qa_yn == 2}">
								                        <c:out value="답변 처리중" />
								                    </c:when>
								                </c:choose>
								            </td>
								        </tr>
								    </c:if>
								</c:forEach>

								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/oto.do' />">...더보기</a>
							</p>
							<!-- one_to_one_list.html -->
						</div>
					</li>

					<li>
						<div id="review_page" class="container">
							<p>나의 후기</p>
						</div>
						<div id="review" class="container">
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">상품 정보</th>
										<th scope="col">후기 제목</th>
										<th scope="col">작성자 명</th>
										<th scope="col">작성 일자</th>
										<th scope="col">별 점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${selectReviewList}" var="vo" varStatus="status">
									<c:if test="${status.index < 4}">
										<tr>
											<td scope="row" class="table_number"></td>
											<td><a href="../prod/detail.do?prod_idx=${vo.product_tb_idx}">${vo.prod_name}</a></td>
											<td>${vo.review_title}</td>
											<td>${vo.review_writer}</td>
											<td class="wdate">${vo.review_wdate}</td>
											<td>
												<c:set var="star" value="★ " />
												<c:forEach begin="1" end="${vo.review_star}">
												 ${star}
												</c:forEach>
											</td>
										</tr>
									</c:if>
									</c:forEach>
								</tbody>
							</table>
							<p id="breakdown1">
								<a href="<c:url value='/mypage/reviewlist.do' />">...더보기</a>
							</p>
							<!-- review_list.html -->
						</div>
					</li>

				</ul>
			</div>
		</div>
		<!-- end:#mypage_inner2 -->
	</div>
	<!-- end:#mypage_inner -->
	
	<script>
	
	// 로그인 세션 확인 후 비어있으면 메인 페이지로 이동
	$(document).ready(function () {
	    if (!${!empty Login}) { // 로그인 세션이 비어있는 경우
	        alert("로그인이 필요한 페이지입니다.");
	        window.location.href = "<%=request.getContextPath()%>/"; // 메인 페이지로 이동
	    }
	});
	
	</script>
</main>
<!-- end : main ----------------------->

<%@ include file="../include/foot.jsp" %>