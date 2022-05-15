$(document).ready(function() {

	$("#alertSuccess").hide();
	$("#alertError").hide();

});

function validateItemForm() {
	
	// Account number------------------------
	let AcNumber = $("#accNo").val().trim();
	if (!$.isNumeric(AcNumber)) {
		return "Insert a numerical value for Account number.";
	}
	// PRICE-------------------------------
	if ($("#custName").val().trim() == "") {
		return "Insert Customer name.";
	}

	let uniP = $("#unitPrice").val().trim();
	if (!$.isNumeric(uniP)) {
		return "Insert a numerical value for unit price.";
	}
	let units = $("#units").val().trim();
	if (!$.isNumeric(units)) {
		return "Insert a numerical value for units.";
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
			$("#divItemsGrid").html(resultSet.data);
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
	$("#hidBillIDUpdate").val("");
	$("#formBill")[0].reset();
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
	var type = ($("#hidBillIDUpdate").val() == "") ? "POST" : "PUT";

	$.ajax(
		{
			url: "Bill",
			type: type,
			data: $("#formBill").serialize(),
			dataType: "text",
			complete: function(response, status) {
				onAccountSaveComplete(response.responseText, status);
			}
		});
});


// UPDATE CLICK
/*$(document).on("click", ".btnUpdate", function(event) {
	$("#hidCustomerIDSave").val($(this).closest("tr").find('#hidCustomerIDUpdate').val());
	$("#AcNumber").val($(this).closest("tr").find('td:eq(0)').text());
	$("#Name").val($(this).closest("tr").find('td:eq(1)').text());
	$("#NIC").val($(this).closest("tr").find('td:eq(2)').text());
	$("#Phone").val($(this).closest("tr").find('td:eq(3)').text());
	$("#Email").val($(this).closest("tr").find('td:eq(4)').text());
	
});
*/

//Delete Func
/*function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
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
*/

// DELETE Click
/*$(document).on("click", ".btnRemove", function(event) {
	$.ajax(
		{
			url: "CusAccount",
			type: "DELETE",
			data: "idcustomer=" + $(this).data("idcustomer"),
			dataType: "text",
			complete: function(response, status) {
				onItemDeleteComplete(response.responseText, status);
			}
		});
});
*/