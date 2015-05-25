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
						<div class="col-md-8 col-md-offset-2"> 
							<div class="panel panel-white">
								<div class="panel-body" id="wizardsilabus">
	                                    <div id="rootwizard">
	                                        <ul class="nav nav-tabs" role="tablist">
	                                            <li role="presentation" class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-user m-r-xs"></i>Pilih Mata Kuliah</a></li>
	                                            <li role="presentation"><a href="#tab2" data-toggle="tab"><i class="fa fa-truck m-r-xs"></i>Kelola Silabus</a></li>
	                                            <li role="presentation"><a href="#tab3" data-toggle="tab"><i class="fa fa-truck m-r-xs"></i>Kelola Pokok Bahasan Silabus</a></li>
	                                            <li role="presentation"><a href="#tab4" data-toggle="tab"><i class="fa fa-check m-r-xs"></i>Kelola Pustaka Silabus</a></li>
	                                        </ul>
	                                     </div>
	                                     <div class="progress progress-sm m-t-sm">
                                            <div id="bar" class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 0%">
                                            </div>
                                        </div>
                                        <form id="wizardForm">
                                            <div class="tab-content">
                                                <div class="tab-pane active fade in" id="tab1">
                                                    <div class="row m-b-lg">
                                                        <div class="col-md-6 col-md-offset-3"> 
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
                                                    <div class="row">
                                                        <div class="col-md-3">
<!--                                                             <img src="assets/images/envato-logo.png" width="250" alt=""> -->
                                                            <div class="m-t-md">
                                                                <address>
                                                                    <strong>Twitter, Inc.</strong><br>
                                                                    795 Folsom Ave, Suite 600<br>
                                                                    San Francisco, CA 94107<br>
                                                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                                                </address>
                                                                <address>
                                                                    <strong>Full Name</strong><br>
                                                                    <a href="mailto:#">first.last@example.com</a>
                                                                </address>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputProductName">Product Name</label>
                                                                <input type="text" class="form-control" name="exampleInputProductName" id="exampleInputProductName" placeholder="Product Name" >
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputProductId">Product ID</label>
                                                                <input type="text" class="form-control" name="exampleInputProductId" id="exampleInputProductId" placeholder="Product ID">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputQuantity">Quantity</label>
                                                                <input type="number" min="1" max="5" class="form-control" name="exampleInputQuantity" id="exampleInputQuantity" placeholder="Quantity">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="tab3">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputCard">Card Number</label>
                                                                <div class="row">
                                                                    <div class="col-md-8">
                                                                        <input type="text" class="form-control" name="exampleInputCard" id="exampleInputCard" placeholder="Card Number">
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <input type="text" class="form-control col-md-4" name="exampleInputSecurity" id="exampleInputSecurity" placeholder="Security Code">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputHolder">Card Holders Name</label>
                                                                <input type="text" class="form-control" name="exampleInputHolder" id="exampleInputHolder" placeholder="Card Holders Name">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputExpiration">Expiration</label>
                                                                <input type="text" class="form-control date-picker" name="exampleInputExpiration" id="exampleInputExpiration" placeholder="Expiration">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label for="exampleInputCsv">CSV</label>
                                                                <input type="text" class="form-control" name="exampleInputCsv" id="exampleInputCsv" placeholder="CSV">
                                                            </div>
                                                            <div class="form-group col-md-12">
                                                                <label class="f-s-12">By pressing Next You will Agree to the Payment <a href="#">Terms & Conditions</a></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="tab4">
                                                    <h2 class="no-s">Thank You !</h2>
                                                    <div class="alert alert-info m-t-sm m-b-lg" role="alert">
                                                        Congratulations ! You got the last step.
                                                    </div>
                                                </div>
                                                <ul class="pager wizard">
                                                    <li class="previous"><a href="#" class="btn btn-default" id="button-previous" type="button">Previous</a></li>
                                                    <li class="next"><a href="#" class="btn btn-default" id="button-next" type="button">Next</a></li>
                                                </ul>
                                            </div>
                                        </form>
	                            </div>
	                         </div>
	                    </div>
	             </div>
				
				<!-- Script Custom pada halaman. Kamu bisa memisah script pada file terpisah dengan menaruhnya di resource/js/namamodul/namafile.js -->
				<script>
					$(document).ready(function(){ 
						$('#wizardsilabus') 
						.formValidation({
				            framework: 'bootstrap', 
				            // This option will not ignore invisible fields which belong to inactive panels
				            excluded: ':disabled',
				            fields: {
				                idMK: {
				                    validators: {
				                        notEmpty: {
				                            message: 'The site name is required'
				                        }
				                    }
				                }
				            }
				                     
				        })
						.bootstrapWizard({ 
							onTabClick: function(tab, navigation, index) {
								console.log("ini index"+index);  
				                return validateTab(index);
				            },
							onNext : function(tab, navigation, index){ 
								var numTabs = $('#wizardsilabus').find('.tab-pane').length; 
								console.log("ini jumlah"+numTabs);
								isValidTab = validateTab(index - 1);
								if(!isValidTab){
									return false;
								} 
								return true;
							},
							onPrevious : function(tab, navigation, index){
								return validateTab(index+1);
							}
						});
						function validateTab(index){
							//var fv = $('#wizardForm').data('formValidation'),
							//$tab = $('#wizardForm').find('.tab-pane').eq(index); 
							$tab = $('#installationForm').find('.tab-pane').eq(index);
							return true;
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
		