<%@page import="com.saturn.website.PaginationUtils"%>
<%@page import="com.saturn.website.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/include.jsp" %>
<title><%=WebUtils.getTitle(request) %></title>
<script src="js/swfobject_modified.js" type="text/javascript"></script>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/homepage.css" rel="stylesheet" type="text/css" />
<link href="css/page.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="beijing">
<div id="container">
<%@ include file="include/top.jsp" %>
<div id="content">
	<%@ include file="include/navigate.jsp" %>
    <div class="right">
    	<div class="ybt">
        <div class="biaoti"><%=__aname%></div>
        <div class="weizhi">您所在的位置：<a href="index.jsp">首页</a>&nbsp;|&nbsp;<a href="<%=WebUtils.getLink(__cid, null)%>"><%=__cname %></a>&nbsp;|&nbsp;<%=__aname%></div>
        <div class="clear"></div>
        </div>
        <div class="ynr">
        	<div class="xwlb">
        	<%
				String did = request.getParameter("did");
        		String indexStr = request.getParameter("index");
				Article article = Article.get(did);
				String title = "";
				String text = "";
				String datetime = "";
				String source = "";
				
				if (article != null) {
					title = article.getTitle();
					text = article.getText();
					datetime = article.getCreateTime();
					source = article.getOperaterName();
				}
			%>
            	<div class="xwbt"><%=title%></div>
                <div class="rq">[<%=datetime %>]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;来源：<%=source %></div>
           	 	<div><%=PaginationUtils.getPageText(text, indexStr)%></div>
           	 	<div><%=PaginationUtils.getPagination("detail.jsp?cid=" + __cid + "&aid=" + __aid + "&did=" + did, indexStr, text) %></div>
            </div>
        </div>
        <div class="ydi"><img src="images/nr_xia.gif" /></div>
    </div><!--右侧-->
    <div class="clear"></div>
</div><!--内容-->
<%@ include file="include/foot.jsp" %>
</body>
</html>