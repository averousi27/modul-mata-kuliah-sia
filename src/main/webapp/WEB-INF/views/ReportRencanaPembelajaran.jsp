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
					<li><a href="${pageContext.servletContext.contextPath}/rencanapembelajaran/laporan">Daftar Laporan Rencana Pembelajaran</a></li>
					<li class="active">Rencana Pembelajaran ${mk2.namaMK}</li>
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
									<h4 class="panel-title">Detail Mata Kuliah</h4> 
								</div>
								<div class="panel-body">  
									 <div class="row">
									 	<div class="col-md-8 col-md-offset-2">  
									 			
									 			<p><b>Kurikulum :</b> ${mk2.kurikulum.namaKurikulum}</p>
									 			<p><b>Kode Mata Kuliah :</b> ${mk2.kodeMK}</p>
									 			<p><b>Nama Mata Kuliah :</b> ${mk2.namaMK}</p>
									 			<p><b>Rumpun Mata Kuliah :</b> ${mk2.rumpunMK.namaRumpunMK}</p>
									 			<p><b>Jurusan :</b></p>
									 			<ul>
											 		<c:forEach items="${smmkList}" var="smmk"> 
											 			<li>${smmk.satMan.nmSatMan} - Semester : ${smmk.tingkatPemb}</li> 
											 		</c:forEach>
									 			</ul>
									 			<p><b>Kredit :</b> ${mk2.jumlahSKS} sks</p> 
									 			<p><b>Deskripsi :</b> ${mk2.deskripsiMK}</p>
								 			<br />  
									 		<p><b>Prasyarat Mata Kuliah</b></p>
									 		<c:if test="${prasyaratList != null}">
												<c:forEach items="${prasyaratList}" var="prasyaratList"> 
									 				<p>${prasyaratList.parent.namaMK}</p>
									 			</c:forEach>
											</c:if>  
											<c:if test="${prasyaratList == null}">
												<p>Tidak ada prasyarat</p>
											</c:if> 
									 		<br />
									 		<p><b>Pustaka</b></p>
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
									<button type="button" class="btn btn-primary col-md-4 col-md-offset-4" onclick="printRP(this)" name="${mk2.idMK}">Cetak Rencana Pembelajaran&nbsp;&nbsp;<span class="glyphicon glyphicon-print"></span></button>
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
													<td>
														<ul>
														<c:forEach items="${msNewList}" var="ms">
															<c:if test="${ms.rpPerTemu.idRPPerTemu == rpPerTemu.idRPPerTemu}">
																<li>${ms.detailSilabus.pokokBahasan}</li>
															</c:if> 
														</c:forEach>
														</ul>
													</td> 
													<td>
														<ul>
														<c:forEach items="${rpmbList}" var="rpmp">
															<c:if test="${rpmp.rpPerTemu.idRPPerTemu == rpPerTemu.idRPPerTemu}">
																<li>${rpmp.metodePemb.namaMetodePemb}</li>
															</c:if>    
														</c:forEach>
														</ul>
													</td>
													<td>
														<ul>
														<c:forEach items="${rpbpList}" var="rpbp">
															<c:if test="${rpbp.rpPerTemu.idRPPerTemu == rpPerTemu.idRPPerTemu}">
																<c:if test="${rpbp.bentukPenilaian!=null}">
																	<li>${rpbp.bentukPenilaian.namaBentuk}</li>
																</c:if> 
																<c:if test="${rpbp.bentukPenilaian==null}">
																	Tidak ada bentuk penilaian
																</c:if> 
															</c:if>  
														</c:forEach>
														</ul>
													</td>
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
				printRP = function printRP(button){
					var mk = $(button).attr('name');
					window.open(context_path+'rencanapembelajaran/kelola/laporan/'+mk,'_blank');
				}
				</script>
				<!-- akhir script custom pada halaman -->
				
				<!-- akhir dari content content -->
				
				<!-- footer -->
				 <jsp:include page="footer.jsp" />
		