<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en"  ng-app="myApp" ng-controller="adminCtrl">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>SabayNham</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
	<!-- Remove this Robots Meta Tag, to allow indexing of site -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
				<!-- Bootstrap CSS -->
		<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/css/bootstrap-theme.min.css">
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css">
				
	 <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/static/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/static/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/static/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- My Styles -->
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/css/admin/dashboard.css">

	<!-- Rany Script -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		
		
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<!-- W3CSS -->
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	
	<script src="${pageContext.request.contextPath}/resources/static/js/jquery.bootpage.min.js" type="text/javascript"></script>
	
					<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/jquery.fancybox.css?v=2.1.5"/>	
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/jquery.fancybox.js?v=2.1.5"></script>
		
			
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/jquery.mousewheel-3.0.6.pack.js"></script>
				
				<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />	
				
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
				
									<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/css/themes/jquery.filer-dragdropbox-theme.css">
	<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}/resources/static/jQuery.filer/css/jquery.filer.css?v=1.0.5"/>
	
		<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/js/jquery.filer.js?v=1.0.5"></script>
				
				<script src="${pageContext.request.contextPath}/resources/static/jQuery.filer/js/custom.js?v=1.0.5"></script>
				
				<!--[if IE]>
			          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
			    <![endif]-->	
</head>
<body>
