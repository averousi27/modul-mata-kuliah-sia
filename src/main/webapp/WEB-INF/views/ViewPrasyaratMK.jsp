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
	<title>Kelola Prasyarat Mata Kuliah</title>
	
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
				<div class="row" id="masterpage"> 
						<div class="col-md-12" style="margin-bottom:10px;">
							 <div class="panel panel-white">
								<div class="panel-heading clearfix">
									<h4 class="panel-title">Mata Kuliah</h4>
								</div>
								<div class="panel-body">  
								<p>Tabel menampilkan prasyarat mata kuliah</p>
										
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>Status Aktif</label>
												<select id="filter" name="filter">
													<option value="false">Aktif</option>
													<option value="">Semua</option>
												</select>
											</div>
										</div>
										<div class="col-md-8 masteractions panel-body">
											<div class="btn-action pull-right">
											</div>
										</div>
									</div> 
									<form class="tableform">
										<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover table-checkable table-colvis datatable">
											<thead>
												<tr>
													<td>
														<input class="checkbox-all" type="checkbox" id="flat-checkbox-1"> 
													</td> 
													<td>Kode MK</td> 
													<td>Nama MK</td> 
													<td>Kode Prasyarat MK</td> 
													<td>Nama Prasyarat MK</td> 
													<td>Status hapus</td>
													<td>Aksi</td>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
										</div>
									</form>
					<div class="row">
						<div class="col-md-8 masteractions">
							<div class="pull-right">  
								<button type="button" class="btn btn-primary btn-block" onclick="location.href='${pageContext.servletContext.contextPath}/matakuliah/capaianbelajar/'">
									  Selanjutnya >>
								</button>
							</div>
							&nbsp;
							<div class="pull-right"> 
								<button type="button" class="btn btn-primary btn-block" onclick="location.href='${pageContext.servletContext.contextPath}/matakuliah/satuanmanajemen/'">
									 << Kembali
								</button>
							</div>
						</div> 
					</div> 
								</div>
							</div>
						</div>
					</div>
				<div class="row" id="master-detail" style="display:none;"> 
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-white">
								<div class="panel-heading clearfix">
									<h4 class="panel-title">Mata Kuliah</h4>
								</div>
								<div class="panel-body">
									<h4 id="title">Kelola prasyarat mata kuliah</h4>
									<form:form role="form" action="login" commandName="prasyaratMK" class="formdetail"> 
										<div class="form-group">
											<label>Kode dan Nama Mata Kuliah</label>
											<select id="idMK" name="idMK" class="form-control">
													<option value="">Pilih kode dan nama mata kuliah</option> 
												<c:forEach items="${mkList}" var="mk"> 
													<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
												</c:forEach> 
											<select>
										</div> 
										<div class="form-group">
											<label>Kode dan Nama Mata Kuliah Prasyarat</label>
											<select id="mkIdMK" name="mkIdMK" class="form-control">
													<option value="">Pilih kode dan nama mata kuliah prasyarat</option> 
												<c:forEach items="${mkList}" var="mk"> 
													<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
												</c:forEach>  
											<select>
										</div>
										<div class="form-group detailcontrol">
										</div>
							        </form:form>
							      </div>
							  </div>
						</div>
				</div> 
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script>
					$(document).ready(function(){
						$('#masterpage').masterPage(
						{
							detailFocusId: '#idPrasyaratMK',
							dataUrl: context_path+'matakuliah/prasyarat/json',
							detailUrl: context_path+'matakuliah/prasyarat/edit',
							addUrl: context_path+'matakuliah/prasyarat/simpan',
							editUrl: context_path+'matakuliah/prasyarat/simpan',
							deleteUrl: context_path+'matakuliah/prasyarat/deletemany',
							primaryKey: 'idPrasyaratMK',
					        order: [[1,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<input class="checkbox-data" type="checkbox" name="idPrasyaratMK[]" value="'+data+'">';
									}
								},
								/* kode mata kuliah */
								{ "bVisible":    true }, 
								/* Nama mata kuliah */
								{ "bVisible":    true }, 
								/* kode mata kuliah */
								{ "bVisible":    true }, 
								/* nama mata kuliah */
								{ "bVisible":    true },
								/*status hapus*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[5]=='false') return "Aktif";
										return "Terhapus";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[5]=='false') return action += ' <button type="button" class="btn btn-danger deleterow">Hapus</button>';
										return action;
									}
								}
							],
							validationRules: {idMK:{required: true}, mkIdMK:{required: true}},
							filters: [{id:'#filter', name:'statusPrasyarat'}],
							callOnFillForm : function(response,options){ 
								$("#idPrasyaratMK").val(response.data.idPrasyaratMK); 
								$("#idMK").val(response.data.childMK.idMK);
								$("#mkIdMK").val(response.data.parentMK.idMK);
							}
						});
					});
				</script>
				<!-- akhir script custom pada halaman -->
				
				<!-- akhir dari content content -->
				
				<!-- footer -->
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
			</div>
		</div> 
	</body>
</html>
		