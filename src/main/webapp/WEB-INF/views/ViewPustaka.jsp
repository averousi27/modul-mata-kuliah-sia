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
					<li class="active">Kelola Pustaka</li>
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
									<h4 class="panel-title">Pustaka</h4>
								</div>
								<div class="panel-body">  
									<p>Tabel menampilkan pustaka untuk mata kuliah</p>
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
														<input class="checkbox-all" type="checkbox" id="flat-checkbox-1"> 
												</td> 
												<td>Nama Pustaka</td> 
												<td>Deskripsi Pustaka</td>
												<td>Sifat Pustaka</td>
												<td>Status Aktif</td>
												<td>Aksi</td>
											</tr>
										</thead>
										<tbody>
										</tbody>
								  </table>
								  </div>
							</form> 
							  </div>
						</div>
					</div>
				</div>
				<div class="row" id="master-detail" style="display:none;"> 
						<div class="col-md-6 col-md-offset-3">
							<div class="panel panel-white">
								<div class="panel-heading clearfix">
										<h4 id="title">Pustaka</h4>
								</div>
								<div class="panel-body">
									<h4 id="title">Kelola pustaka</h4>
									<form:form role="form" action="login" commandName="pustaka" class="formdetail">
										<div class="form-group">
											<label>Nama Pustaka</label>
											<form:input path="namaPustaka" class="form-control" placeholder="Berisi nama pustaka" required="true" />
											<form:hidden path="idPustaka" class="form-control" />
										</div>
										<div class="form-group">
											<label>Sifat Pustaka</label>
											<select id="sifatPustaka" name="sifatPustaka" class="form-control" required="true">
													<option value="">Pilih sifat untuk pustaka</option>
													<option value="U">Utama</option>
													<option value="P">Pendukung</option>
											</select>
										</div>
										<div class="form-group">
											<label>Deskripsi Pustaka</label>
											<form:input path="deskripsiPustaka" class="form-control" placeholder="Berisi deskripsi pustaka" /> 
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
							detailFocusId: '#idPustaka',
							dataUrl: context_path+'silabus/pustaka/json',
							detailUrl: context_path+'silabus/pustaka/edit',
							addUrl: context_path+'silabus/pustaka/simpan',
							editUrl: context_path+'silabus/pustaka/simpan',
							deleteUrl: context_path+'silabus/pustaka/deletemany',
							primaryKey: 'idPustaka',
					        order: [[1,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<input type="checkbox" class="checkbox-data" name="idPustaka[]" value="'+data+'">';
									}
								},
								/* Nama rumpun mata kuliah */
								{ "bVisible":    true },
								/* deskripsi rumpun mata kuliah */
								{ "bVisible":    false },  
								/* sifat rumpun mata kuliah */
								{ 
									"bVisible":    true, 
									mRender: function(data,type,full){
										console.log(full[3]);
										if(full[3] == "U") return "Utama";
										else if(full[3] == "P") return "Pendukung";
									}  
								},
								/*status kurikulum*/
								{ 
									"bVisible":    false,   
									mRender: function(data,type,full){
										if(full[5] == 'false') return "Aktif";
										else return "Non Aktif";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>';
										if(full[5]=='false') action += ' <button type="button" class="btn btn-danger deleterow">Non-Aktif</button>'
										return action;
									}
								}
							],
							validationRules: {idPustaka:{required: false},namaPustaka:{required: true}, sifstPustaka:{required: true}},
							filters: [{id:'#filter', name:'statusPustaka'}],
							callOnFillForm : function(response,options){ 
								$("#idPustaka").val(response.data.idPustaka);
								$("#sifatPustaka").val(response.data.sifatPustaka);
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
		