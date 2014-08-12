<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="Description" content="比特币区块浏览与金融统计工具。自由查阅所有比特币交易与区块的相关详细。">
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
<!--  <script type="text/javascript" src="/js/coinok/homepage.min.js"></script> -->
<!-- <script type="text/javascript">
	alert("aaaaaaaaa");
	var socket = io.connect('http://localhost:10119');
	
	socket.on('connect',function(data){
		alert("in socekt on connect"); 
		socket.emit('news');
	});
	socket.on('message', function(data) {
		var text = eval("("+data+")");
		alert(text.args);
	});
</script> -->
</head>
<body>

	<div class="container">

		<h1>
			<span class="lineLeft">Home</span> <small>比特币区块链中最近开采出的区块</small> <span
				style="float: right; display: inline; font-size: 12px;"><a
				href="/zh-cn/blocks" class="more">更多</a></span>
		</h1>

		<div class="row-fluid">
			<div class="span12">
				<table class="table table-striped" id="blocks">
					<tr>
						<th>序号</th>
						<th>块龄</th>
						<th class="hidden-phone">Transactions</th>
						<th class="hidden-phone">Total Sent</th>
						<th>播报方IP地址</th>
						<th class="hidden-phone">数据量(KB)</th>
					</tr>

					<tr id="bi:1123e22w">
						<td><a href="/block/">32134 %></a></td>
						<td data-time="211"></td>
						<td class="hidden-phone">111</td>
						<td class="hidden-phone"><span data-c="2">23.98 BTC</span></td>
						<td><a href="">local</a></td>
						<td class="hidden-phone">2323</td>
					</tr>
					<tr id="bi:12123e22">
						<td><a href="/block/">32134 %></a></td>
						<td data-time="211"></td>
						<td class="hidden-phone">111</td>
						<td class="hidden-phone"><span data-c="2">23.98 BTC</span></td>
						<td><a href="">local</a></td>
						<td class="hidden-phone">2323</td>
					</tr>
					<tr id="bi:12123e2w">
						<td><a href="/block/">32134 %></a></td>
						<td data-time="211"></td>
						<td class="hidden-phone">111</td>
						<td class="hidden-phone"><span data-c="2">23.98 BTC</span></td>
						<td><a href="">local</a></td>
						<td class="hidden-phone">2323</td>
					</tr>
					<tr id="bi:1213e22w">
						<td><a href="/block/">32134 %></a></td>
						<td data-time="211"></td>
						<td class="hidden-phone">111</td>
						<td class="hidden-phone"><span data-c="2">23.98 BTC</span></td>
						<td><a href="">local</a></td>
						<td class="hidden-phone">2323</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span6">
				<div style="min-height: 510px">
					<table class="table table-striped" id="txs">
						<tr>
							<th colspan="3">Latest Transactions</th>
						</tr>
						<tr>
							<td><a href="/tx/"> qqq </a></td>
							<td class="hidden-phone" data-time="12"><1minute</td>
							<td><button class="btn btn-success cb">
									<span data-c="123">119 BTC</span>
								</button></td>
						</tr>
						<tr>
							<td><a href="/tx/"> www </a></td>
							<td class="hidden-phone" data-time="12"><1minute</td>
							<td><button class="btn btn-success cb">
									<span data-c="123">1619 BTC</span>
								</button></td>
						</tr>
						<tr>
							<td><a href="/tx/"> eee </a></td>
							<td class="hidden-phone" data-time="12"><1minute</td>
							<td><button class="btn btn-success cb">
									<span data-c="123">1189 BTC</span>
								</button></td>
						</tr>
						<tr>
							<td><a href="/tx/"> rrr </a></td>
							<td class="hidden-phone" data-time="12"><1minute</td>
							<td><button class="btn btn-success cb">
									<span data-c="123">1919 BTC</span>
								</button></td>
						</tr>
						<tr>
							<td><a href="/tx/"> ttt </a></td>
							<td class="hidden-phone" data-time="12"><1minute</td>
							<td><button class="btn btn-success cb">
									<span data-c="123">9119 BTC</span>
								</button></td>
						</tr>
						<tr>
							<td><a href="/tx/"> yyy </a></td>
							<td class="hidden-phone" data-time="12"><1minute</td>
							<td><button class="btn btn-success cb">
									<span data-c="123">119 BTC</span>
								</button></td>
						</tr>
					</table>
				</div>
			</div>

			<div class="span6"></div>
		</div>
	</div>
	


	<jsp:include page="page.jsp"></jsp:include>


</body>
</html>