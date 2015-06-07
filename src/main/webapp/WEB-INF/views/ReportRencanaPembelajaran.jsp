<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="shortcut icon"
		href="${pageContext.servletContext.contextPath}/resources/favicon_16.ico">
	<title>Laporan Rencana Pembelajaran</title>
	
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta charset="UTF-8">
	<meta name="description" content="Admin Dashboard Template" />
	<meta name="keywords" content="admin,dashboard" />
	<meta name="author" content="Steelcoders" />
	
	<!-- Styles -->
	<link
		href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600'
		rel='stylesheet' type='text/css'>
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/uniform/css/uniform.default.min.css"
		rel="stylesheet" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/fontawesome/css/font-awesome.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/line-icons/simple-line-icons.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/waves/waves.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/switchery/switchery.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/3d-bold-navigation/css/style.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/slidepushmenus/css/component.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/plugins/toastr/toastr.min.css"
		rel="stylesheet" type="text/css" />
		<link href="${pageContext.servletContext.contextPath}/resources/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css"/>
				
	<!-- Theme Styles -->
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/modern.min.css"
		rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/themes/white.css"
		class="theme-color" rel="stylesheet" type="text/css" />
	<link
		href="${pageContext.servletContext.contextPath}/resources/css/custom.css"
		rel="stylesheet" type="text/css" />
	
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/3d-bold-navigation/js/modernizr.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/offcanvasmenueffects/js/snap.svg-min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/jquery/jquery-2.1.3.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
		
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	        <![endif]-->
	<script>
		var context_path = "${pageContext.servletContext.contextPath}/";
	</script>
	<title>Datatable</title>
</head>	
<body class="page-header-fixed page-horizontal-bar">
	<form class="search-form" action="#" method="GET">
		<div class="input-group">
			<input type="text" name="search" class="form-control search-input"
				placeholder="Search..."> <span class="input-group-btn">
				<button
					class="btn btn-default close-search waves-effect waves-button waves-classic"
					type="button">
					<i class="fa fa-times"></i>
				</button>
			</span>
		</div>
		<!-- Input Group -->
	</form>
	<!-- Search Form -->
	<main class="page-content content-wrap">
	  <jsp:include page="header.jsp" />
	<div class="page-inner">
		<div class="page-title">
			<h3>Horizontal Menu</h3>
			<div class="page-breadcrumb">
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li><a href="#">Layouts</a></li>
					<li class="active">Horizontal Menu</li>
				</ol>
			</div>
		</div>
		<div id="main-wrapper">
		<!-- akhir dari header -->
		
		<!-- Content -->
		
	<link rel="stylesheet"
				href="${pageContext.servletContext.contextPath}/resources/plugins/jquery.datatables/media/css/jquery.dataTables.min.css">
			<script type="text/javascript"
				src="${pageContext.servletContext.contextPath}/resources/plugins/jquery.datatables/media/js/jquery.dataTables.min.js"></script>
			<link rel="stylesheet"
				href="${pageContext.servletContext.contextPath}/resources/plugins/jquery.datatables/extensions/TableTools/css/dataTables.tableTools.min.css">
			<!-- optional -->
			<script type="text/javascript"
				src="${pageContext.servletContext.contextPath}/resources/plugins/jquery.datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
			<link rel="stylesheet"
				href="${pageContext.servletContext.contextPath}/resources/plugins/jquery.datatables/extensions/ColVis/css/dataTables.colVis.min.css">
			<!-- optional -->
			<script type="text/javascript"
				src="${pageContext.servletContext.contextPath}/resources/plugins/jquery.datatables/extensions/ColVis/js/dataTables.colVis.min.js"></script>
			<!-- optional -->

			<script
				src="${pageContext.servletContext.contextPath}/resources/plugins/jquery-validation/jquery.validate.min.js"
				rel="stylesheet" type="text/javascript"></script>
			<script
				src="${pageContext.servletContext.contextPath}/resources/plugins/jquery-blockui/jquery.blockui.js"
				type="text/javascript"></script>
			<script
				src="${pageContext.servletContext.contextPath}/resources/js/jquery.masterpage.sia.js"
				type="text/javascript"></script>
			<script src="${pageContext.servletContext.contextPath}/resources/js/date.js" type="text/javascript" ></script>
			<script src="${pageContext.servletContext.contextPath}/resources/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
				
				<div class="row"> 
						<div class="col-md-12" style="margin-bottom:10px;"> 
							<div class="panel panel-white">
								<div class="panel-heading clearfix">
									<h4 class="panel-title">Laporan Silabus</h4>
								</div>
								<div class="panel-body">  
									 <div class="row">
									 	<div class="col-md-8 col-md-offset-2">  
									 			<p>Kode Mata Kuliah : ${mk2.kodeMK}</p>
									 			<p>Nama Mata Kuliah : ${mk2.namaMK}</p>
									 			<p>Rumpun Mata Kuliah : ${mk2.rumpunMK.namaRumpunMK}</p>
									 			<p>Kredit : ${mk2.jumlahSKS} sks</p>
									 			<p>Semester : ${mk2.tingkatPemb}</p>
									 			<p>Deskripsi : ${mk2.deskripsiMK}</p>
								 			<br /> 
								 			<p>Capaian Satuan Manajemen yang Didukung</p>
											<ul>
									 			<c:forEach items="${cpList}" var="cpList">
									 			 	<li>${cpList.satMan.nmSatMan} | ${cpList.deskripsiCapPemb}</li>
									 			</c:forEach>
									 		</ul>
									 		<br />
									 		<p>Capaian MK</p> 
											<ul>
									 			<c:forEach items="${cpmkList}" var="cpmkList">
									 			 	<li>${cpmkList.deskripsiCapPembMK}</li>
									 			</c:forEach>
									 		</ul>
									 		<br />
									 		<p>Pokok bahasan</p>
									 		<ul>
									 		<c:forEach items="${dsList}" var="dsList"> 
									 			<li>${dsList.pokokBahasan}</li> 
									 		</c:forEach>
									 		</ul>
									 		<br />
									 		<p>Prasyarat Mata Kuliah</p>
									 		<c:forEach items="${prasyaratList}" var="prasyaratList"> 
									 			<p>${prasyaratList.parent.namaMK}</p>
									 		</c:forEach>
									 		<br />
									 		<p>Pustaka</p>
									 		<ul>
									 		<c:forEach items="${dpList}" var="dpList"> 
									 			<li>${dpList.pustaka.namaPustaka}</li> 
									 		</c:forEach>
									 		</ul>
										</div>
										
									 </div>
								</div>
							 </div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="panel panel-white">
								<div class="panel-heading clearfix">
									<h4 class="panel-title">Laporan RP Per Pertemuan</h4>
								</div>
								<div class="panel-body">
									<table class="table">
										<thead>
											<tr>
												<th>Minggu Ke-</th>
												<th>Capaian Pembelajaran Mata Kuliah</th>
												<th>Materi Pembelajaran</th>
												<th>Metode Pembelajaran</th>
												<th>Bentuk Penilaian</th>
												<th>Indikator Penilaian</th>
												<th>Bobot Penilaian</th>
											</tr>
										</thead>
										<tbody> 
											<c:forEach items="${rpPerTemuList}" var="rpPerTemu">
												<tr>
													<td>${rpPerTemu.mingguPembKe}</td>
													<td>
														<c:set var="key" value="${rpPerTemu.idRPPerTemu}" scope="page"></c:set>
														<c:set var="listCPMK" value="${hashCPMKPerTemu[key] }" scope="page"></c:set>
														<ul>
														<c:forEach var="cpmk" items="${listCPMK}">
															<li>${cpmk.deskripsiCapPembMK}</li>
														</c:forEach>
														</ul>
													</td>
													<!--  <td>
														<ul>
														<c:forEach items="${msNewList}" var="ms">
															<c:if test="${ms.rpPerTemu.idRPPerTemu == rpPerTemu.idRPPerTemu}"> 
																	<c:forEach items="${psNewList}" var="ps">
																		<c:if test="${ps.detailSilabus.idDetailSilabus == ms.detailSilabus.idDetailSilabus}"> 
																			<li>${ps.capPembMK.deskripsiCapPembMK}</li>
																		</c:if>
																	</c:forEach>
															</c:if>
														</c:forEach>
														</ul>
													</td> -->
													<td>
														<ul>
														<c:forEach items="${msNewList}" var="ms">
															<c:if test="${ms.rpPerTemu.idRPPerTemu == rpPerTemu.idRPPerTemu}">
																<li>${ms.detailSilabus.pokokBahasan}</li>
															</c:if> 
														</c:forEach>
														</ul>
													</td>
													<td>${rpPerTemu.metodePemb.namaMetodePemb}</td>
													<td>${rpPerTemu.bentukPenilaian.namaBentuk}</td>
													<td>${rpPerTemu.indikatorPenilaian}</td>
													<td>${rpPerTemu.bobotPenilaian}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div> 
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script> 
				</script>
				<!-- akhir script custom pada halaman -->
				
				<!-- akhir dari content content -->
				
				<!-- footer -->
				</div>
				<!-- Main Wrapper -->
				<div class="page-footer">
					<p class="no-s">2015 &copy; Modern by Steelcoders.</p>
				</div>
			</div>
			<!-- Page Inner -->
			<!--content-->
	</main>
	
				<!-- Javascripts -->
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/jquery-blockui/jquery.blockui.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/switchery/switchery.min.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/uniform/jquery.uniform.min.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/waves/waves.min.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/plugins/3d-bold-navigation/js/main.js"></script>
				<script
					src="${pageContext.servletContext.contextPath}/resources/js/modern.js"></script> 
	</body>
</html>
		