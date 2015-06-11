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
					<li><a href="${pageContext.servletContext.contextPath}/matakuliah/kelola/">Kelola Mata Kuliah</a></li>
					<li><a href="${pageContext.servletContext.contextPath}/matakuliah/prasyarat/">Kelola Mata Kuliah Prasyarat</a></li>
					<li class="active">Kelola Mata Kuliah untuk Satuan Manajemen</li>
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
								<p>Tabel menampilkan mata kuliah untuk satuan manajemen</p>
										
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
											<div class="btn-action pull-right"> </div>
										</div> 
									</div>
							<form class="tableform">
							  <div class="table-responsive">
								<table class="table table-striped table-bordered table-hover table-checkable table-colvis datatable">
									<thead>
										<tr>
											<td>
												<div class="checkbox">
													<input class="checkbox-all" type="checkbox" id="flat-checkbox-1">
												</div>
											</td> 
											<td>Kode MK</td>  
											<td>Nama MK</td>  
											<td>Nama Satuan Manajemen</td> 
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
								<button type="button" class="btn btn-primary btn-block" onclick="location.href='${pageContext.servletContext.contextPath}/matakuliah/prasyarat/'">
									  Selanjutnya >>
								</button>
							</div>
							&nbsp;
							<div class="pull-right"> 
								<button type="button" class="btn btn-primary btn-block" onclick="location.href='${pageContext.servletContext.contextPath}/matakuliah/kelola/'">
									 << Kembali
								</button>
										</div>
									</div>
								</div> 
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="master-detail" style="display:block;"> 
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-white">
								<div class="panel-heading clearfix">
									<h4 class="panel-title">Mata Kuliah</h4>
								</div>
							<div class="panel-body">
									<h4 id="title">Assign mata kuliah untuk satuan manajemen</h4>
									<form:form role="form" action="login" commandName="satManMK" class="formdetail"> 
										<div class="form-group">
											<label>Kode dan Nama Mata Kuliah</label>
											<select id="idMK" name="idMK" class="form-control">
													<option value="">Pilih kode dan nama mata kuliah</option> 
												<c:forEach items="${mkList}" var="mk"> 
													<option value="${mk.idMK}">${mk.kodeMK} - ${mk.namaMK}</option>
												</c:forEach> 
											</select>
										</div> 
										<div class="form-group">
											<label>Nama Satuan Manajemen</label>
											<select id="idSatMan" name="idSatMan" class="form-control"> 
													<option value="">Pilih nama satuan manajemen</option> 
													<c:forEach items="${satManList}" var="satman"> 
														<option value="${satman.idSatMan}">${satman.nmSatMan }</option>
													</c:forEach> 
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
						$("#idSatMan").select2();
						$("#idMK").select2();

						$("#master-detail").hide();
						$('#masterpage').masterPage(
						{
							detailFocusId: '#idSatManMK',
							dataUrl: context_path+'matakuliah/satuanmanajemen/json',
							detailUrl: context_path+'matakuliah/satuanmanajemen/edit',
							addUrl: context_path+'matakuliah/satuanmanajemen/simpan',
							editUrl: context_path+'matakuliah/satuanmanajemen/simpan',
							deleteUrl: context_path+'matakuliah/satuanmanajemen/deletemany',
							primaryKey: 'idSatManMK',
					        order: [[2,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<div class="checkbox-data"><input type="checkbox" name="idSatManMK[]" value="'+data+'"></div>';
									}
								},
								/* kode mata kuliah */
								{ "bVisible":    true }, 
								/* Nama mata kuliah */
								{ "bVisible":    true }, 
								/* nama satuan manajamen */
								{ "bVisible":    true },
								/*status hapus*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[4]=='false') return "Aktif";
										return "Terhapus";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[4]=='false') return action += ' <button type="button" class="btn btn-danger deleterow">Hapus</button>';
										return action;
									}
								}
							],
							validationRules: {idMK:{required: true}, idSatMan:{required: true}},
							filters: [{id:'#filter', name:'statusSatManMK'}],
							callOnFillForm : function(response,options){ 

								//$("#idSatMan").select2();
								//$("#idMK").select2();
								$("#idSatManMK").val(response.data.idMK);
								$("#idMK").val(response.data.mk.idMK);
								$("#idSatMan").val(response.data.satMan.idSatMan);
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
		