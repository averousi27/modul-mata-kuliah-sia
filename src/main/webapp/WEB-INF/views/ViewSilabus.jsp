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
	<title>Kelola Silabus</title>
	
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
			<script src="${pageContext.servletContext.contextPath}/resources/plugins/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
				
				<div class="row"> 
						<div class="col-md-12 "> 
							<div class="panel panel-white">
								<div class="panel-body">
	                                    <div id="rootwizard">
	                                        <ul class="nav nav-tabs" role="tablist">
	                                            <li role="presentation" class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-university m-r-xs"></i>Pilih Mata Kuliah</a></li> 
	                                            <li role="presentation"><a href="#tab2" data-toggle="tab"><i class="fa fa-bars m-r-xs"></i>Kelola Pokok Bahasan Silabus</a></li>
	                                            <li role="presentation"><a href="#tab3" data-toggle="tab"><i class="fa fa-book m-r-xs"></i>Kelola Pustaka Silabus</a></li>
	                                            <li role="presentation"><a href="#tab4" data-toggle="tab"><i class="fa fa-check m-r-xs"></i>Selesai</a></li>
	                                        </ul>
	                                        <div class="progress progress-sm m-t-sm">
	                                            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
	                                            </div>
	                                        </div> 
	                                        <form id="wizardForm">
	                                            <div class="tab-content">
	                                                <div class="tab-pane active fade in" id="tab1">
	                                                    <div class="row m-b-lg">
	                                                        <div class="col-md-6 col-md-offset-3"> 
	                                                    	<h4 class="title">Pilih Mata Kuliah</h4>
	                                                        	<div class="form-group">
																	<label>Mata Kuliah</label>
																	<select id="idMK" name="idMK" class="form-control">
																			<option value="">Pilih kode dan nama mata kuliah</option> 
																		<c:forEach items="${mkList}" var="mk"> 
																			<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
																		</c:forEach> 
																	</select>
																	<div id="warning"></div>
																</div>
	                                                        </div> 
	                                                    </div>
	                                                </div>
	                                                <div class="tab-pane fade" id="tab2">
	                                                    <div class="row m-b-lg"> 
	                                                        <div class="col-md-8 col-md-offset-2">
			                                                    <h4 class="title" id="titlepokokbahasan">Isian Pokok Bahasan Silabus</h4>
			                                                    		<input type="hidden" id="idSilabus" name="idSilabus" value=""/>
			                                                            <table class="table"> 
			                                                            	<thead>
			                                                            		<tr>
				                                                            		<td>Pokok Bahasan</td>
				                                                            		<td>Aksi</td>
			                                                            		</tr>
			                                                            	</thead> 
			                                                            	<tbody>
			                                                            		<tr id="rowPokokBahasanNew">
			                                                            			<td><input type="text" class="form-control col-md-4" placeholder="Berisi pokok bahasan" id="inputPokokBahasan"></td>
			                                                            			<td><button type="button" class="btn btn-success" onClick="simpanPokokBahasan()"><i class="glyphicon glyphicon-plus"></i></button></td>
	                                                                    		</tr>
			                                                            	</tbody>
			                                                            </table>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <div class="tab-pane fade" id="tab3">
	                                                    <div class="row m-b-lg"> 
	                                                        <div class="col-md-8 col-md-offset-2">
			                                                    <h4 class="title">Isian Pustaka Silabus</h4>
			                                                    		<input type="hidden" id="idSilabus" name="idSilabus" value=""/>
			                                                            <table class="table"> 
			                                                            	<thead>
			                                                            		<tr>
				                                                            		<td>Pokok Bahasan</td>
				                                                            		<td>Aksi</td>
			                                                            		</tr>
			                                                            	</thead> 
			                                                            	<tbody>
			                                                            		<tr id="rowPustakaNew">
			                                                            			<td>
							                                                   			 <select id="idPustaka" name="idPustaka" class="form-control">
																								<option value="">Pilih pustaka untuk mata kuliah</option> 
																									<c:forEach items="${pustakaList}" var="pustaka"> 
																										<option value="${pustaka.idPustaka}">${pustaka.namaPustaka}</option>
																									</c:forEach> 
																						</select>
																					</td>
																					<td><button type="button" class="btn btn-success" onClick="simpanPustaka()"><i class="glyphicon glyphicon-plus"></i></button></td>
	                                                                    		</tr>
			                                                            	</tbody>
			                                                            </table>
	                                                        </div>
	                                                    </div>
	                                                </div> 
	                                                <div class="tab-pane fade" id="tab4">
	                                                    <h2 class="no-s">Selesai</h2>
	                                                    <div class="alert alert-info m-t-sm m-b-lg" role="alert">
	                                                        Pengisian silabus selesai dilakukan !
	                                                    </div>
	                                                </div>
	                                                <ul class="pager wizard"> 
	                                                    <li class="next"><a href="#" class="btn btn-default" id="button-next" type="button">Next</a></li>
	                                                </ul>
	                                            </div>
	                                        </form>
	                                        </div>
                                        <div id="myModal" class="modal fade">
										  <div class="modal-dialog modal-lg">
										    <div class="modal-content  ">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModal(this)"><span aria-hidden="true">&times;</span></button>
										        <h4 class="modal-title">Pemetaan Capaian Pembelajaran Mata Kuliah</h4>
										      </div>
										      <div class="modal-body">
										      	<div class="row">
										      	<div class="col-md-8 col-md-offset-2">
										      	  <table class="table"> 
	                                                   	<thead>
	                                                   		<tr>
	                                                    		<td>Capaian Pembelajaran Mata Kuliah</td>
	                                                    		<td>Aksi</td>
	                                                   		</tr>
	                                                   	</thead> 
	                                                   	<tbody>
	                                                   		<input type="hidden" id="idDetailSilabus" value=""/>
	                                                   		<tr id="rowCapaianNew">
		                                                   		<td>
		                                                   			 <select id="idCapPembMK" name="idCapPembMK" class="form-control">
																			<option value="">Pilih capaian pembelajaran mata kuliah</option> 
																				<c:forEach items="${cpmkList}" var="cpmk"> 
																					<option value="${cpmk.idCapPembMK}">${cpmk.mk.namaMK} - ${cpmk.namaCapPembMK}</option>
																				</c:forEach> 
																	</select>
																</td>
	                                                   			<td><button type="button" class="btn btn-success" onclick="simpanCapaian(this)" id="btnSimpanCapaian"><i class="glyphicon glyphicon-plus"></i></button></td>
	                                                        </tr>
	                                                   	</tbody>
                                                   </table>
                                                   </div>
                                                   </div>
										      </div>
										      <div class="modal-footer">
										      </div>
										    </div><!-- /.modal-content -->
										  </div><!-- /.modal-dialog -->
										</div><!-- /.modal -->
															
	                            </div><!-- panel body -->
	                         </div> <!-- panel white -->
	                    </div>
	             </div>
				
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script>
					$(document).ready(function(){
						var idPemetaanSilabus="";
						var idPustaka="";
						toastr.options = {
								  "closeButton": true,
								  "debug": false,
								  "newestOnTop": false,
								  "progressBar": false,
								  "positionClass": "toast-top-right",
								  "preventDuplicates": false,
								  "showDuration": "300",
								  "hideDuration": "1000",
								  "timeOut": "5000",
								  "extendedTimeOut": 0,
								  "showEasing": "swing",
								  "hideEasing": "linear",
								  "showMethod": "fadeIn",
								  "hideMethod": "fadeOut",
								  "tapToDismiss": true
								}
						$('#rootwizard').bootstrapWizard({ 
							onTabClick: function(tab, navigation, index){
								toastr["warning"]("Anda harus mengisi form");  
								return false;
							},
							onNext : function(tab, navigation, index){  
								isValidTab = validateTab(index - 1);
								if(!isValidTab){
									return false;
								} 
								return true;
							}
						});
						closeModal = function closeModal(button){ 
							$("#rowCapaianNew").val(""); 
							$("tr.rowCapaian").each(function(index, element) {
								$(element).remove();
							});
						};
						function validateTab(index){  
							/*---------------kondisi untuk tab 1----------------*/
							if(index==0){ 
								var idMKString = $("#idMK").val();  
								if(idMKString==""){
									toastr["error"]("Error input", "Salah satu input yang Anda masukkan salah");  
									return false;
								}
								else if(idMKString!=""){
									/*-------------memanggil id mata kuliah---------*/
									$.ajax({
										type:'POST', 
										url: context_path+'silabus/kelola/simpan',
										dataType: 'json',
										data : {'idMK' : $("#idMK").val()},
										traditional : true, 
										success : function(data){  
											$("#idSilabus").val(data.data.idSilabus);
											$("#titlepokokbahasan").html('Isian Pokok Bahasan '+data.data.mk.namaMK); 
											$.ajax({
												type:'GET', 
												url: context_path+'silabus/kelola/getpokokbahasanlist',
												dataType: 'json',
												data : {'idSilabus' : data.data.idSilabus},
												traditional : true, 
												success : function(data){  
													if(data.data!=null){
														for(var i=0; i<data.data.length; ++i){
															$("#rowPokokBahasanNew").before(
																	"<tr class='rowPokokBahasan' name='"+data.data[i].idDetailSilabus+"'>" +
																		"<td><input type='text' id='textPokokBahasan' class='form-control col-md-4' value='" + data.data[i].pokokBahasan + "'/></td>" +
																		"<td><button type='button' class='btn btn-danger' name='"+ data.data[i].idDetailSilabus +"' onclick='deletePokokBahasan(this)'><i class='glyphicon glyphicon-minus'></i></button>&nbsp;" +
																		"<button type='button' class='btn btn-warning' onclick='updatePokokBahasan(this)'><i class='glyphicon glyphicon-floppy-disk'></i></button>&nbsp;" +
																		"<button type='button' class='btn btn-primary'  onclick='showModal(this)'><i class='glyphicon glyphicon-pencil'></i></button></td>" +
																	"</tr>"	
																);
														} 
													} 
												}  
											});
										}  
									});
									
									/*-------------end memanggil id mata kuliah---------*/
									return true;
								}
							}
							/*---------------end kondisi untuk tab 1----------------*/
							
							/*---------------kondisi untuk tab 2----------------*/
							else if(index==1){ 
								if(idPemetaanSilabus==""){ 
									toastr["warning"]("Anda harus mengisi form");  
									return false;
								}
								else if(idPemetaanSilabus!=""){ 
									return true;
								}
							}
							/*---------------end kondisi untuk tab 2----------------*/   
							
							/*---------------kondisi untuk tab 3----------------*/
							else if(index==2){ 
								if(idPemetaanSilabus==""){ 
									toastr["warning"]("Anda harus mengisi form");  
									return false;
								}
								else if(idPemetaanSilabus!=""){ 
									return true;
								}
							}
							/*---------------end kondisi untuk tab 3----------------*/  
							
							/*---------------kondisi untuk tab 4----------------*/
							else if(index==3){ 
								if(idPemetaanSilabus==""){ 
									toastr["warning"]("Anda harus mengisi form");  
									return false;
								}
								else if(idPemetaanSilabus!=""){ 
									return true;
								}
							}
							/*---------------end kondisi untuk tab 4----------------*/  
							
						}; 
						showModal = function showModal(button){
							$('#myModal').modal({
								backdrop: 'static',
							    keyboard: false,
							});
							idDetailSilabus = $(button).closest("tr").attr("name"); 
							$("#idDetailSilabus").val(idDetailSilabus); 
							/*-------------get pemetaan silabus---------*/
							$.ajax({
								type:'GET',
								url: context_path+'silabus/kelola/getpemetaanlist',
								dataType: 'json',
								data : {'idDetailSilabus': idDetailSilabus},
								success: function(data){ 
									console.log(data);
									if(data.data!=null){ 
										for(var i=0; i<data.data.length; ++i){
											$("#rowCapaianNew").before(
												"<tr class='rowCapaian'>" 
												+"<td><input type='text' class='form-control col-md-4' value='"+ data.data[i].capPembMK.namaCapPembMK + "' readonly='readonly'/></td>"
												+"<td><button type='button' class='btn btn-danger' name='"+data.data[i].idPemetaanSilabus+"' onclick='deletePemetaan(this)'><i class='glyphicon glyphicon-minus'></i></td>"
												+"</tr>"		
											);
											idPemetaanSilabus = data.data.idPemetaanSilabus;
										} 
									}
								} 
							});
							/*-------------end get pemetaan silabus---------*/
						};
						simpanPokokBahasan = function simpanPokokBahasan(){
							var pokokBahasan = $("#inputPokokBahasan").val();
							
							if($('#inputPokokBahasan').val()!=""){ 
								/*-------------tambah pokok bahasan---------*/
								$.ajax({
									type:'POST', 
									url: context_path+'silabus/kelola/simpandetail',
									dataType: 'json',
									data : {'idSilabus' : $("#idSilabus").val(), 
										'pokokBahasan' : $('#inputPokokBahasan').val()},
									traditional : true, 
									success : function(data){  
										toastr["success"]("Data pokok bahasan telah tersimpan");   
										$("#rowPokokBahasanNew").before(
											"<tr class='rowPokokBahasan' name='"+data.data.idDetailSilabus+"'>" +
												"<td><input type='text' id='textPokokBahasan' class='form-control col-md-4' value='" + data.data.pokokBahasan + "'/></td>" +
												"<td><button type='button' class='btn btn-danger' name='"+ data.data.idDetailSilabus +"' onclick='deletePokokBahasan(this)'><i class='glyphicon glyphicon-minus'></i></button>&nbsp;" +
												"<button type='button' class='btn btn-warning' onclick='updatePokokBahasan(this)'><i class='glyphicon glyphicon-floppy-disk'></i></button>&nbsp;" +
												"<button type='button' class='btn btn-primary'  onclick='showModal(this)'><i class='glyphicon glyphicon-pencil'></i></button></td>" +
											"</tr>"	
										);
										$("#inputPokokBahasan").val(""); 
									}  
								});
								/*-------------end tambah pokok bahasan---------*/
							}
							else{
								toastr["error"]("Error input", "Salah satu input yang Anda masukkan salah");
							}
						};
						updatePokokBahasan = function updatePokokBahasan(button){
							var idDetailSilabus = $(button).closest("tr").attr("name");
							var tr = $(button).closest("tr");
							var pokokBahasan = $(tr).find("input").val();
							console.log(pokokBahasan);
							console.log(idDetailSilabus);
							/*-------------edit detail silabus--------*/
							$.ajax({
								type:'POST',
								url: context_path+'silabus/kelola/editdetail',
								dataType: 'json',
								data: {'idDetailSilabus' : idDetailSilabus, 'pokokBahasan' : pokokBahasan},
								traditional: true,
								success: function(data){ 
									toastr["success"]("Data pokok bahasan sudah diperbaharui");
								}, 
								error: function(data){
									toastr["error"]("Error data input", "Data tidak dapat diperbaharui");
								}
							});
							/*-------------edit detail silabus--------*/
						}
						
						deletePokokBahasan = function deletePokokBahasan(button){
							var idDetailSilabus = $(button).closest("tr").attr("name");
							var tr = $(button).closest("tr");
							var pokokBahasan = $(tr).find("input").val(); 
							console.log(idDetailSilabus);  
							/*-------------hapus detail--------*/
							$.ajax({
								type:'POST',
								url: context_path+'silabus/kelola/hapusdetail',
								dataType: 'json',
								data: {'idDetailSilabus' : idDetailSilabus},
								traditional: true,
								success: function(data){ 
									toastr["success"]("Data pokok bahasan sudah dihapus");
									$(button).closest("tr").attr("name").remove();
								}, 
								error: function(data){
									toastr["error"]("Error data input", "Data tidak dapat diperbaharui");
								}
							});
							/*-------------end hapus detail--------*/
						} 
						
						simpanCapaian = function simpanCapaian(button){     
							if($("#idCapPembMK").val()!=""){
								/*-------------tambah capaian untuk silabus---------*/
								$.ajax({
									type:'POST', 
									url: context_path+'silabus/kelola/simpanpemetaan', 
									dataType:"json",	
									data: {'idDetailSilabus' : $("#idDetailSilabus").val(),
										'idCapPembMK' : $("#idCapPembMK").val() },
									traditional:true,
									success: function(data){ 
										toastr["success"]("Data pemetaan capaian telah tersimpan");		 
										$("#rowCapaianNew").before(
											"<tr class='rowCapaian'>" 
											+"<td><input type='text' class='form-control col-md-4' value='"+ data.data.capPembMK.namaCapPembMK + "' readonly='readonly'/></td>"
											+"<td><button type='button' class='btn btn-danger' name='"+data.data.idPemetaanSilabus+"' onclick='deletePemetaan(this)'><i class='glyphicon glyphicon-minus'></i></td>"
											+"</tr>"		
										);
										$("#idCapPembMK").val(""); 
										idPemetaanSilabus = data.data.idPemetaanSilabus;
									},
									error: function(e){
										toastr["error"]("Error input", "Capaian pembelajaran MK harus dipilih");		 
									}
								});

								/*-------------end tambah capaian untuk silabus---------*/ 
							}
							else{
								toastr["error"]("Error data input","Salah satu input yang Anda masukkan salah");
							}
							
						}
						
						deletePemetaan = function deletePemetaan(button){  
								var idPemetaan = $(button).attr("name");
								console.log(idPemetaan);
								/*-------------tambah capaian untuk silabus---------*/
								$.ajax({
									type:'POST', 
									url: context_path+'silabus/kelola/hapuspemetaan', 
									dataType:"json",	
									data: {'idPemetaanSilabus' : idPemetaan},
									traditional:true,
									success: function(data){  
										$(button).closest("tr").remove();
										toastr["success"](data.message);
									}
								});

								/*-------------end tambah capaian untuk silabus---------*/  
						}
						
						simpanPustaka = function simpanPustaka(){     
							if($("#idPustaka").val()!=""){
								/*-------------tambah pustaka untuk silabus---------*/
								$.ajax({
									type:'POST', 
									url: context_path+'silabus/kelola/simpanpustaka', 
									dataType:"json",	
									data: {'idPustaka' : $("#idPustaka").val(),
										'idSilabus' : $("#idSilabus").val() },
									traditional:true,
									success: function(data){ 
										toastr["success"]("Data detail pustaka telah tersimpan");		 
										$("#rowPustakaNew").before(
											"<tr class='rowPustaka'>" 
											+"<td><input type='text' class='form-control col-md-4' value='"+ data.data.pustaka.namaPustaka + "'/></td>"
											+"<td><button type='button' class='btn btn-danger' onclick='deleteDetailPustaka(this)' name='"+data.data.idDetailPustaka+"'><i class='glyphicon glyphicon-minus'></i></td>"
											+"</tr>"		
										);
										$("#idPustaka").val("");  
										idPustaka = data.data.idPustaka;
									},
									error: function(e){
										toastr["error"]("Error input", "Pustaka mata kuliah harus dipilih");		 
									}
								});

								/*-------------end tambah pustaka untuk silabus---------*/ 
							}
							else{
								toastr["error"]("Error data input","Salah satu input yang Anda masukkan salah");
							}
							
						}
						
						deleteDetailPustaka = function deleteDetailPustaka(button){    
							var idDetailPustaka = $(button).attr("name");
							console.log(idDetailPustaka);
								/*-------------tambah pustaka untuk silabus---------*/
								$.ajax({
									type:'POST', 
									url: context_path+'silabus/kelola/hapuspustaka', 
									dataType:"json",	
									data: {'idDetailPustaka' : idDetailPustaka},
									traditional:true,
									success: function(data){ 
										toastr["success"]("Data detail pustaka telah dihapus");	 
										$(button).closest("tr").remove();
									}
								});

								/*-------------end tambah pustaka untuk silabus---------*/  
						}
						
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
		