<%@ page language="java" contentType="text/html; charset=utf-8"
     pageEncoding="utf-8"%>
 <%@ include file="../common/header.jsp" %>
 <!DOCTYPE html>
 <html lang="en">
 <head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
     <title> - 用户列表</title>
 </head>
 <body>
    <div class="demoTable">
     用户名：
   <div class="layui-inline">
    <input class="layui-input" name="id" id="searchName" autocomplete="off">
   </div>
  <button class="layui-btn" data-type="search">搜索</button>
   <button class="layui-btn layui-btn-danger" data-type="deleteAll">批量删除</button>
  </div>
 	<table class="layui-hide" id="datagrid"></table>
 	 <script type="text/html" id="toolbar">
   		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 	</script>
 	<script>
 		layui.use('table', function(){
 		  var table = layui.table;
 		  
 		  table.render({
 		    elem: '#datagrid', //要渲染哪个表格
 		    url:'${ctx}/user/pageList.action', //异步数据接口
 		    cellMinWidth: 50, //列宽自动分配，全局定义常规单元格的最小宽度
 		    cols: [[
 		      {field:'id', title: 'ID', sort: true},
 		      {field:'username', title: '用户名', sort: true},
 		      {field:'password', title: '密码', sort: true},
 		      {field:'email', title: '邮箱', sort: true},
 		      {field:'phone', title: '电话', sort: true},
 		      {field:'question', title: '提示问题', sort: true},
 		      {field:'answer', title: '答案', sort: true},
 		      {field:'role', title: '角色', sort: true},
 		      {fixed: 'right', width : 170, toolbar: '#toolbar'} 
 		    ]],
 		    page: true,
 		    id:"listReload"
 		  });
 		/*  var $ = layui.$, 用layui内置的jquery*/ 
 		 active = {
 			    search: function(){
 			      var searchName = $('#searchName');
 			      
 			      //执行重载
 			      table.reload('listReload', {
 			        page: {
 			          curr: 1 //重新从第 1 页开始
 			        }
 			        ,where: {
 			        	username:$("#searchName").val(),
 			        }
 			      });
 			    },
 			   deleteAll : function() {
  		    	var checkStatus = table.checkStatus('listReload');
  		    	var data = checkStatus.data;
  		    	console.log(checkStatus.data) //获取选中行的数据
  		    	console.log(checkStatus.data.length) //获取选中行数量，可作为是否有选中行的条件
  		    	console.log(checkStatus.isAll) //表格是否全选
  		    	layer.confirm('确定要删除这' + data.length + '条数据吗？', function(index){
  			    	var ids = util.getSelectedIds(data);
  			    	$.ajax({
  			    		url : '${ctx}/user/deleteAll.action',
  			    		data : {'ids' : ids},
  			    		dataType : 'json',
  			    		success : function(jsonData) {
  			    			if(jsonData.code == util.SUCCESS) {
  		       					mylayer.success(jsonData.msg);
  		       					active.search();
  		       				} else {
  		       					mylayer.errorMsg(jsonData.msg);
  		       				}
  			    		}
  		    	});
  	    	});
   		    },
   		    
 			  };
		 		 $('.demoTable .layui-btn').on('click', function(){
		 		    var type = $(this).data('type');
		 		    active[type] ? active[type].call(this) : '';
		 		  });
 		});
 	</script>
 </body>
 </html>