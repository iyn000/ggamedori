<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/head.jsp" %>

<main>

	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<h2>고객센터</h2>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="d-flex justify-content-center py-3">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a style="color: black;"
					class="nav-link active" href="<c:url value='/customersc/main.do' />"> 공지사항</a></li>
				<li class="nav-item"><a style="color: black;" class="nav-link"
					href="<c:url value='/customersc/faq.do' />"> 자주 묻는 질문</a></li>
			</ul>
		</div>
	</div>
	<div class="container">

		<table class="table table-hover" style="border-top: 1px solid black;">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="noticeVO" items="${notice}">
			    <tr>
			        <td>${noticeVO.notice_idx}</td>
			        <td><a href="view.do?notice_idx=${noticeVO.notice_idx}">${noticeVO.notice_title}</a></td>
			        <td>${noticeVO.notice_writer}</td>
			        <td>${noticeVO.notice_hit}</td>
			        <td>${noticeVO.notice_wdate}</td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>


		<div>
			<table>
				<tr>
					<td>
						<form>
							<input class="form-control" style="width: 300px;" type="text"
								aria-label="default input example">
						</form>

					</td>
					<td>
						<button type="button" class="btn btn-dark">검색</button>
						<button type="button" class="btn btn-dark" onclick="location.href='notice_write.do'">글쓰기</button>
					</td>
				</tr>
			</table>
		</div>


	</div>
	<!---------customer 끝-------------------------------------------------------------->


</main>
<%@ include file="../include/foot.jsp" %>