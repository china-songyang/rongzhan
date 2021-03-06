<%@page import="com.saturn.car.NewCar"%>
<%@page import="com.saturn.app.utils.DateUtils"%>
<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.WebUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/formValidatorRegex.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/saturn/formValidator/validator.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/testCode.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/app/themes/icon.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/app/js/jquery.easyui.min.js"></script>
<title>新车列表</title>
</head>
<script type="text/javascript">
	var code = '';

	function reload() {
		code = __getTestCode();
		$('#testCodeImage').attr("src", "<%=request.getContextPath()%>/app/system/testcode/test.do?code=" + code);
		return false;
	}
	
	$(function() {
		code = __getTestCode();
		$('#testCodeImage').attr("src", "<%=request.getContextPath()%>/app/system/testcode/test.do?code=" + code);
		//$('#testCode').val(code);
	});
	
	function getCarByModule(module){
		window.location.href="cus_cars.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&aid=<%=WebUtils.getRootCid(request) %>.sall.new&model="+module;
		return;
	}
</script>
<body>
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">  
	<%@ include file="include/navigate.jsp" %>
    <div class="right">
    	<div class="nr">
        <div class="ybt">
        <div class="biaoti"><%=__aname %></div>
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;新车列表</div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
       	  <div class="neirong">
       	  <%
        	//List cars = NewCar.getListByCid(WebUtils.getRootCid(request));
        	//String rootcid = WebUtils.getRootCid(request);
        	String model = request.getParameter("model");
        	//System.out.println(model);
        	if(model==null||"".equals(model))
        		model="car.buick.kaiyue";
        	List cars = NewCar.getListByModel(WebUtils.getRootCid(request),model);
        	%>
       	  <table width="726" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="640" border="0" align="center" cellpadding="0" cellspacing="10" class="xcbt">
  <tr>
  	<td width="102" class="<%="car.buick.kaiyue".equals(model)||model==null||"".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.kaiyue');">凯越</td>
   <td width="102" class="<%="car.buick.junwei".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.junwei');">君威</td>
   <td width="102" class="<%="car.buick.yinglanggt".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.yinglanggt');">英朗GT</td>
   <td width="102" class="<%="car.buick.junyue".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.junyue');">君越</td>
   <td width="102" class="<%="car.buick.yinglangxt".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.yinglangxt');">英朗XT</td>
   <td width="102" class="<%="car.buick.gl8".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.gl8');">别克GL8</td>
   <td width="102" class="<%="car.buick.linyindadao".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.linyindadao');">林荫大道</td>
   <td width="102" class="<%="car.buick.angkelei".equals(model)?"biaoge":"biaogeh" %>" onclick="getCarByModule('car.buick.angkelei');">昂科雷</td>
  </tr>
</table>

<table width="726" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/redtiao.gif" width="726" height="11" /></td>
  </tr>
</table>
<div style="width:726px;">
  <table class="tableline" cellpadding="0" cellspacing="1">
    <tr align="center" height="30px">
      <td width="200px" style="border-bottom: dashed thin #ffffff;">图片</td>
      <td width="200px" style="border-bottom: dashed thin #ffffff;">品牌车型</td>
      <td width="100px" style="border-bottom: dashed thin #ffffff;">报价(万元)</td>
      <td width="33px" style="border-bottom: dashed thin #ffffff;">详情</td>
      <td width="200px" style="border-bottom: dashed thin #ffffff;">操作</td>
    </tr>
    <%
     			for (int i = 0; i < cars.size(); ++i) {
     				NewCar car = (NewCar) cars.get(i);
     				String bgcolor = "#f8f7f2";
     				if(i % 2 == 1)
     					bgcolor = "#ffffff";
     				if(i==0){
     					%>
     					<tr align="center" height="98px" bgcolor="<%=bgcolor%>">
			      <td height="82" style="border-top: dashed thin #ababab;border-width:1px;"><img src="<%=car.getImage()!=null?car.getImage():"images/car.gif" %>" width="130" height="98" /></td>
			      <td style="border-top: dashed thin #ababab;border-width:1px;"><a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>"><span style="color:#1478c6;"><%=car.getSeriesName() %></span></a></td>
			      <td style="border-top: dashed thin #ababab;border-width:1px;"><span style="color:#da251c;">&nbsp;<%=car.getPrice() %></span></td>
			      <td style="border-top: dashed thin #ababab;border-width:1px;"><a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>">详情</a></td>
			      <td style="border-top: dashed thin #ababab;border-width:1px;">
			      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.change','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/dingche.gif"/></a> 
			      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.drive','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/shijia.gif"/></a> 
			      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.bookcar','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/zhihuan.gif"/></a>
			      </td>
			    </tr>
     					<%
     				}else{
     		%>
       		<tr align="center" height="98px" bgcolor="<%=bgcolor%>">
		      <td ><span style="border-top: dashed thin #ababab;border-width:1px;"><img src="<%=car.getImage()!=null?car.getImage():"images/car.gif" %>" width="130" height="98" /></span></td>
		      <td ><a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>"><span style="color:#1478c6;"><%=car.getSeriesName() %></span></a></td>
		      <td ><span style="color:#da251c;">&nbsp;<%=car.getPrice() %></span></td>
		      <td ><a href="cus_cardetail.jsp?cid=<%=WebUtils.getRootCid(request) %>.sall&model=<%=car.getModel() %>">详情</a></td>
		      <td >
		      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.change','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/dingche.gif"/></a> 
		      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.drive','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/shijia.gif"/></a> 
		      <a href="javascript:void(0);" onclick="addBookCar('bookcar.type.bookcar','<%=car.getBrand() %>','<%=car.getModel() %>','<%=car.getSeries() %>','<%=car.getBrandName() %>','<%=car.getModelName() %>','<%=car.getSeriesName() %>')"><img src="images/zhihuan.gif"/></a>
		      </td>
		    </tr>
     		<%
     				}
     			}
     		%>
  </table>
</div>
<table width="715" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
</table></td>
  </tr>
</table></div>
        </div>
        <div class="ydi"><img src="images/nr_xia.gif" /></div>
        </div>
    </div><!--右侧-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</div>
<script type="text/javascript">
function addBookCar(type,brand,model,series,brandName,modelName,seriesName){
	
	if('bookcar.type.drive'==type){
		//试驾
		$('#typeName').val('试驾');
		$('#bookcar').attr('title','试驾');
	}else if('bookcar.type.change'==type){
		//置换
		$('#typeName').val('置换');
		$('#bookcar').attr('title','置换');
	}else if('bookcar.type.bookcar'==type){
		//订车
		$('#typeName').val('订车');
		$('#bookcar').attr('title','订车');
	}
	$('#cid').val('<%=WebUtils.getRootCid(request)%>');
	$('#type').val(type);
	$('#brand').val(brand);
	$('#model').val(model);
	$('#series').val(series);
	$('#brandName').val(brandName);
	$('#modelName').val(modelName);
	$('#seriesName').val(seriesName);
	
	
	$('#bookcar').window('open');
}
function submitForm() {
	if ($('#phone').val() == '') {
		alert('请填写电话');
		$('#phone').focus();
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/app/car/bookcar/addByClient.do', 
		type : 'post',         
		dataType : 'json',     
		data : {
			phone : $("#phone").val(),         
			text : $("#text").val(),         
			type : $("#type").val(),  
			typeName : $("#typeName").val(),     
			cid : '<%=WebUtils.getRootCid(request)%>',     
			brand : $("#brand").val(),  
			model : $("#model").val(),  
			series : $("#series").val(), 
			brandName : $("#brandName").val(),  
			modelName : $("#modelName").val(),  
			seriesName : $("#seriesName").val(),
			state : 'bookcar.state.false',
			stateName : '未确认',
			createTime : '<%=DateUtils.getSystemTime()%>',
			license : '',
			bookTime : ''
		},
		success : function(data) {
			if (data) {
				$("#createTime").val('');
				$("#text").val('');
				$('#phone').val('');
				
				$('#cid').val('');
				$('#type').val('');
				$('#typeName').val('');
				$('#brand').val('');
				$('#model').val('');
				$('#series').val('');
				$('#brandName').val('');
				$('#modelName').val('');
				$('#seriesName').val('');
				
				$('#bookcar').window('close');
				alert('保存成功!');
			}
		} 
	});
}
</script>
<div id="bookcar" class="easyui-window" closed="true" modal="true" title="预约服务" style="width:400px;height:200px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/car/bookcar/add.action"
			method="post">
			<table class="table-form">
				
				<tr>
					<td style="text-align:right"><span style="color: red">*</span>电话:</td>
					<td><input id="phone" name="phone" type="text"></input></td>
					<td><div id="phoneTip"></div></td>
				</tr>
				<tr>
					<td style="text-align:right">内容:</td>
					<td><textarea id="text" name="text" type="text" cols="40" rows="5"></textarea></td>
					<td><div id="textTip"></div></td>
				</tr>
				<tr>
					<td colspan="3">
						<div style="padding: 10px;">
							<a href="javascript:void(0);" onclick="submitForm()" class="easyui-linkbutton"
								iconCls="icon-add">添加</a>
						</div></td>
						<td></td>
				</tr>
			</table>
			<input id="cid" type="hidden" name="cid" type="text" value=""></input>
			<input id="brand" type="hidden" name="brand" type="text" value=""></input>
			<input id="model" type="hidden" name="model" type="text" value=""></input>
			<input id="series" type="hidden" name="series" type="text" value=""></input>

			<input id="brandName" type="hidden" name="brandName" type="text" value=""></input>
			<input id="modelName" type="hidden" name="modelName" type="text" value=""></input>
			<input id="seriesName" type="hidden" name="seriesName" type="text" value=""></input>

			<input id="state" type="hidden" name="state" type="text" value="bookcar.state.false"></input>
			<input id="stateName" type="hidden" name="stateName" type="text" value="未确认"></input>
			<input id="type" type="hidden" name="type" type="text" value=""></input>
			<input id="typeName" type="hidden" name="typeName" type="text" value=""></input>
			
			<input id="createTime" type="hidden" name="createTime" type="text" value="<%=DateUtils.getSystemTime()%>"></input>
		</form>
	</div>
</body>
</html>