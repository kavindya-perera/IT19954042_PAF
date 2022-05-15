<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.PaymentCard"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Payment Card details</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.4.1.min.js"></script>
<script src="Components/paymentCrd.js"></script>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="card-header bg-info text-light d-flex align-items-center">
				<h1>Payment Card Details</h1>
			</div>
			<div class="card-body">
				<form id="formpaycrd" name="formpaycrd" method="post" action="PaymentCard.jsp">
	                    Card Number: <input
						id="card_number" name="card_number" type="text"
						class="form-control form-control-sm"> <br> CVV : <input
						id="cvv" name="cvv" type="text"
						class="form-control form-control-sm"><br> Exp Date:
					 <input id="exp_date" name="exp_date" type="text"
						class="form-control form-control-sm"> <br> Card Holder Name:  <input id="crd_holder_name" name="crd_holder_name" type="text"
						class="form-control form-control-sm"> <br> Card Issued:  <input id="card_issued" name="card_issued" type="text"
						class="form-control form-control-sm"> <br> 
						
					<div class="text-right">
					
						<input id="btnSave" name="btnSave" type="button" value="SAVE"
							class="btn btn-primary"> <input type="hidden"
							id="hidCustomerIDSave" name="hidCustomerIDSave" value="">
					</div>
				</form>
				<div id="alertSuccess" class="alert alert-success" style="margin-top: 15px"></div>
				<div id="alertError" class="alert alert-danger" style="margin-top: 15px"></div>
				<div id="divItemsGrid" class="table-responsive" class="divItemsGrid">
					<%
					PaymentCard crd1 = new PaymentCard();
					out.print(crd1.readItems());
					%>
				</div>
			</div>

		</div>
	</div>
</body>
</html>