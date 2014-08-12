<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="css/coinok/bootstrap.min.css">
<link rel="stylesheet" href="css/coinok/bootstrap-responsive.min.css">
<link rel="stylesheet" href="css/coinok/overrides.min.css">
<link rel="stylesheet" href="css/coinok/zeroblock.min.css">
<title>比特币区块浏览工具 - CoinOK</title>
<script src="socket.io/socket.io.js"></script>
<script src="js/coinok/jquery.min.js"></script>
<script src="js/coinok/bootstrap.min.js"></script>
<script src="js/coinok/shared.min.js"></script>
<script src="js/push.js"></script>
<div class="">
	<ul>
		<!-- 分页首页按钮 -->

		<c:choose>
			<c:when test="${currentPageNo le 1}">
				<li class="disabled"><span>首页</span></li>
			</c:when>
			<c:otherwise>
				<li><a href="?pageNo=1">首页</a></li>
			</c:otherwise>
		</c:choose>


		<!-- 前一页按钮 -->

		<c:choose>
			<c:when test="${currentPageNo le 1}">
				<li class="disabled"><span>前一页</span></li>
			</c:when>
			<c:otherwise>
				<li><a href="?pageNo=${currentPageNo - 1}">前一页</a></li>
			</c:otherwise>

		</c:choose>


		<!-- 跳转 -->
		<li><a> 第 <input id="page" type="text" id="current_page"
				autocomplete="off" value="${currentPageNo }"
				style="margin-bottom: 2px; margin-top: 2px; width: 30px; height: 25px; direction: rtl;">
				页
		</a></li>
		<li><a id="skip" href="#" onclick="skipPage();">转到</a></li>

		<!-- 下一页按钮 -->
		<c:choose>
			<c:when test="${currentPageNo ge allPages}">
				<li class="disabled"><a >下一页</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="?pageNo=${currentPageNo + 1}">下一页</a></li>
			</c:otherwise>
		</c:choose>

		<!-- 分页尾页按钮 -->
		<c:choose>
			<c:when test="${currentPageNo ge allPages}">
				<li class="disabled"><a>尾页</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="?pageNo=${allPages}">尾页</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
<script>
	function skipPage() {
		var number = $("#page").val().trim();
		$("#skip").attr('href', '?pageNo=' + number);
		$("#skip").click();
	}
</script>
