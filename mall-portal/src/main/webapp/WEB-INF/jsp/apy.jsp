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
	<title>支付方式-云购物商城</title>
	<link rel="shortcut icon" type="image/x-icon" href="${ctx}/static/front/my_add_img/img/icon/favicon.ico">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/my_add_css/css/base.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/static/front/my_add_css/css/home.css">
	<!-- <script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/modernizr-custom-v2.7.1.min.js"></script> -->

</head>
<body>

<header id="pc-header">
	<div class="pc-header-nav">
		<div class="pc-header-con">
			<div class="fl pc-header-link" >您好！，欢迎来云购物 <a href="login.html" target="_blank">
			<c:if test="${CURRENT_USER.username==null}">请登录</c:if>
            <c:if test="${CURRENT_USER.username!=null}">${CURRENT_USER.username}</c:if>
			</a> <a href="register.html" target="_blank"> 免费注册</a></div>
			<div class="fr pc-header-list top-nav">
				<ul>
					<li>
						<div class="nav"><i class="pc-top-icon"></i><a href="#">我的订单</a></div>
						<div class="con">
							<dl>
								<dt><a href="">批发进货</a></dt>
								<dd><a href="">已买到货品</a></dd>
								<dd><a href="">优惠券</a></dd>
								<dd><a href="">店铺动态</a></dd>
							</dl>
						</div>
					</li>
					<li>
						<div class="nav"><i class="pc-top-icon"></i><a href="#">我的商城</a></div>
						<div class="con">
							<dl>
								<dt><a href="">批发进货</a></dt>
								<dd><a href="">已买到货品</a></dd>
								<dd><a href="">优惠券</a></dd>
								<dd><a href="">店铺动态</a></dd>
							</dl>
						</div>
					</li>
					<li><a href="#">我的云购</a></li>
					<li><a href="#">我的收藏</a></li>
					<li><a href="#">会员中心</a></li>
					<li><a href="#">客户服务</a></li>
					<li><a href="#">帮助中心</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="pc-header-logo clearfix">
		<div class="pc-fl-logo fl">
			<h1>
				<a href="index.html"></a>
			</h1>
		</div>
		<div class="head-form fl">
			<form class="clearfix">
				<input class="search-text" accesskey="" id="key" autocomplete="off" placeholder="洗衣机" type="text">
				<button class="button" onclick="search('key');return false;">搜索</button>
			</form>
			<div class="words-text clearfix">
				<a href="#" class="red">1元秒爆</a>
				<a href="#">低至五折</a>
				<a href="#">农用物资</a>
				<a href="#">佳能相机</a>
				<a href="#">服装城</a>
				<a href="#">买4免1</a>
				<a href="#">家电秒杀</a>
				<a href="#">农耕机械</a>
				<a href="#">手机新品季</a>
			</div>
		</div>
		<div class="fr pc-head-car">
			<i class="icon-car"></i>
			<a href="#">我的购物车</a>
		</div>
	</div>
	<!--  顶部    start-->
	<div class="yHeader">
		<!-- 导航   start  -->
		<div class="yNavIndex">
			<ul class="yMenuIndex" style="margin-left:0">
				<li style="background:#d1201e"><a href="" target="_blank">云购首页</a></li>
				<li><a href="" target="_blank">女士护肤 </a></li>
				<li><a href="" target="_blank">男士护肤</a></li>
				<li><a href="" target="_blank">洗护染发</a></li>
				<li><a href="" target="_blank">染发</a></li>
				<li><a href="" target="_blank">彩妆</a></li>
				<li><a href="" target="_blank">品牌故事</a></li>
			</ul>
		</div>
		<!-- 导航   end  -->
	</div>

</header>

<section id="pc-jie">
	<div class="center ">
		<ul class="pc-shopping-title clearfix">
			<li><a href="#" class="cu">全部商品(10)</a></li>
			<li><a href="#">限时优惠(7)</a></li>
			<li><a href="#">库存紧张(0)</a></li>
		</ul>
	</div>
	<div class="pc-shopping-cart center">
		<div class="pc-shopping-tab">
			<table>
				<thead>
					<tr class="tab-0">
						<th class="tab-1"><input type="checkbox" name="s_all" class="s_all tr_checkmr" id="checkAll" onclick="checkAll()"><label for="checkAll"> 全选</label></th>
						<th class="tab-2">订单号</th>
						<th class="tab-3">用户名称</th>
						<th class="tab-4">总金额</th>
						<th class="tab-5">创建时间</th>
						<th class="tab-6">订单详情</th>
						<!-- <th class="tab-7">操作</th> -->
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="7" style="padding-left:10px; background:#eee">
							<input type="checkbox" checked >
							<label for="">靓淘自营</label>
							<a href="#" style="position:relative;padding-left:50px"><i class="icon-kefu"></i>联系客服</a>
							<ul class="clearfix fr" style="padding-right:20px">
								<li><i class="pc-shop-car-yun"></i>满109元减10</li>
								<li><i class="pc-shop-car-yun"></i>领取3种优惠券, 最高省30元</li>
							</ul>
						</td>
					</tr>
					<c:forEach items="${orders}" var="orders">
					<tr>
					<th>
					<div class="car_con_1" onclick="selectProductStatus(${orders.id})">
					<input type="checkbox" name="selectCheckbox" id="checkbox${orders.id}"/>
					</div>
					</th>
					<th>${orders.orderNo}</th>
					<th>${CURRENT_USER.username}</th>
					<th><span id="cartItemTotalPrice${orders.id}">${orders.payment}</span></th>
					<th>
					<fmt:formatDate value="${orders.createTime}" pattern="yyyy-MM-dd" ></fmt:formatDate>
					</th>
					<%-- <th><a href="${ctx}/order/getOrderItemPage.shtml">订单详情</a></th> --%>
					<th><a onclick="getOrderItemPage(${orders.orderNo})" href="javascript:void(0);">订单详情</a></th>
					</tr>
					</c:forEach>
					
					<!-- <tr>
						<th><input type="checkbox"  style="margin-left:10px; float:left"></th>
						<th class="tab-th-1">
							<a href="#"><img src="images/shangpinxiangqing/X-1.png" width="100%" alt=""></a>
							<a href="#" class="tab-title">赛亿（shinee)取暖器家用/取暖电器/电暖器/电暖气台式摇头暖风机HN2118PT </a>
						</th>
						<th>
							<p>颜色：黑色</p>
							<p>规格：落地款</p>
						</th>
						<th>
							<p>399.99</p>
							<p class="red">299.99</p>
						</th>
						<th class="tab-th-2">
							<span>-</span>
							<input type="text" value="1" maxlength="3" placeholder="" class="shul">
							<span>+</span>
						</th>
						<th class="red">299.99</th>
						<th><a href="#">删除</a></th>
					</tr> -->
				</tbody>
			</table>

		</div>
	</div>
	<div style="height:10px"></div>
	<div class="center">
		<div class="clearfix pc-shop-go">
			<div class="fl pc-shop-fl">
				<input type="checkbox" placeholder="">
				<label for="">全选</label>
				<a href="#">删除</a>
				<a href="#">清楚失效商品</a>
			</div>
			<div class="fr pc-shop-fr">
				<p>选中 <em class="red pc-shop-shu"><kk id="count">0</kk></em> 款商品，总计（不含运费）</p>
				<span id="totalPrice">0</span>
				<a href="javaScript:void(0);" onclick="go()" id="go">去付款</a>
			</div>
		</div>
	</div>
</section>



<div style="height:100px"></div>

<footer>
	<div class="pc-footer-top">
		<div class="center">
			<ul class="clearfix">
				<li>
					<span>关于我们</span>
					<a href="#">关于我们</a>
					<a href="#">诚聘英才</a>
					<a href="#">用户服务协议</a>
					<a href="#">网站服务条款</a>
					<a href="#">联系我们</a>
				</li>
				<li class="lw">
					<span>购物指南</span>
					<a href="#">新手上路</a>
					<a href="#">订单查询</a>
					<a href="#">会员介绍</a>
					<a href="#">网站服务条款</a>
					<a href="#">帮助中心</a>
				</li>
				<li class="lw">
					<span>消费者保障</span>
					<a href="#">人工验货</a>
					<a href="#">退货退款政策</a>
					<a href="#">运费补贴卡</a>
					<a href="#">无忧售后</a>
					<a href="#">先行赔付</a>
				</li>
				<li class="lw">
					<span>商务合作</span>
					<a href="#">人工验货</a>
					<a href="#">退货退款政策</a>
					<a href="#">运费补贴卡</a>
					<a href="#">无忧售后</a>
					<a href="#">先行赔付</a>
				</li>
				<li class="lss">
					<span>下载手机版</span>
					<div class="clearfix lss-pa">
						<div class="fl lss-img"><img src="${ctx}/static/front/my_add_img/img/icon/code.png" alt=""></div>
						<div class="fl" style="padding-left:20px">
							<h4>扫描下载云购APP</h4>
							<p>把优惠握在手心</p>
							<P>把潮流带在身边</P>
							<P></P>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="pc-footer-lin">
			<div class="center">
				<p>友情链接：
					卡宝宝信用卡
					梦芭莎网上购物
					手游交易平台
					法律咨询
					深圳地图
					P2P网贷导航
					名鞋库
					万表网
					叮当音乐网
					114票务网
					儿歌视频大全
				</p>
				<p>
					京ICP证1900075号  京ICP备20051110号-5  京公网安备110104734773474323  统一社会信用代码 91113443434371298269B  食品流通许可证SP1101435445645645640352397
				</p>
				<p style="padding-bottom:30px">版物经营许可证 新出发京零字第朝160018号  Copyright©2011-2015 版权所有 ZHE800.COM </p>
			</div>
		</div>
	</div>
</footer>

<script type="text/javascript">
layui.use(['layer'], function(){
	  var layer = layui.layer;
	});
    //hover 触发两个事件，鼠标移上去和移走
    //mousehover 只触发移上去事件
    $(".top-nav ul li").hover(function(){
        $(this).addClass("hover").siblings().removeClass("hover");
        $(this).find("li .nav a").addClass("hover");
        $(this).find(".con").show();
    },function(){
        //$(this).css("background-color","#f5f5f5");
        $(this).find(".con").hide();
        //$(this).find(".nav a").removeClass("hover");
        $(this).removeClass("hover");
        $(this).find(".nav a").removeClass("hover");
    })
       function getOrderItemPage(orderNo){ 
    	 console.log(orderNo);
    	/*   $.ajax({
				url : '${ctx}/order/getOrderItemData.shtml',
				data : {'orderNo' : orderNo},
				type : 'POST',
				dataType : 'json',
				success : function(jsonObj) { */
				 /* var index = layer.open({
						type:2,
						title:'订单详情页',
						offset:'50px',
						area:['800px','400px'],
						content:  '${ctx}/order/getOrderItemPage.shtm',
				 }) */
				/* }
    	  }) */
			    var index = layer.open({
				type:2,
				title:'订单详情页',
				offset:'50px',
				area:['1500px','400px'],
				shadeClose: true,
				content:  '${ctx}/order/getOrderItemPage.shtml?orderNo='+orderNo,
			    }); 
			  /*   window.location.href='${ctx}/order/getOrderItemPage.shtml?orderNo='+orderNo; */
				 } 
				/* 1234567891 */
					/* $("#orderItem"+orderNo).html(), */
					/* '${ctx}/order/getOrderItemPage.shtml', */
			  
			/* window.location.href="${ctx}/order/getOrderItemPage.shtml?orderNo=" + orderNo */
		  /*  window.location.href="${ctx}/order/getOrderItemPage.shtml"; */
		  
		  function checkAll(){
			  $("input[name=selectCheckbox]").prop("checked",$("#checkAll").is(":checked"));
			  var checkeds = $("input[name=selectCheckbox]:checked");
			  $("#count").html(checkeds.length);
			  refreshTotalPrice();
		  }
		  function selectProductStatus(productId){
			  var checkboxs = $('input[name=selectCheckbox]');
			  var checked = $('input[name=selectCheckbox]:checked');
			  $('#count').html(checked.length);
			  if(checkboxs.length==checked.length){
				  $('#checkAll').prop('checked',true);
			  }else{
				  $('#checkAll').prop('checked',false);
			  }
			  refreshTotalPrice();
		  }
		  function refreshTotalPrice(){
			  var checkeds = $('input[name=selectCheckbox]:checked');
			  var totalPrice=0.00;
			  for(var i=0;i<checkeds.length;i++){
			  var checkboxId = checkeds[i].getAttribute('id');
			  var id = checkboxId.substr('checkbox'.length);
			  var cartItemTotalPrice = $("#cartItemTotalPrice"+id).html();
			  totalPrice+=parseFloat(cartItemTotalPrice);
			  }
			  $('#totalPrice').html(totalPrice);
		  }
		  function go(){
			  layer.tips('产品研发中','#go',{
				  tips:[1,'green'],
                  time:1000,  			  
			  })
		  }
		
</script>
</body>
</html>