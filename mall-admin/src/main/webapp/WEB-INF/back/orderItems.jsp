<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="Generator" content="EditPlus®">
	<meta name="Author" content="">
	<meta name="Keywords" content="">
	<meta name="Description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta name="renderer" content="webkit">
</head>
<body>


			<table>
				<thead>
					<tr class="tab-0">
						<th class="tab-2">用户ID</th>
						<th class="tab-3">订单号</th>
						<th class="tab-4">商品名称</th>
						<th class="tab-5">商品主图</th>
						<th class="tab-6">商品单价</th>
						<th class="tab-6">数量</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderItems}" var="orderItems">
					<input type="hidden" name="check"  value="${orderItems.totalPrice}"/>
					<tr>
					<td>${orderItems.userId}</td>
					<td>${orderItems.orderNo}</td>
					<td>${orderItems.productName}</td>
					<td><img src="/pic/${orderItems.productImage}" width="50px" height="50px"></td>
					<td>${orderItems.currentUnitPrice}</td>
					<td>${orderItems.quantity}</td>
					<td>
					<fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>
					</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

<script type="text/javascript">
layui.use(['layer'], function(){
	  var layer = layui.layer;
	});
    $(function(){
    	refreshTotalPrice();
    })
    function refreshTotalPrice(){
    	var check = $("input[name=check]");
    	$("#count").html(check.length);
    	var totalPrice=0.00;
    	for(var i=0;i<check.length;i++){
    		var price = check[i].getAttribute('value');
    		totalPrice+=parseFloat(price);
    	}
    	$('#totalPrice').html(totalPrice);
    }
</script>
<script type="text/html" id="imgTpl">
    <img src="/pic/{{d.mainImage}}">
 </script>
</body>
</html>