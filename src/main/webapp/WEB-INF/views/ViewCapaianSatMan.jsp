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
					<li class="active">Kelola Capaian Belajar Satuan Manajemen</li> 
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
									<p>Tabel menampilkan capaian pembelajaran satuan manajemen</p>
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
												<td>Tahun Kurikulum</td>   
												<td>Nama Kurikulum</td>  
												<td>Nama Capaian Anak</td> 
												<td>Deskripsi Capaian Anak</td>
												<td>Nama Capaian Induk</td>
												<td>Deskripsi Capaian Induk</td>
												<td>Status Hapus</td>
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
									<h4 class="panel-title">Capaian Belajar</h4>
								</div>
								<div class="panel-body">
									<h4 id="title">Kelola capaian belajar satuan manajemen</h4>
									<form:form role="form" commandName="capPemb" class="formdetail"> 
										<div class="form-group">
											<label>Tahun Kurikulum</label>
											<select id="idKurikulum" name="idKurikulum" class="form-control">
													<option value="">Pilih tahun dan nama kurikulum</option> 
												<c:forEach items="${kurikulumList}" var="kurikulum"> 
													<option value="${kurikulum.idKurikulum}">${kurikulum.thnMulai} - ${kurikulum.namaKurikulum}</option>
												</c:forEach> 
											</select>
										</div> 
										<div class="form-group">
											<label>Nama Satuan Manajemen</label>
		<!-- 									setelah dia milih satuan manajemen yang mana, di trace induknya siapa buat ngedapetin capaian belajar dari induknya -->
											<select id="idSatMan" name="idSatMan" class="form-control"> 
													<option value="">Pilih nama satuan manajemen</option> 
													<c:forEach items="${satManList}" var="satman"> 
														<option value="${satman.idSatMan}">${satman.nmSatMan }</option>
													</c:forEach> 
											</select>
										</div> 
										<div class="form-group">
											<label>Induk Capaian Pembelajaran</label> 
											<br />  
											<button type="button" class="btn btn-primary" onclick="showModal()">Tambah induk capaian pembelajaran</button>
										</div>  
										 <div id="parentCapPemb">   
										  <input type='hidden' name='idIndukCapPemb[]' id="idInduk" value=null />
										 </div>  
										<div class="form-group">
											<label>Nama Capaian Belajar</label>
											<form:input path="namaCapPemb" class="form-control" placeholder="Berisi nama capaian pembelajaran" required="true" />
											<form:hidden path="idCapPemb" class="form-control" />
										</div> 
										<div class="form-group">
											<label>Deskripsi Capaian Belajar</label>
											<form:input path="deskripsiCapPemb" class="form-control" placeholder="Berisi deskripsi capaian pembelajaran" />
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
				        <h4 class="modal-title">Induk Capaian Pembelajaran</h4>
				      </div>
				      <div class="modal-body">
				      	<div id="masterpageCapPemb"> 
							<form class="tableform">
								<table class="table table-striped table-bordered table-hover table-checkable table-colvis datatable" style="width:100%">
									<thead>
										<tr>
											<td>
												#
											</td>
											<td>Tahun Kurikulum</td>
											<td>Nama Kurikulum</td>
											<td>Nama Satuan Manajemen</td>
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
						//$("#idKurikulum").select2();
						//$("#idSatMan").select2();
						$('#masterpage').masterPage(
						{ 
							detailFocusId: '#idCapPemb',
							dataUrl: context_path+'capaianbelajar/satuanmanajemen/json',
							detailUrl: context_path+'capaianbelajar/satuanmanajemen/edit',
							addUrl: context_path+'capaianbelajar/satuanmanajemen/simpan',
							editUrl: context_path+'capaianbelajar/satuanmanajemen/simpan', 
							deleteUrl: context_path+'capaianbelajar/satuanmanajemen/deletemany',
							primaryKey: 'idCapPemb',
					        order: [[3,"asc"]],
							editOnClick: false,
							editOnClickRow: true,
							cols: [
								/* id */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										return '<input type="checkbox" class="checkbox-data" name="idCapPemb[]" value="'+data+'">';
									}
								},
								/* tahun kurikulum */
								{ "bVisible":    false }, 
								/* nama kurikulum */
								{ "bVisible":    true }, 
								/* Nama capaian child */
								{ "bVisible":    true }, 
								/* deskripsi capaian child */
								{ "bVisible":    true }, 
								/* nama capaian induk */
								{ "bVisible":    true }, 
								/* deskripsi capaian induk*/
								{ "bVisible":    true },
								/*status hapus*/
								{ 
									"bVisible":    false, 
									mRender: function(data,type,full){
										if(full[7]=='false') return "Aktif";
										return "Terhapus";
									}
								},
								/* Aksi */
								{ 
									"bVisible":    true,
									bSortable: false,
									mRender: function(data,type,full){
										var action = '<button type="button" class="btn btn-primary editrow">Edit</button>'; 
										return action;
									}
								}
							],
							validationRules: {idKurikulum:{required: true}, idSatMan:{required: true}, namaCapPemb:{required: true}, deskripsiCapPemb:{required:true}},
							filters: [{id:'#filter', name:'statusCapPemb'}],
							callOnFillForm : function(response,options){  
								$("#idCapPemb").val(response.data.idCapPemb);
								$("#idKurikulum").val(response.data.kurikulum.idKurikulum);
								$("#idSatMan").val(response.data.satMan.idSatMan);    
								$.ajax({
									type: 'get',
									url : context_path+'capaianbelajar/satuanmanajemen/getparentlist', 
									dataType : 'json',
									data : {'idCapPemb' : $("#idCapPemb").val()},
									contentType : 'application/json; charset=utf-8', 
									traditional : true, 
									success : function(data){  
										var labelId = "idInduk";
										console.log(data); 
										$("#parentCapPemb").html("<input type='hidden' name='idIndukCapPemb[]' value='' />"); 
										for(var i=0; i<data.data.length; ++i){
											if(data.data[i].parentCapPemb != null){
												
												console.log(data.data[i].parentCapPemb.namaCapPemb);
												$("#parentCapPemb").append(
														"<div class='alert alert-warning alert-dismissable'>"
															+"<button type='button' id='button1' class='close' data-dismiss='alert' aria-hidden='true' onclick='removeHiddenId(\"" + labelId + i + "\")'>x</button>"
															+"<p>"+data.data[i].parentCapPemb.namaCapPemb+"<p>"
														+"</div>"
														+"<input type='hidden' id='"+ labelId + i +"' name='idIndukCapPemb[]' value='"+data.data[i].parentCapPemb.idCapPemb+"' />"		
												)
												
											}
											
											//else{
											//		$("#parentCapPemb").append("<input type='hidden' name='idIndukCapPemb[]' value=''/>"); 
											//}
										}
										
									},
									error: function(e){
										alert("Data induk capaian tidak ditemukan");
									}
								}); 
							}
						}); 
						 

						removeHiddenId = function(id){
// 							alert(id);
							var str = '#' + id;
							var hiddenLabel = $(str);
							console.log(hiddenLabel);
							hiddenLabel.remove();
						}
						
						showModal = function (){
							$('#myModal').modal('show');
						}
						$('#myModal').on('shown.bs.modal', function (e) {
							$("#masterpageCapPemb").find('.dataTables_length select').change();
							  //if (!data) return e.preventDefault() // stops modal from being shown
						})
						$('#masterpageCapPemb').masterPage(
						{
							detailFocusId: '#idIndukCapPemb',
							dataUrl: context_path+'capaianbelajar/satuanmanajemen/subcapaian/json',
							detailUrl: context_path+'capaianbelajar/satuanmanajemen/subcapaian/edit',
							primaryKey: 'idCapPemb',
					        order: [[3,"asc"]],
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
								/* tahun kurikulum */
								{ "bVisible":    false },
								/* nama kurikulum  */
								{ "bVisible":    false },
								/* nama satuan manajemen */
								{ "bVisible":    true },
								/* nama capaian */
								{ "bVisible":    true }, 
								/* deskripsi */
								{ "bVisible":    true }, 
							],
							callOnSelect : function(aData, options){
								console.log(aData);  
								$("#parentCapPemb").append(
										"<div class='alert alert-warning alert-dismissable'>"
											+"<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>x</button>"
											+"<p>"+aData[4]+"<p>"
										+"</div>" 
 										+"<input type='hidden' name='idIndukCapPemb[]' value='"+ aData[0] +"' />"
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
		