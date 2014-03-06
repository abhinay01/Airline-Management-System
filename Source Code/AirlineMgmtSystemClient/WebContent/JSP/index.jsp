<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="search.css">
<link rel="stylesheet" href="css/redmond/jquery-ui-1.8.16.custom.css">
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.12.custom.min.js"></script>


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
  <![endif]-->



<script type="text/javascript">
	$(function() {
		var dateToday = new Date();
		$("#ddate").datepicker({
			numberOfMonths : 2,
			showButtonPanel : true,
			minDate : dateToday
		});
		$("#rdate").datepicker({
			numberOfMonths : 2,
			showButtonPanel : true,
			minDate : dateToday
		});
		$('#Trip-0').attr('checked',true);
		$('#rdate').val("");

	});
	$(document).ready(function() {
		$('input:radio[name="Trip"]').change(function() {
			if ($(this).is(':checked') && $(this).val() == 'Round Trip') {
				$('#rdate').removeAttr("disabled");
			} else {
				$('#rdate').attr("disabled", "disabled");
				$('#rdate').val("");
			}
		});
	});
	function validateForm() {
		
		if (($("#flying_to").val() == "----Select City----")
				|| ($("#flying_from").val() == "----Select City----")
				|| $("#ddate").val() == "") {
			$("#errorText").html(
					"Please fill the required fields to search for a flight.");
			$("#errorText").css({
				'color' : 'red'
			});
			return false;
		} else if ($("#flying_to").val() == $("#flying_from").val()) {
			$("#errorText").html("Source and Destination cannot be same.");
			$("#errorText").css({
				'color' : 'red'
			});

			return false;
		} else if ($('input[type="radio"]:checked').val() == "Round Trip") {
			if ($("#rdate").val() == "") {

				$("#errorText")
						.html(
								"Please fill the required fields to search for a flight.");
				$("#errorText").css({
					'color' : 'red'
				});
				return false;
			}
		} else if (($('input[type="radio"]:checked').val() == "Round Trip") &&($("#rdate").val() == "")){
			
				$("#errorText")
						.html(
								"Please fill the required fields to search for a flight.");
				$("#errorText").css({
					'color' : 'red'
				});
				return false;
			}
		
		if (($('input[type="radio"]:checked').val() == "Round Trip") &&($("#rdate").val() != "") ){    
			var startDate = $('#ddate').val().replace('-', '/');
			var endDate = $('#rdate').val().replace('-', '/');	
				if (startDate > endDate) {
					$("#errorText").html(
							"Return date cannot be before Departure Date.");
					$("#errorText").css({
						'color' : 'red'
					});
					return false;
				}
		}
		 else {
				$("#errorText").html(
				"");
			return true;
		}
	}
</script>
</head>

<body>
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<img style="width: 100%" src="top.gif">

				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span><span
								class="icon-bar"></span><span class="icon-bar"></span><span
								class="icon-bar"></span>
						</button>
						<!-- a class="navbar-brand" href="#">Home</a> -->
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="#">Home</a></li>
							<li><a href="MyReservationsServlet">Manage Reservations</a></li>
							<li><a href="#">Update Profile</a></li>
							<li><a href="#">Print Ticket</a></li>
							<!--  li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Navigate<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li -->
						</ul>
						<!--   form class="navbar-form navbar-left">
							<div class="form-group">
								<input type="text" class="form-control">
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#">Link</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">Dropdown<strong class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
						</ul -->
					</div>

				</nav>
			</div>
		</div>
		
		<div class="col-md-12 column">
			<div class="row clearfix">
				<form id="formSearch" method="post"
					action="/AirlineMgmtSystemClient/servlets/SearchServlet"
					onsubmit="return validateForm();">
					<TABLE id="table2">
						<TR>
							<TD colspan="2">
								<div id="errorText"></div>
							</TD>

						</TR>
						<TR>
							<TD><input type="radio" name="Trip" id="Trip-0"
								value="One Way" checked="checked" required="required">
								One Way</TD>
							<TD><input type="radio" name="Trip" id="Trip-1"
								value="Round Trip" required="required"> Round Trip</TD>
						</TR>


						<TR>
							<TD>
								<div class="control-group">
									<label class="control-label" for="flying_from">Flying
										From :</label>
									<div class="controls">
										<select id="flying_from" name="flying_from"
											class="input-large">
											<option>----Select City----</option>
											<option>San Francisco</option>
											<option>San Jose</option>
											<option>New York</option>
											<option>Bhubaneshwar</option>
											<option>Chennai</option>
											<option>Delhi</option>
											<option>Hyderabad</option>
											<option>Jammu</option>
											<option>Kolkata</option>
											<option>Mumbai</option>
											<option>Srinagar</option>
										</select>
									</div>
								</div>

							</TD>

							<TD><div class="control-group">
									<label class="control-label" for="flying_to">Flying To
										:</label>
									<div class="controls">
										<select id="flying_to" name="flying_to" class="input-large">
											<option>----Select City----</option>
											<option>Ahmedabad</option>
											<option>San Francisco</option>
											<option>San Jose</option>
											<option>New York</option>
											<option>Bhubaneshwar</option>
											<option>Chennai</option>
											<option>Delhi</option>
											<option>Hyderabad</option>
											<option>Jammu</option>
											<option>Kolkata</option>
											<option>Mumbai</option>
											<option>Srinagar</option>
										</select>
									</div>
								</div></TD>
						</TR>
						<TR>
							<TD><B>Departure Date:</B> <BR> <input type="text"
								name="ddate" id="ddate" readonly="readonly"></TD>
							<TD><B>Return Date:</B> <BR> <input type="text"
								name="rdate" disabled="disabled" id="rdate" readonly="readonly"></TD>
						</TR>
						<TR style="width: 60%">
							<TD><B>Passengers:<B></TD>
							<td><SELECT name="adult">
									<OPTION>1</OPTION>
									<OPTION>2</OPTION>
									<OPTION>3</OPTION>
									<OPTION>4</OPTION>
									<OPTION>5</OPTION>
									<OPTION>6</OPTION>
							</SELECT></td>
							<!--  TD>Adult (12+): <SELECT name="adult">
									<OPTION>1
									<OPTION>2
									<OPTION>3
									<OPTION>4
							</SELECT>
							</TD>

							<TD>Child(2-12): <SELECT name="child">
									<OPTION>0
									<OPTION>1
									<OPTION>2
									<OPTION>3
									<OPTION>4
									<OPTION>5
							</SELECT>
							</TD>

							<TD>Infant(0-2): <SELECT>
									<OPTION>0
									<OPTION>1
									<OPTION>2
									<OPTION>3
									<OPTION>4
							</SELECT>
							</TD -->
						</TR>

						<TR>
							<TD colspan=4></TD>
							<TD><div class="control-group">
									<label class="control-label" for="Search"></label>
									<div class="controls">
										<input type="submit" id="Search" name="Search"
											value="Show Flights" class="btn btn-primary" />
									</div>
								</div></TD>
						</TR>

					</TABLE>
				</form>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>
