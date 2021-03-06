<%@page import="com.saturn.app.utils.DateUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新车</title>
<%@ include file="/app/includes/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/app/js/kindEditor/css/default.css" />
<script src="<%=request.getContextPath()%>/app/js/kindEditor/kindeditor.js"></script>
<script src="<%=request.getContextPath()%>/app/js/kindEditor/lang/zh_CN.js"></script>
<script src="<%=request.getContextPath()%>/app/js/kindEditor/plugins/filemanager/filemanager.js"></script>
<script type="text/javascript">
	
	function add() {
		var typeValue = $('#cid').combogrid('getValue');
		
		if (typeValue == "") {
			alert("目录标识不能为空!");
			return;
		} 

		var brand = $('#brand').combobox('getValue');
		var model = $('#model').combobox('getValue');
		var series = $('#series').combobox('getValue');
		
		if (brand == "" || model == "" || series == "") {
			alert("品牌型号系列不能为空!");
			return;
		} 
		
		$('#addForm').submit();
	}
	
	$(function() {
		$('#price').focus();
		
		$('#brand').combobox({
			width : 250,
			onSelect:function(record){
				$('#model').combobox('enable');
				$('#model').combobox('clear');
				$('#model').combobox('reload', '<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#brand').combobox('getValue'));
				
				$('#series').combobox('clear');
				$('#series').combobox('disable');
				
				$('#brandName').val(record.text);
		    }
		});
		
		$('#model').combobox({
			width : 250,
			onSelect:function(record){
				$('#series').combobox('enable');
				$('#series').combobox('clear');
				$('#series').combobox('reload', 
					'<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=' + $('#model').combobox('getValue'));
				
				$('#modelName').val(record.text);
		    }
		});
		
		$('#series').combobox({
			width : 250,
			onSelect:function(record){
				$('#seriesName').val(record.text);
		    }
		});
		
		$('#model').combobox('disable');
		$('#series').combobox('disable');
		
		$('#cid').combogrid({
			width : 250,
			panelWidth : 600,
			idField : 'id',
			textField : 'name',
			pagination : true,
			rownumbers : true,
			sortName : 'id',
			sortOrder : 'asc',
			remoteSort : true,
			url : '<%=request.getContextPath()%>/app/website/content/listRoot.action',
			columns : [[
				{field : 'id',title : '标识',width : 150, sortable : true},
				{field : 'name',title : '名称',width : 100, sortable : true},
				{field : 'hasShowName',title : '显示', width : 120, sortable : true}
			]]
		});
	});
	
	KindEditor.ready(function(K) {
		var uploadbutton = K.uploadbutton({
			button : K('#uploadButton')[0],
			fieldName : 'imgFile',
			url : '<%=request.getContextPath()%>/app/system/upload/upload.action?dir=appCar',
			afterUpload : function(data) {
				if (data.error === 0) {
					var url = K.formatUrl(data.url, 'absolute');
					
					K('#image').val(url);
					$('#imageShow').attr("src", url);
				} else {
					alert(data.message);
				}
			}
		});
		
		uploadbutton.fileBox.change(function(e) {
			uploadbutton.submit();
		});
		
		var editor = K.editor({
			fileManagerJson : '<%=request.getContextPath()%>/app/system/upload/fileManager.action?dir=appCar'
		});
		K.plugin('filemanager').call(editor, K);
		K('#filemanager').click(function() {
			var dialog = editor.plugin.filemanagerDialog({
				viewType : 'VIEW',
				clickFn : function(url, title) {
					K('#image').val(url);
					editor.hideDialog();
					$('#imageShow').attr("src", url);
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="panel" class="easyui-panel" title="添加新车"
		icon="icon-add-form" collapsible="true" style="padding: 10px;">
		<form id="addForm"
			action="<%=request.getContextPath()%>/app/car/newcar/add.action"
			method="post">
			<table>
				<tr><td>
					<table class="table-form">
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>目录标识:</td>
							<td><select id="cid" name="cid"></select></td>
							<td><div id="cidTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>品牌:</td>
							<td><select id="brand" class="easyui-combobox"
								name="brand" url="<%=request.getContextPath()%>/app/system/dict/listDictByType.action?type=car" valueField="id"
								textField="text" editable="false"></select></td>
							<td><div id="brandTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>型号:</td>
							<td><select id="model" class="easyui-combobox"
								name="model" valueField="id"
								textField="text" editable="false"></select></td>
							<td><div id="modelTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>系列:</td>
							<td><select id="series" class="easyui-combobox"
								name="series" valueField="id"
								textField="text" editable="false"></select></td>
							<td><div id="seriesTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>价格:</td>
							<td><input id="price" name="price" type="text"></input></td>
							<td><div id="priceTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>促销价格:</td>
							<td><input id="realPrice" name="realPrice" type="text"></input></td>
							<td><div id="realPriceTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right">礼品:</td>
							<td><input id="gift" name="gift" type="text"></input></td>
							<td><div id="giftTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right">销售代表:</td>
							<td><input id="saller" name="saller" type="text"></input></td>
							<td><div id="sallerTip"></div></td>
						</tr>
						<tr>
							<td style="text-align:right"><span style="color: red">*</span>图片:</td>
							<td><input id="image" name="image" type="text" value="" readonly="readonly"/></td>
							<td><div id="imageTip"></div></td>
						</tr>
						<tr>
							<td colspan="3">
								<div style="padding: 10px;">
									<a href="#" onclick="add()" class="easyui-linkbutton"
										iconCls="icon-add">添加</a> <a href="javascript:history.back(-1)"
										class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
								</div></td>
								<td></td>
						</tr>
					</table>
				</td>
				<td>
					<img id = "imageShow" alt="" src="" width="150px"/> 
					<div>
					<a id="filemanager" href="#" class="easyui-linkbutton" iconCls="icon-add">服务器</a>
					<input type="button" id="uploadButton" value="上传" style="width:70"/> 
					</div>
				</td>
				</tr>
			</table>
			<input id="brandName" type="hidden" name="brandName" type="text" value=""></input>
			<input id="modelName" type="hidden" name="modelName" type="text" value=""></input>
			<input id="seriesName" type="hidden" name="seriesName" type="text" value=""></input>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$.formValidator.initConfig({
			formid : "addForm"
		});
		
		$("#price").formValidator({
			onfocus : "请正确填写价格"
		}).regexValidator({
			regexp : "number"
		}).inputValidator({
			min : 1,
			max : 20,
			onerror : "不超过20个字符"
		});
		
		$("#realPrice").formValidator({
			onfocus : "请正确填写价格"
		}).regexValidator({
			regexp : "number"
		}).inputValidator({
			min : 1,
			max : 20,
			onerror : "不超过20个字符"
		});
		
		$("#gift").formValidator({
			emtpy : true,
			onfocus : "内容不超过50字符"
		}).inputValidator({
			max : 50,
			onerror : "不超过50个字符"
		});
		
		$("#image").formValidator({
			onfocus : "内容不超过100字符"
		}).inputValidator({
			min : 1,
			max : 100,
			onerror : "不超过100个字符"
		});
	});
</script>
</html>






