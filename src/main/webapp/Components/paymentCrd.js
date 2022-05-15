$(document).ready(function() {

	$("#alertSuccess").hide();
	$("#alertError").hide();

});

function validateItemForm() {
	
	let cNumber = $("#card_number").val().trim();
	if (!$.isNumeric(cNumber)) {
		return "Insert a numerical value for card number.";
	}
		let cvvNumber = $("#cvv").val().trim();
	if (!$.isNumeric(cvvNumber)) {
		return "Insert a numerical value for cvv number.";
	}
	// PRICE-------------------------------
	if ($("#exp_date").val().trim() == "") {
		return "Insert exp date.";
	}
	
	if ($("#crd_holder_name").val().trim() == "") {
		return "Insert crd_holder_name.";
	}
	if ($("#card_issued").val().trim() == "") {
		return "Insert card issued.";
	}
	return true;

}

//Save Func
function onAccountSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidCustomerIDSave").val("");
	$("#formpaycrd")[0].reset();
}


// Save Btn
$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------  
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------  
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	// If valid------------------------  
	var type = ($("#hidCustomerIDSave").val() == "") ? "POST" : "PUT";

	$.ajax(
		{
			url: "PaymentCardServelt",
			type: type,
			data: $("#formpaycrd").serialize(),
			dataType: "text",
			complete: function(response, status) {
				onAccountSaveComplete(response.responseText, status);
			}
		});
});


// UPDATE CLICK
$(document).on("click", ".btnUpdate", function(event) {
	$("#hidCustomerIDSave").val($(this).closest("tr").find('#hidCustomerIDUpdate').val());
	$("#card_number").val($(this).closest("tr").find('td:eq(0)').text());
	$("#cvv").val($(this).closest("tr").find('td:eq(1)').text());
	$("#exp_date").val($(this).closest("tr").find('td:eq(2)').text());
	$("#crd_holder_name").val($(this).closest("tr").find('td:eq(3)').text());
	$("#card_issued").val($(this).closest("tr").find('td:eq(4)').text());
	
});



//Delete Func
function onItemDeleteComplete(response, status) {
	if (status == "success") {
		console.log(response);
		
		var variables = response.replace("{","");
		variables = variables.replace("}","");
		variables = variables.split(",");
		var status = variables[0].split(":")[1];
		var data = variables[1].split(":")[1];
		if (status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}


// DELETE Click
$(document).on("click", ".btnRemove", function(event) {
	$.ajax(
		{
			url: "PaymentCardServelt",
			type: "DELETE",
			data: "userCard_ID=" + $(this).data("idcustomer"),
			dataType: "text",
			complete: function(response, status) {
				onItemDeleteComplete(response.responseText, status);
			}
		});
});
