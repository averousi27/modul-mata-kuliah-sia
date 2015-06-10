<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
 <jsp:include page="header.jsp" />
		<div class="page-title">
			<h3>Horizontal Menu</h3>
			<div class="page-breadcrumb">
				<ol class="breadcrumb">
					<li><a href="${pageContext.servletContext.contextPath}/">Beranda</a></li> 
					<li class="active">Kelola Rencana Pembelajaran</li>
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
	                                            <li role="presentation"><a href="#tab2" data-toggle="tab"><i class="fa fa-bars m-r-xs"></i>Isian Bahan Kajian</a></li>  
	                                            <li role="presentation"><a href="#tab3" data-toggle="tab"><i class="fa fa-calendar m-r-xs"></i>Daftar Rencana Pembelajaran</a></li>  
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
	                                                    	<h4 class="title">Isian Bahan Kajian</h4>
	                                                        	<div class="form-group">
																	<label>Mata Kuliah</label>
																	<select id="idMK" name="idMK" class="form-control">
																			<option value="">Pilih kode dan nama mata kuliah</option> 
																		<c:forEach items="${mkList}" var="mk"> 
																			<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
																		</c:forEach> 
																	</select> 
																</div> 
	                                                        </div> 
	                                                    </div>
	                                                </div>
	                                                <div class="tab-pane fade" id="tab2">
	                                                    <div class="row m-b-lg"> 
	                                                        <div class="col-md-8 col-md-offset-2">
			                                                    <h4 class="title">Isian Bahan Kajian</h4> 
															      	<input type="hidden" id="idSilabus" name="idSilabus" value=""/>
				                                                    <div class="form-group">
																		<label>Bahan Kajian</label>
																		<input type="text" class="form-control col-md-4" placeholder="Berisi bahan kajian (keyword) rencana pembelajaran" id="bahanKajian" /> 
																	</div> 	 
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <div class="tab-pane fade" id="tab3">
	                                                    <div class="row m-b-lg"> 
	                                                        <div class="col-md-8 col-md-offset-2">
			                                                    <h4 class="title" id="titlerp"></h4>
			                                                    	<input type="hidden" id="idRP" name="idRP" value=""/>
			                                                    	<table class="table"> 
		                                                            	<thead>
		                                                            		<tr>
			                                                            		<td>Minggu Ke-</td>
			                                                            		<td>Aksi</td>
		                                                            		</tr>
		                                                            	</thead> 
		                                                            	<tbody>
		                                                            		<tr id="rowRPPerTemuNew"> 
					                                                   			<td><input type="text" class="form-control col-md-4" placeholder="Tambah rencana pembelajaran per pertemuan" id="inputRPPerTemu" readonly="readonly"></td>
		                                                            			<td><button type="button" class="btn btn-success" onClick="showModal(this)" name=""><i class="glyphicon glyphicon-plus"></i></button></td>
		                                                            		</tr>
		                                                            	</tbody>
		                                                            </table>	 
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                                <div class="tab-pane fade" id="tab4">
	                                                    <h2 class="no-s">Selesai</h2>
	                                                    <div class="alert alert-info m-t-sm m-b-lg" role="alert" id="goodbyeWizard"> 
	                                                    	Pengisian rencana pembelajaran selesai dilakukan
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
												        <h4 class="modal-title">Isian Rencana Pembelajaran per Pertemuan</h4>
												      </div>
												      <div id="tambahRPBaru">	
													      <div class="modal-body">
														      	<div class="row">
															      	<div class="col-md-8 col-md-offset-2"> 
															      		<form:form role="form" action="login" class="formdetail">
																      		<input type="hidden" id="idRP" name="idRP" value=""/>
				                                                    		<div class="form-group">
																				<label>Minggu Pembelajaran Ke-</label>
																				<input type="number" min="1" max="16" class="form-control col-md-4" placeholder="Berisi angka minggu pembelajaran" id="mingguPemb" required="true"  digits="true"/>
																				<input type="hidden" value="" id="idRPPerTemu" />
																			</div> 
																			<div class="form-group">
																				<label>Waktu Pembelajaran</label>
																				<input type="number" min="50" max="150" class="form-control col-md-4" placeholder="Berisi angka menit waktu pembelajaran" id="waktuPemb" required="true" digits="true"/>
																			</div>
																			<div class="form-group">
																				<label>Metode Pembelajaran</label>
																				<select id="idMetodePemb" name="idMetodePemb" class="form-control">
																						<option value="">Pilih metode pembelajaran</option> 
																					<c:forEach items="${metodePembList}" var="metodePemb"> 
																						<option value="${metodePemb.idMetodePemb}">${metodePemb.namaMetodePemb}</option>
																					</c:forEach> 
																				</select> 
																			</div>
																			<div class="form-group">
																				<label>Indikator Penilaian</label>
																				<input type="text" class="form-control col-md-4" placeholder="Berisi isian indikator penilaian" id="indikatorPenilaian" required="true"/>
																			</div>  
																			<div class="form-group">
																				<label>Bentuk Penilaian</label>
																				<select id="idBentuk" name="idBentuk" class="form-control">
																						<option value="">Pilih bentuk penilaian</option> 
																					<c:forEach items="${bentukList}" var="bentuk"> 
																						<option value="${bentuk.idBentuk}">${bentuk.namaBentuk}</option>
																					</c:forEach> 
																						<option value="">Tidak ada bentuk penilaian</option>
																				</select> 
																			</div>
																			<div class="form-group">
																				<label>Bobot Penilaian</label>
																				<input type="number" min="0" max="100" class="form-control col-md-4" placeholder="Berisi angka skala puluhan bobot penilaian" id="bobotPenilaian" required="true" digits="true"/>
																			</div> 
																		</form:form>
					                                                </div>
				                                              </div>
													      </div><!-- modal-body  --> 
													      <div class="modal-footer">
													      	<button type="button" class="btn btn-primary pull-right" onclick="simpanRPPerTemu(this)">Next &gt;</button>
													      </div>
													   </div><!-- end tambahRPBaru -->
													   <div class="hide" id="tambahMateriPembBaru">	
													      <div class="modal-body">
														      	<div class="row">
															      	<div class="col-md-12"> 
															      		<input type="hidden" id="idRPPerTemu" name="idRPPerTemu" value=""/>
															      		<table class="table"> 
			                                                            	<thead>
			                                                            		<tr>
				                                                            		<td>Materi Pembelajaran</td>
				                                                            		<td>Aksi</td>
			                                                            		</tr>
			                                                            	</thead> 
			                                                            	<tbody>
			                                                            		<tr id="rowMateriPembNew">
			                                                            			<td>
							                                                   			 <select id="idDetailSilabus" name="idDetailSilabus" class="form-control">
																							<option value="">Pilih materi pembelajaran untuk mata kuliah</option> 
																								<c:forEach items="${dsList}" var="dsList"> 
																									<option value="${dsList.idDetailSilabus}">${dsList.silabus.mk.namaMK} - ${dsList.pokokBahasan}</option>
																								</c:forEach> 
																						</select>
																					</td>
																					<td><button type="button" class="btn btn-success" onClick="simpanMateri(this)"><i class="glyphicon glyphicon-plus"></i></button></td>
	                                                                    		</tr>
			                                                            	</tbody>
			                                                            </table> 
					                                                </div>
				                                              </div>
													      </div><!-- modal-body  --> 
													      <div class="modal-footer">
													      </div>
													   </div><!-- end tambahMateriPembBaru --> 
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
						$("#idMK").select2();
						$("#idMetodePemb").select2();
						$("#idBentuk").select2();
						$("#idDetailSilabus").select2();
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
						showModal = function showModal(button){
							$('#myModal').modal({
								backdrop: 'static',
							    keyboard: false,
							});
							$("tr.rowRPPerTemu").each(function(index, element) {
								$(element).remove();
							});
							var idRPPerTemu = $(button).attr("name"); //diambil dari halaman ketiga saat melakukan edit RP per pertemuan 
							//console.log("idRPPerTemu : "+idRPPerTemu);
							if(idRPPerTemu!=""){
								$("#idRPPerTemu").val(idRPPerTemu);
								/*---------------memanggil data RP Per Pertemuan----------------*/
								$.ajax({
									type:'GET',
									url: context_path+'rencanapembelajaran/kelola/editrppertemu',
									dataType:'json',
									data: {'idRPPerTemu' : $("#idRPPerTemu").val()},
									traditional:true,
									success:function(data){  
										if(data.data!=null){    
											$("#mingguPemb").val(data.data.mingguPembKe);
											$("#waktuPemb").val(data.data.waktuPemb);
											$("#idMetodePemb").val(data.data.metodePemb.idMetodePemb);
											$("#indikatorPenilaian").val(data.data.indikatorPenilaian);
											if(data.data.bentukPenilaian==null){
												$("#idBentuk").val("");
											}
											else{
												$("#idBentuk").val(data.data.bentukPenilaian.idBentuk);
											} 
											if(data.data.bobotPenilaian==null){
												$("bobotPenilaian").val(0);
											}
											else{
												$("#bobotPenilaian").val(data.data.bobotPenilaian); 
											} 
										}
									}
								}); 
								/*---------------memanggil data RP Per Pertemuan----------------*/
							} 
						};
						closeModal = function closeModal(button){ 
							 if($("#tambahRPBaru").hasClass("hide")){
								 $("#tambahRPBaru").toggleClass("hide");
							 }
							 if($("#tambahMateriPembBaru").hasClass("hide")==false){
								 $("#tambahMateriPembBaru").toggleClass("hide");
							 }  
							 $("#mingguPemb").val("");
							 $("#waktuPemb").val("");
							 $("#idMetodePemb").val("");
							 $("#indikatorPenilaian").val("");
							 $("#idBentuk").val("");
							 $("#bobotPenilaian").val(""); 
							 $("#idDetailSilabus").val("");
							 
							 $("tr.rowMateriPemb").each(function(index, element) {
									$(element).remove();
								});
							 /*-------------get rp per temu---------*/
								$.ajax({
									type:'GET',
									url: context_path+'rencanapembelajaran/kelola/getrppertemu',
									dataType: 'json',
									data : {'idRP': $("#idRP").val()},
									success: function(data){  
										//console.log(data.data);
										if(data.data!=null){  
											for(var i=0; i<data.data.length; ++i){ 
												$("#rowRPPerTemuNew").before(
													"<tr class='rowRPPerTemu'>" 
													+"<td><input type='text' class='form-control col-md-4' value='RP minggu ke-"+ data.data[i].mingguPembKe + "' readonly='readonly'/></td>"
													+"<td><button type='button' class='btn btn-primary'  onclick='showModal(this)' name='"+data.data[i].idRPPerTemu+"'><i class='glyphicon glyphicon-pencil'></i></button></td>" 
													+"</tr>"		
												); 
											}  
										}
									} 
								});
							 	/*-------------end get rp per temu---------*/ 
							 $("#idRPPerTemu").val(""); 
						}; 
						simpanRPPerTemu = function simpanRPPerTemu(button){ 
							/*---------------simpan RP per pertemuan----------------*/ 
							$.ajax({
								type:'POST',
								url: context_path+'rencanapembelajaran/kelola/simpanrppertemu',
								dataType:'json',
								data: {'idRPPerTemu': $("#idRPPerTemu").val(), 'idRP' : $("#idRP").val(), 'mingguPemb' : $("#mingguPemb").val(),
									'waktuPemb': $("#waktuPemb").val(), 'idMetodePemb' : $("#idMetodePemb").val(),
									'indikatorPenilaian' : $("#indikatorPenilaian").val(), 'idBentuk' : $("#idBentuk").val(),
									'bobotPenilaian': $("#bobotPenilaian").val()},
								traditional:true, 
								success:function(data){    
									if(data.data!=null){
										console.log(data.data.idRPPerTemu);
										$("#idRPPerTemu").val(data.data.idRPPerTemu); 
// 										$("inputRPPerTemu").val("");
										$("#tambahRPBaru, #tambahMateriPembBaru").toggleClass("hide");
// 										$("#rowRPPerTemuNew").before(
// 											"<tr class='rowRPPerTemu'>" 
// 											+"<td><input type='text' class='form-control col-md-4' value='RP minggu ke-"+ data.data.mingguPembKe + "' readonly='readonly'/></td>"
// 											+"<td><button type='button' class='btn btn-primary'  onclick='showModal(this)' name='"+data.data.idRPPerTemu+"'><i class='glyphicon glyphicon-pencil'></i></button></td>" 
// 											+"</tr>"		
// 										); 
									}
								},
								error: function(data){
									toastr["error"]("Error input", "Salah satu input yang Anda masukkan salah");  
								}
								
							}); 
							/*---------------end simpan RP per pertemuan----------------*/ 
							/*---------------ambil materi per pertemuan----------------*/
							
							//console.log("idRPPerTemu : "+$("#idRPPerTemu").val());
							$.ajax({
								type:'GET',
								url: context_path+'rencanapembelajaran/kelola/getmateri',
								dataType:'json',
								data: {'idRPPerTemu': $("#idRPPerTemu").val()},
								traditional:true,
								success:function(data){    
									if(data.data!=null){  
										for(var i=0; i<data.data.length;++i){
											console.log(data.data[i].detailSilabus.pokokBahasan);
											$("#rowMateriPembNew").before(
													'<tr class="rowMateriPemb">' 
		                                       		+	'<td><input type="text" class="form-control col-md-4" readonly="readonly" value="'+data.data[i].detailSilabus.pokokBahasan+'"></td>'
		                                    		+	'<td><button type="button" class="btn btn-danger" onClick="deleteMateri(this)" name="'+data.data[i].idMateriSilabus+'"><i class="glyphicon glyphicon-minus"></i></button></td>'
		                                    		+'</tr>'
											); 
										}  
									}	
								}
							});
							/*---------------end ambil materi per pertemuan----------------*/
						}
						simpanMateri = function simpanMateri(button){
							/*---------------simpan materi per pertemuan----------------*/
							$.ajax({
								type:'POST',
								url: context_path+'rencanapembelajaran/kelola/simpanmateri',
								dataType:'json',
								data: {'idDetailSilabus' : $("#idDetailSilabus").val(), 'idRPPerTemu': $("#idRPPerTemu").val()},
								traditional:true,
								success:function(data){  
									toastr["success"]("Rencana pembelajaran sudah tersimpan");  
									if(data.data!=null){     
										$("#rowMateriPembNew").before(
												'<tr class="rowMateriPemb">' 
	                                       		+	'<td><input type="text" class="form-control col-md-4" readonly="readonly" value="'+data.data.detailSilabus.pokokBahasan+'"></td>'
	                                    		+	'<td><button type="button" class="btn btn-danger" onClick="deleteMateri(this)" name="'+data.idMateriSilabus+'"><i class="glyphicon glyphicon-minus"></i></button></td>'
	                                    		+'</tr>'
											); 
										$("idDetailSilabus").val(""); 
									}	
								}
							});
							/*---------------end materi per pertemuan----------------*/
						}
						deleteMateri = function deleteMateri(button){
							/*---------------simpan materi per pertemuan----------------*/
							var idMateriSilabus = $(button).attr("name");
							console.log(idMateriSilabus);
							$.ajax({
								type:'POST',
								url: context_path+'rencanapembelajaran/kelola/deletemateri',
								dataType:'json',
								data: {'idMateriSilabus' : idMateriSilabus},
								traditional:true,
								success:function(data){  
									if(data.message!=null){    
										toastr["success"]("Materi pembelajaran sudah dihapus");
										$(button).closest("tr").remove();
									}
								}
							});
							/*---------------end materi per pertemuan----------------*/
						}
						function validateTab(index){  
							/*---------------kondisi untuk tab 1----------------*/
							if(index==0){   
								if($("#idMK").val()  == ""){
									toastr["error"]("Error input", "Salah satu input yang Anda masukkan salah");  
									return false;
								}
								else if($("#idMK").val()!=""){
									/*-------------memanggil silabus lewat mata kuliah---------*/ 
									$.ajax({
										type:'GET',
										url: context_path+'rencanapembelajaran/kelola/getsilabus',
										dataType:'json',
										data: {'idMK' : $("#idMK").val()},
										traditional:true,
										async:false,
										success:function(data){  
											//console.log(data.data);
											if(data.data!=null){     
												$("#idSilabus").val(data.data.idSilabus); 
												/*-------------memanggil rp lewat silabus---------*/
												$.ajax({
													type:'GET',
													url: context_path+'rencanapembelajaran/kelola/getrp',
													dataType:'json',
													data: {'idSilabus' : data.data.idSilabus},
													traditional:true,
													success:function(data){ 
														//console.log(data.data);
														if(data.data!=null){  
															$("#bahanKajian").val(data.data.bahanKajian);
															$("#idRP").val(data.data.idRP);
														}
													}
												});
												/*-------------end memanggil rp lewat silabus---------*/ 
												//return true;
											} 
											//return false;
										}
									});   
									/*-------------end memanggil silabus lewat mata kuliah---------*/
									//console.log($("#idSilabus").val());
									if($("#idSilabus").val()!=""){ 
										//console.log("ini setelah masuk kondisi if : "+$("#idSilabus").val());
										return true;
									}
									else{
										toastr["error"]("Silabus tidak ditemukan");
										return false;
									}
								}
							}
							/*---------------end kondisi untuk tab 1----------------*/
							
							/*---------------kondisi untuk tab 2----------------*/
							else if(index==1){   
								if($("#idRP").val()==""){
									/*-------------simpan rp---------*/
									$.ajax({
										type:'POST',
										url: context_path+'rencanapembelajaran/kelola/simpanrp',
										dataType:'json',
										data: {'idSilabus' : $("#idSilabus").val(), 
											'bahanKajian' : $("#bahanKajian").val()},
										traditional:true, 
										succes: function(data){
											$("#idRP").val(data.data.idRP);
										}
									});
									/*-------------end simpan rp---------*/
								}
								else{
									/*-------------edit rp---------*/
									$.ajax({
										type:'POST',
										url: context_path+'rencanapembelajaran/kelola/editrp',
										dataType:'json',
										data: {'idRP': $("#idRP").val(), 'idSilabus' : $("#idSilabus").val(),
											'bahanKajian' : $("#bahanKajian").val()},
										traditional:true
									});
									/*-------------end edit rp---------*/
								}
								/*-------------simpan rp---------*/
								/*-------------get rp per temu---------*/
								$.ajax({
									type:'GET',
									url: context_path+'rencanapembelajaran/kelola/getrppertemu',
									dataType: 'json',
									data : {'idRP': $("#idRP").val()},
									success: function(data){  
										//console.log(data.data);
										if(data.data!=null){  
											for(var i=0; i<data.data.length; ++i){ 
												$("#rowRPPerTemuNew").before(
													"<tr class='rowRPPerTemu'>" 
													+"<td><input type='text' class='form-control col-md-4' value='RP minggu ke-"+ data.data[i].mingguPembKe + "' readonly='readonly'/></td>"
													+"<td><button type='button' class='btn btn-primary'  onclick='showModal(this)' name='"+data.data[i].idRPPerTemu+"'><i class='glyphicon glyphicon-pencil'></i></button></td>" 
													+"</tr>"		
												); 
											}  
										}
									} 
								});
							 	/*-------------end get rp per temu---------*/ 
								return true;
							} 
							/*---------------end kondisi untuk tab 2----------------*/   
							
							/*---------------kondisi untuk tab 3----------------*/
							else if(index==2){  
								$("#idRP").val("");
								$("#idSilabus").val("");
								return true;
							}
							/*---------------end kondisi untuk tab 3----------------*/  
							
							/*---------------kondisi untuk tab 4----------------*/
							else if(index==3){  
							}
							/*---------------end kondisi untuk tab 4----------------*/  
						};
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
		