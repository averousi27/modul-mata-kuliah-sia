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
	<title>Kelola Rencana Pembelajaran</title>
	
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
									<h4 class="panel-title">Rencana Pembelajaran</h4>
								</div>
								<div class="panel-body">  
									<p>Tabel menampilkan rencana pembelajaran mingguan</p>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>Mata Kuliah</label>
												<select id="optionMK" name="idMK">
														<option value="">Pilih kode dan nama mata kuliah</option> 
													<c:forEach items="${mkList}" var="mk"> 
														<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
													</c:forEach> 
												</select>
											</div>
<!-- 											<div class="form-group"> -->
<!-- 												<label>Status Aktif</label> -->
<!-- 												<select id="filter" name="filter"> -->
<!-- 													<option value="false">Aktif</option> -->
<!-- 													<option value="">Semua</option> -->
<!-- 												</select> -->
<!-- 											</div>   -->
										</div> 
										<div class="col-md-8 masteractions">
											<div class="btn-action pull-right"> </div> 
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
												<td>Mata Kuliah</td>   
												<td>Minggu Ke-</td> 
												<td>Materi</td> 
												<td>Target</td> 
												<td>Pemetaan Capaian</td>
												<td>Bahan Kajian</td> 
												<td>Metode</td>
												<td>Waktu</td> 
												<td>Bentuk Penilaian</td>
												<td>Bobot</td>
												<td>Referensi</td>
												<td>Status Aktif</td>
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
										<button type="button" class="btn btn-primary btn-block" onclick="location.href='/modul/matakuliah/capaianbelajar/'">
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
									<h4 class="panel-title">Rencana Pembelajaran</h4>
								</div>
								<div class="panel-body">
									<h4 id="title">Kelola Rencana Pembelajaran Tiap Pertemuan</h4>
									<form:form role="form" commandName="rpPerTemu" class="formdetail"> 
										<div class="form-group">
											<label>Mata Kuliah</label>
											<select id="idMK" name="idMK" class="form-control">
													<option value="">Pilih kode dan nama mata kuliah</option> 
												<c:forEach items="${mkList}" var="mk"> 
													<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
												</c:forEach> 
											</select>
										</div>
										<div class="form-group">
											<label>Minggu Ke-</label>
											<form:input path="mingguPembKe" class="form-control" placeholder="Berisi angka minggu pembelajaran" />
										</div> 
										<div class="form-group">
											<label>Materi Pembelajaran</label>
											<form:input path="materiPemb" class="form-control" placeholder="Berisi materi pembelajaran" />
										</div>
										<div class="form-group">
											<label>Target Mingguan</label>
											<form:input path="target" class="form-control" placeholder="Berisi target pembelajaran mingguan" />
										</div>
										<div class="form-group">
											<label>Pemetaan Capaian Pembelajaran Mata Kuliah</label> 
											<br />  
											<button type="button" class="btn btn-primary" onclick="showModal()">Tambah pemetaan capaian</button>
											<div id="divCapPembMK">  
												<br /> 
<!-- 										  		<input type='hidden' name='idCapPembMK[]' id="idCapPembMK" value=null /> -->
										 	</div>
										</div>
										<div class="form-group">
											<label>Bahan Kajian</label>
											<form:input path="bahanKajian" class="form-control" placeholder="Berisi bahan kajian pembelajaran" />
										</div>
										<div class="form-group">
											<label>Metode Pembelajaran</label>
											<form:input path="metodePemb" class="form-control" placeholder="Berisi metode pembelajaran" />
										</div>
										<div class="form-group">
											<label>Waktu</label>
											<form:input path="waktuPemb" class="form-control" placeholder="Berisi angka rentang waktu pembelajaran" />
										</div>
										<div class="form-group">
											<label>Bentuk Penilaian</label>
											<form:input path="bentukPenilaian" class="form-control" placeholder="Berisi bentuk penilaian pembelajaran" />
										</div>
										<div class="form-group">
											<label>Bobot Penilaian</label>
											<form:input path="bobotPenilaian" class="form-control" placeholder="Berisi bobot penilaian pembelajaran" />
										</div>
										<div class="form-group">
											<label>Referensi</label>
											<form:input path="referensiPemb" class="form-control" placeholder="Berisi referensi pembelajaran" />
										</div> 
										<div class="form-group detailcontrol">
										</div>
							        </form:form>
							        </div>
						</div>
					</div>
				</div> 
				<div id="myModal" class="modal fade">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title">Capaian Pembelajaran Mata Kuliah</h4>
				      </div>
				      <div class="modal-body">
				      	<div id="masterpageCapPembMK"> 
							<form class="tableform">
								<table class="table table-striped table-bordered table-hover table-checkable table-colvis datatable" style="width:100%">
									<thead>
										<tr>
											<td>
												#
											</td> 
											<td>Nama Mata Kuliah</td> 
											<td>Nama Capaian</td>
											<td>Deskripsi Capaian</td>  
										</tr>
									</thead>
									<tbody>
											 
									</tbody>
								</table>
							</form>
						</div>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
									
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script>
					var showModal;
					$(document).ready(function(){  
						$('#masterpage').masterPage(
						{  
							detailFocusId: '#idRPPerTemu',
							dataUrl: context_path+'rencanapembelajaran/json',
							detailUrl: context_path+'rencanapembelajaran/edit',
							addUrl: context_path+'rencanapembelajaran/simpan',
							editUrl: context_path+'rencanapembelajaran/simpan', 
							deleteUrl: context_path+'rencanapembelajaran/deletemany',
							primaryKey: 'idRPPerTemu',
					        order: [[2,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<input type="checkbox" class="checkbox-data" name="idRPPerTemu[]" value="'+data+'">';
									}
								},
								/* nama mk */
								{ "bVisible":    true }, 
								/* minggu ke */
								{ "bVisible":    true }, 
								/* materi */
								{ "bVisible":    true }, 
								/* target mingguan */
								{ "bVisible":    false }, 
								/* pemetaan capaian belajar */
								{ "bVisible":    true },
								/* bahan kajian */
								{ "bVisible":    false },
								/* metode pembelajaran */
								{ "bVisible":    true },
								/* waktu pembelajaran */
								{ "bVisible":    true },
								/* bentuk nilai */
								{ "bVisible":    true },
								/* bobot penilaian */
								{ "bVisible":    true },
								/* referensi pembelajaran */
								{ "bVisible":    false },
								/*status hapus*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[12]=='false') return "Aktif";
										return "Terhapus";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[12]=='false') return action += ' <button type="button" class="btn btn-danger deleterow">Hapus</button>';
										return action;
									}
								}
							],
							validationRules: {idMK:{required: true}, mingguPembKe:{required: true, digits: true}, materiPemb:{required: true},
								metodePemb:{required: true}, waktuPemb:{required: true, digits: true}, bentukPenilaian: {required: true}, 
								bobotPenilaian: {required: true, digits: true}},
							filters: [{id:'#filter', name:'statusRPPerTemu'}, {id: '#optionMK', name: 'idMK'}],
							callOnFillForm : function(response,options){  
								$("#idRPPerTemu").val(response.data.idRPPerTemu);
								$("#idMK").val(response.data.kurikulum.idMK); 
								$.ajax({
									type: 'get',
									url : context_path+'rencanapembelajaran/getcappembmk/', 
									dataType : 'json',
									data : {'idRPPerTemu' : $("#idRPPerTemu").val()},
									contentType : 'application/json; charset=utf-8', 
									traditional : true, 
									success : function(data){  
										var labelId = "idInduk";
										console.log(data); 
										$("#divCapPembMK").html("<input type='hidden' name='idCapPembMK[]' value='' />"); 
										for(var i=0; i<data.data.length; ++i){
											if(data.data[i].capPembMK != null){
												
												console.log(data.data[i].capPembMK.namaCapPembMK);
												$("#divCapPembMK").append(
														"<div class='alert alert-warning alert-dismissable'>"
															+"<button type='button' id='button1' class='close' data-dismiss='alert' aria-hidden='true' onclick='removeHiddenId(\"" + labelId + i + "\")'>x</button>"
															+"<p>"+data.data[i].capPembMK.namaCapPembMK+"<p>"
														+"</div>"
														+"<input type='hidden' id='"+ labelId + i +"' name='idCapPembMK[]' value='"+data.data[i].capPembMK.idCapPembMK+"' />"		
												)
												
											}
										}
										
									},
									error: function(e){
										alert("Data capaian pembelajaran mata kuliah tidak ditemukan");
									}
								}); 
							}
						}); 
						 

						removeHiddenId = function(id){ 
							var str = '#' + id;
							var hiddenLabel = $(str);
							console.log(hiddenLabel);
							hiddenLabel.remove();
						}
						
						showModal = function (){
							$('#myModal').modal('show');
						}
						$('#myModal').on('shown.bs.modal', function (e) {
							$("#masterpageCapPembMK").find('.dataTables_length select').change();
							  //if (!data) return e.preventDefault() // stops modal from being shown
						})
						$('#masterpageCapPembMK').masterPage(
						{
							detailFocusId: '#idCapPembMK',
							dataUrl: context_path+'rencanapembelajaran/pemetaan/json',
							detailUrl: context_path+'rencanapembelajaran/pemetaan/edit',
							primaryKey: 'idCapPembMK',
					        order: [[1,"asc"]],
							editOnClick: false,
							dialogDetail: '',
							editOnClickRow: false,
							cols: [
								/* id capaian pembelajaran */
								{ 
									"bVisible":    true,
									bSortable: false,
									bSearchable: false,
									mRender: function(data,type,full){
										return '<button type="button" class="btn btn-primary">Pilih</button>';
									}
								},
								/* nama mata kuliah  */
								{ "bVisible":    true },
								/* nama capaian  */
								{ "bVisible":    true },
								/* deskripsi capaian */
								{ "bVisible":    false }, 
							],
							callOnSelect : function(aData, options){
								console.log(aData);  
								$("#divCapPembMK").append(
										"<div class='alert alert-warning alert-dismissable'>"
											+"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>"
											+"<p>"+aData[2]+"<p>"
										+"</div>" 
 										+"<input type='hidden' name='idCapPembMK[]' value='"+ aData[0] +"' />"
										);  
								$('#myModal').modal('toggle');
							}
						});  
				});  
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
				<!-- akhir dari content content -->
				
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