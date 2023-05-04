<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>
<main>

	<!-- 적립금 확인------------------------------------------------------------ -->


	<div id="mypage_inner" class="container">
		<h4>적립금 확인</h4>
			<div id="mypage_1" class="ms-0 me-0">
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
						<fmt:formatNumber var="savePointt" value="${savePoint}" pattern="#,###"/>
						<p>${savePointt}원</p> <a href="<c:url value='/mypage/point.do' />">적립금 확인 > </a>
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
		<div id="mypage_inner2" class="container row">
			<div id="mypage_list" class="col-3">
				<p id="nickname">
					<strong>${sessionScope.Login.member_name}</strong>님 환영합니다.
				</p>

				<ol id="ol_li" class="list-group">
					<li class="list-group-item"><a href="<c:url value='/mypage/cart.do' />">장바구니</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodqa.do' />">상품문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/prodlist.do' />">주문내역</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/oto.do' />">1 : 1문의</a></li>
					<li class="list-group-item"><a href="<c:url value='/mypage/reviewlist.do' />">나의
							후기</a></li>
					<!-- review_list.html -->
					<li class="list-group-item"><a href="<c:url value='/user/modify.do' />">회원정보수정</a></li>
					<li class="list-group-item"><a href="<c:url value='/user/withdraw.do' />">탈퇴하기</a></li>
					<!-- unregister.html -->
				</ol>
			</div>
			<div id="s_money_inner" class="col-9">
				<p>
					<strong>${sessionScope.Login.member_name}</strong>님의 적립금 내역
				</p>
				<table id="s_money_t" class="table table-hover"
					style="width: 100%; border-top: 1px solid #000;">
					<thead>
						<tr>
							<th scope="col">적립금 사용일</th>
							<th scope="col">적립금 사용내역</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${selectSavePointList}" var="vo">
							<c:if test="${vo.savept_amount ne 0}">
								<tr>
									<td class="wdate">${vo.savept_created}</td>
									<td>${vo.savept_amount}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>

					</div>
				</table>
			</div>
		</div>
		<!-- end:#s_money_inner -->
	</div>
	<!-- end:#mypage_inner2 -->


	<!---------------------------------------------------------------------------->


</main>



<%@ include file="../include/foot.jsp" %>