<?xml version="1.0"?>
<%@ page contentType="text/html"%>
<!DOCTYPE html 
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Contador</title>

<script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
<!--script src="js/jquery.cookie.js" type="text/javascript"></script-->

<style type="text/css">

.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #d9fbbe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #d9fbbe;
	box-shadow:inset 0px 1px 0px 0px #d9fbbe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b8e356), color-stop(1, #a5cc52) );
	background:-moz-linear-gradient( center top, #b8e356 5%, #a5cc52 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b8e356', endColorstr='#a5cc52');
	background-color:#b8e356;
	-webkit-border-top-left-radius:20px;
	-moz-border-radius-topleft:20px;
	border-top-left-radius:20px;
	-webkit-border-top-right-radius:20px;
	-moz-border-radius-topright:20px;
	border-top-right-radius:20px;
	-webkit-border-bottom-right-radius:20px;
	-moz-border-radius-bottomright:20px;
	border-bottom-right-radius:20px;
	-webkit-border-bottom-left-radius:20px;
	-moz-border-radius-bottomleft:20px;
	border-bottom-left-radius:20px;
	text-indent:0;
	border:1px solid #83c41a;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:50px;
	line-height:50px;
	width:194px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #86ae47;
}
.myButton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a5cc52), color-stop(1, #b8e356) );
	background:-moz-linear-gradient( center top, #a5cc52 5%, #b8e356 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a5cc52', endColorstr='#b8e356');
	background-color:#a5cc52;
}.myButton:active {
	position:relative;
	top:1px;
}

body {
background: url(img/background.jpg) no-repeat #425B00;
}

@font-face {font-family:"Pocket Calculator";src:url("POCKC___.eot?") format("eot"),url("POCKC___.woff") format("woff"),url("POCKC___.ttf") format("truetype"),url("POCKC___.svg#PocketCalculator") format("svg");font-weight:normal;font-style:normal;}

#main {
	text-align: center;
	width: 902px;
	margin: 0 auto 40px auto;
	padding-left: 1px;
	
}

#header {
	width: 900px;
	height: 160px;	
}

#separator {
	width: 580px;
	margin: 0 auto;
}

#logo_eap {
	float: right;
	margin-top: 40px;
}

#logo {
	float: left;
	margin-top: 40px;
}

#main, #time {
/* border: 1px solid silver;*/
}

h3,#time,.texto,#update {
	margin-top: 20px;
	margin-bottom: 50px;
}

#time {
	font-size: 17em;
	font-family:"Pocket Calculator";
	color: white !important;
}

h1, h3, #time {
color: #222;
}

#main, #time {
/*border: 1px solid silver;*/
}

#footer {
	color: white;
	font-size: 1.5em;
	font-family: Arial;
	font-weight: bold;
}
</style>

</head>
<body>

	<div id="main">
	
		<div id="header">
    
    		<div id="logo"><img src="img/logo_red_hat.png" width="225" height="73" alt="Red Hat" /></div>
        
        	<div id="logo_eap"><img src="img/jboss_eap6.png" width="345" height="96" alt="JBoss EAP 6" /></div>
    	
    		<div id="separator">
        		<img src="img/separator_top.png" width="569" height="36" alt="Red Hat" /></div>
        
   		</div>
	
	
		<!-- div id="header">
			<img src="red_hat_logo.jpg" alt="" height="210px" width="191px" />
			<h1>RoadShow - EAP 6</h1>
		</div> -->
		<div id="content">
			<p id="time"></p>

			<script type="text/javascript">

				function incrementa() {
					$.ajax({url:"ServletUtils",success:function(result){
					    $("#time").html(result.split(";")[0]);
					    $("#remotehost").html(result.split(";")[1]);

					    $("#server").html(result.split(";")[3]);
						
					}});
				}
			
				var refreshit = window.setInterval("incrementa()",1000);

				function stopCount() {
					window.clearInterval(refreshit);
					
					$.post("ServletUtils",function(data,status){
					    
					});
				}

			</script>
		</div>
		<div id="footer">
			<table align="center" border="1px" cellpadding="5px" cellspacing="0">
				<tr>
					<td>Server</td>
					<td id="server"></td>
				</tr>
				<tr>
					<td>Client</td>
					<td id="remotehost"></td>
				</tr>
			</table>
			<br />
			<button class="myButton" onclick="stopCount()">Invalidar sessao</button>
		</div>
	</div>

</body>
</html>