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
					<li class="active">Kelola Kurikulum</li>
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
									<h4 class="panel-title">Kurikulum</h4>
								</div>
								<div class="panel-body">  
								<p>Tabel menampilkan kurikulum</p>
									<div class="row">
										<div class="col-md-4 ">
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
														<td>Nama Kurikulum</td>
														<td>Satuan Manajemen</td>
														<td>Tahun Mulai</td>
														<td>Tahun Akhir</td>
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
										<h4 class="panel-title">Kurikulum</h4>
								</div>
								<div class="panel-body">
										<h4 id="title">Kelola Kurikulum</h4>
										<form:form role="form" action="login" commandName="kurikulum" class="formdetail">
											<div class="form-group">
												<label>Nama Kurikulum</label>
												<form:input path="namaKurikulum" class="form-control" placeholder="Berisi nama kurikulum" required="false" />
												<form:hidden path="idKurikulum" class="form-control" />
											</div>
											<div class="form-group">
												<label>Nama Satuan Manajemen</label>
												<select id="idSatMan" name="idSatMan" class="form-control">
														<option value="">Pilih kurikulum untuk satuan manajemen akademik</option> 
													<c:forEach items="${satManList}" var="satman"> 
														<option value="${satman.idSatMan}">${satman.nmSatMan }</option>
													</c:forEach> 
												</select>
											</div>
											<div class="form-group">
												<label>Tahun Mulai Kurikulum</label>
												<form:input path="thnMulai" class="form-control" placeholder="Berisi tahun dimulai kurikulum dengan angka" required="true" digits="true"/>
											</div>
											<div class="form-group">
												<label>Tahun Akhir Kurikulum</label>
												<form:input path="thnAkhir" class="form-control" placeholder="Berisi tahun berakhir kurikulum dengan angka" required="true" digits="true"/>
											</div>
											<div class="form-group">
												<label>Status Aktif Kurikulum</label>
												<select id="statusKurikulum" name="statusKurikulum" class="form-control">
														<option value="">Pilih status keaktifan kurikulum</option>  
														<option value="false">Aktif</option>  
														<option value="true">Non-Aktif</option>  
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
						$('#masterpage').masterPage(
						{
							detailFocusId: '#idKurikulum',
							dataUrl: context_path+'kurikulum/json',
							detailUrl: context_path+'kurikulum/edit',
							addUrl: context_path+'kurikulum/simpan',
							editUrl: context_path+'kurikulum/simpan',
							deleteUrl: context_path+'kurikulum/deletemany',
							primaryKey: 'idKurikulum',
					        order: [[3,"desc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<input type="checkbox" class="checkbox-data" name="idKurikulum[]" value="'+data+'">';
									}
								},
								/* Nama kurikulum */
								{ "bVisible":    true },
								/*Satuan manajemen*/
								{ "bVisible":    true },
								/* tahun mulai kurikulum */
								{ "bVisible":    true },
								/* tahun akhir kurikulum */
								{ "bVisible":    true },
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
							validationRules: {idKurikulum:{required: false},namaKurikulum:{required: true}, SatMan:{required: true},thnMulai:{required: true, digits:true},thnAkhir:{required: true, digits: true}},
							filters: [{id:'#filter', name:'statusKurikulum'}],
							callOnFillForm : function(response,options){
								console.log(response.data);
								console.log(response.data.satMan);
								console.log(response.data.satMan.idSatMan);
								$("#idSatMan").val(response.data.satMan.idSatMan);
							}
						});
					});
				</script>
				<!-- akhir script custom pada halaman -->
				
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
	<!-- Page Content -->
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
	</body>
</html>
		