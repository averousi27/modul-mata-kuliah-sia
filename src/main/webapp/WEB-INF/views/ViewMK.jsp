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
					<li class="active">Kelola Mata Kuliah</li>
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
						<div class="col-md-12 style="margin-bottom:10px;">
							 <div class="panel panel-white">
								<div class="panel-heading clearfix">
									<h4 class="panel-title">Mata Kuliah</h4>
								</div>
								<div class="panel-body">  
									<p>Tabel menampilkan mata kuliah</p>
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
											<div class="col-md-8 masteractions">
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
											<td>Kurikulum</td>
											<td>Rumpun MK</td> 
											<td>Semester</td> 
											<td>Jumlah SKS</td>   
											<td>Sifat MK</td>
											<td>Nilai Minimal MK</td>
											<td>Deskripsi MK</td>  
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
										<button type="button" class="btn btn-primary btn-block" onclick="location.href='${pageContext.servletContext.contextPath}/matakuliah/satuanmanajemen/'">
											  Selanjutnya >>
										</button>
									</div> 
									<div class="pull-right"> 
										<button type="button" class="btn btn-primary btn-block" onclick="location.href='${pageContext.servletContext.contextPath}/matakuliah/rumpun/'">
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
									<h4 id="title">Kelola mata kuliah</h4>
									<form:form role="form" action="login" commandName="mk" class="formdetail">
										<div class="form-group">
											<label>Kode Mata Kuliah</label>
												<form:input path="kodeMK" class="form-control" placeholder="Berisi kode mata kuliah" required="true" />
												<form:hidden path="idMK" class="form-control" />
										</div>
										<div class="form-group">
											<label>Nama Mata Kuliah</label>
											<form:input path="namaMK" class="form-control" placeholder="Berisi nama mata kuliah" required="true" /> 
										</div>
										<div class="form-group">
											<label>Tahun Kurikulum</label>
												<select id="idKurikulum" name="idKurikulum" class="form-control">
														<option value="">Pilih kurikulum untuk mata kuliah</option> 
													<c:forEach items="${kurikulumList}" var="kurikulum"> 
														<option value="${kurikulum.idKurikulum}">${kurikulum.thnMulai} - ${kurikulum.namaKurikulum}</option>
													</c:forEach> 
												</select>
										</div>
										<div class="form-group">
											<label>Rumpun Mata Kuliah</label>
											<select id="idRumpunMK" name="idRumpunMK" class="form-control">
													<option value="">Pilih rumpun untuk mata kuliah</option> 
												<c:forEach items="${rumpunMKList}" var="rumpunMK"> 
													<option value="${rumpunMK.idRumpunMK}">${rumpunMK.namaRumpunMK }</option>
												</c:forEach>  
												<option value=null>Tidak ada rumpun mata kuliah</option> 
											</select>
										</div>
										<div class="form-group">
											<label>Semester</label>
											<form:input path="tingkatPemb" class="form-control" placeholder="Berisi angka tingkat pembelajaran mata kuliah (semester)" required="true" digits="true"/>
										</div>
										<div class="form-group">
											<label>Jumlah SKS</label>
											<form:input path="jumlahSKS" class="form-control" placeholder="Berisi angka jumlah SKS mata kuliah" required="true" digits="true"/>
										</div>
										<div class="form-group">
											<label>Sifat Mata Kuliah</label>
											<select id="sifatMK" name="sifatMK" class="form-control" required="true">
													<option value="">Pilih sifat untuk mata kuliah</option>
													<option value="true">Wajib</option>
													<option value="false">Pilihan</option>
											</select>
										</div>
										<div class="form-group">
											<label>Nilai Minimal Mata Kuliah</label>
											<select id="idKonversi" name="idKonversi" class="form-control">
													<option value="">Pilih nilai minimal untuk mata kuliah</option> 
												<c:forEach items="${konversiNilaiList}" var="konvNilai"> 
													<option value="${konvNilai.idKonversi}">${konvNilai.huruf} - Batas bawah : ${konvNilai.batasBawah} </option> 
												</c:forEach> 
												 
											</select>
										</div>
										<div class="form-group">
											<label>Deskripsi Mata Kuliah</label>
											<form:input path="deskripsiMK" class="form-control" placeholder="Berisi deskripsi mata kuliah"/>
										</div>
										<div class="form-group">
											<label>Status Keaktifan Mata Kuliah</label>
											<select id="statusMK" name="statusMK" class="form-control">
													<option value="">Pilih status keaktifan mata kuliah</option>
													<option value="false">Aktif</option>
													<option value="true">Non-aktif</option>
											</select>
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
						//$("#idKurikulum").select2();
						//$("#idRumpunMK").select2();
						//$("#idKonversi").select2();
						$('#masterpage').masterPage(
						{
							detailFocusId: '#idMK',
							dataUrl: context_path+'matakuliah/kelola/json',
							detailUrl: context_path+'matakuliah/kelola/edit',
							addUrl: context_path+'matakuliah/kelola/simpan',
							editUrl: context_path+'matakuliah/kelola/simpan',
							deleteUrl: context_path+'matakuliah/kelola/deletemany',
							primaryKey: 'idMK',
					        order: [[2,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<input class="checkbox-data" type="checkbox" name="idMK[]" value="'+data+'">';
									}
								},
								/* kode mata kuliah */
								{ "bVisible":    true }, 
								/* nama mata kuliah */
								{ "bVisible":    true }, 
								/* tahun kurikulum */
								{ "bVisible":    false }, 
								/* nama rumpun mk */
								{ "bVisible":    false }	, 
								/* tingkat pembelajaran */
								{ "bVisible":    true }, 
								/* jumlah sks */
								{ "bVisible":    true }, 
								/* sifat MK */
								{ "bVisible":    true, 
									mRender: function(data,type,full){
										if(full[7] == 'true') return "Wajib";
										else return "Pilihan";
									}	
								}, 
								/* nilai minimal */
								{ "bVisible":    true }, 
								/* deskripsi MK */
								{ "bVisible":    false }, 
								/*status kurikulum*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[10] == 'false') return "Aktif";
										else return "Non-Aktif";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[10]=='false') action += ' <button type="button" class="btn btn-danger deleterow">Non-Aktif</button>'
										return action;
									}
								}
							],
							validationRules: {idMK:{required: false},kodeMK:{required: true}, idKurikulum:{required:true},
								namaMK:{required: true},tingkatPemb: {required:true, digits:true}, 
								jumlahSKS: {required: true, digits: true}, sifatMK: {required:true}, rumpunMK:{required:true}},
							filters: [{id:'#filter', name:'statusMK'}],
							callOnFillForm : function(response,options){ 
								$("#idMK").val(response.data.idMK);
								if(response.data.kurikulum.statusKurikulum==true){//kondisi non aktif
									$("#idKurikulum").val(""); 
								}
								else{
									$("#idKurikulum").val(response.data.kurikulum.idKurikulum); 
								}  
								$("#idKonversi").val(response.data.konversiNilai.idKonversi);
								if(response.data.rumpunMK==null){//kondisi gak punya rumpun mk
									$("#idRumpunMK").val('null'); 
								}
								else{
									$("#idRumpunMK").val(response.data.rumpunMK.idRumpunMK);  
								}  
								if(response.data.deskripsiMK==null){
									$("#deskripsiMK").val("");  
								}
							}
						});
					});
				</script>
				<!-- akhir script custom pada halaman -->
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
		