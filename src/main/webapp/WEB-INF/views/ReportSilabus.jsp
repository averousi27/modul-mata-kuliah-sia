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
					<li><a href="${pageContext.servletContext.contextPath}/silabus/kelola/laporan">Daftar Laporan Silabus</a></li>
					<li class="active">Laporan Silabus ${mk2.namaMK}</li>
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
									<h4 class="panel-title">Laporan Silabus</h4>
								</div>
								<div class="panel-body">  
									 <div class="row">
									 	<button type="button" class="btn btn-primary col-md-4 col-md-offset-4" onclick="printSilabus(this)" name="${mk2.idMK}">Cetak Silabus&nbsp;&nbsp;<span class="glyphicon glyphicon-print"></span></button>
									 	
									 	<div class="col-md-8 col-md-offset-2">   
									 			<br />
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
									 			<p><b>Deskripsi :</b></p>
									 			<p>${mk2.deskripsiMK}</p>
								 			<br /> 
								 			<p><b>Capaian Satuan Manajemen yang Didukung</b></p>
											<ul>
									 			<c:forEach items="${cpList}" var="cpList">
									 			 	<li>${cpList.satMan.nmSatMan} | ${cpList.deskripsiCapPemb}</li>
									 			</c:forEach>
									 		</ul>
									 		<br />
									 		<p><b>Capaian Mata Kuliah</b></p> 
											<ul>
									 			<c:forEach items="${cpmkList}" var="cpmkList">
									 			 	<li>${cpmkList.deskripsiCapPembMK}</li>
									 			</c:forEach>
									 		</ul>
									 		<br />
									 		<p><b>Pokok bahasan</b></p>
									 		<ul>
									 		<c:forEach items="${dsList}" var="dsList"> 
									 			<li>${dsList.pokokBahasan}</li> 
									 		</c:forEach>
									 		</ul>
									 		<br />
									 		<p><b>Prasyarat Mata Kuliah</b></p>
									 		<ul>
									 		<c:if test="${prasyaratList != null}">
												<c:forEach items="${prasyaratList}" var="prasyaratList"> 
									 				<li>${prasyaratList.parentMK.kodeMK} - ${prasyaratList.parentMK.namaMK}</li>
									 			</c:forEach>
											</c:if>  
											</ul>
											<c:if test="${prasyaratList == null}">
												<p>Tidak ada prasyarat</p>
											</c:if> 
									 		<br />
									 		<p><b>Pustaka Utama</b></p>
									 		<ul>
									 		<c:forEach items="${dpList}" var="dp"> 
									 			<c:if test="${dp.pustaka.sifatPustaka == 'U'}">
									 				<li>${dp.pustaka.namaPustaka}</li> 
									 			</c:if>
									 		</c:forEach>
									 		</ul>
									 		<p><b>Pustaka Pendukung</b></p>
									 		<ul>
									 		<c:forEach items="${dpList}" var="dp"> 
									 			<c:if test="${dp.pustaka.sifatPustaka == 'P'}">
									 				<li>${dp.pustaka.namaPustaka}</li> 
									 			</c:if> 
									 		</c:forEach>
									 		</ul>
										</div>
									 </div>
								</div>
							 </div>
						</div>
					</div>
				</div> 
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script> 
				printSilabus = function printSilabus(button){
					var mk = $(button).attr('name'); 
					window.open(context_path+'silabus/kelola/laporan/'+mk,'_blank');
				}
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
		