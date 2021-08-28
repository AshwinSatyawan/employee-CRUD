$(document)
		.ready(
				function() {
					// $(".error").remove();
					$("#loginsubmit")

							.click(
									function(e) {
										$(".invalid").remove();

										var login = $("#l_id").val();
										if (login == '') {

											$('#l_id').after(
													'<span class="invalid">Login ID is mandatory</span>'
															+ this);
											// alert("Please Fill Required
											// Fields");
											// $("#loginsubmit").attr("disabled",
											// true);
											e.preventDefault();
										}

										var password = $("#password").val();

										if (password == '') {

											$('#password')
													.after(
															'<span class="invalid">Password is Mandatory</span>');
											e.preventDefault();

										}

										if (password.length < 6
												&& password.length > 1) {

											$('#password')
													.after(
															'<span class="invalid">password should be minimum 6 characters</span>');
											e.preventDefault();

										}

									});
				});

$(document)
		.ready(
				function() {
					// $(".error").remove();
					$("#addsubmit")
							.click(
									function(e) {

										$(".invalid").remove();

										var fname = $("#fname").val();
										// Name>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
										if (fname == '') {

											$('#fname')
													.after(
															'<span class="invalid">Name is mandatory</span>');
											// alert("Please Fill Required
											// Fields");
											// $("#loginsubmit").attr("disabled",
											// true);
											e.preventDefault();
										}

										var age = $("#age").val();

										if (age == '') {

											$('#age')
													.after(
															'<span class="invalid">Age is Mandatory</span>');
											e.preventDefault();

										}
										// Age>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
										if ((age < 18 || age > 99) && age > 1) {

											$('#age')
													.after(
															'<span class="invalid">age should be between 18 and 99</span>');
											e.preventDefault();

										}

										// salary>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

										var salary = $("#salary").val();

										if (salary == '') {

											$('#salary')
													.after(
															'<span class="invalid">Salary is mandatory</span>');
											e.preventDefault();

										}

										// dept>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

										var dept = $("#dept").val();

										if (dept == '') {

											$('#dept')
													.after(
															'<span class="invalid">Department is mandatory</span>');
											e.preventDefault();

										}

										// state>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

										var sts = $("#sts").val();

										if (sts == '') {

											$('#sts')
													.after(
															'<span class="invalid">State is mandatory</span>');
											e.preventDefault();

										}

										// city>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

										var state = $("#state").val();

										if (state == '') {

											$('#state')
													.after(
															'<span class="invalid">City is mandatory</span>');
											e.preventDefault();

										}

										// skills>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

								
										
										var skills = $("skills").prop("checked");
										

										if (skills.size<1) {

											$('#skillst')
													.after(
															'<span class="invalid">Select Atleast one</span>');
											e.preventDefault();

										}

									});
				});

function validate_num(evt) {
	var theEvent = evt || window.event;

	// Handle paste
	if (theEvent.type === 'paste') {
		key = event.clipboardData.getData('text/plain');
	} else {
		// Handle key press
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
	}
	var regex = /[0-9]|\./;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function validate_text(evt) {
	var theEvent = evt || window.event;

	// Handle paste
	if (theEvent.type === 'paste') {
		key = event.clipboardData.getData('text/plain');
	} else {
		// Handle key press
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
	}
	var regex = /^[A-Za-z ]+$/;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function validate_num(evt) {
	var theEvent = evt || window.event;

	// Handle paste
	if (theEvent.type === 'paste') {
		key = event.clipboardData.getData('text/plain');
	} else {
		// Handle key press
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
	}
	var regex = /[0-9]|\./;
	if (!regex.test(key)) {
		theEvent.returnValue = false;
		if (theEvent.preventDefault)
			theEvent.preventDefault();
	}
}

function smhide() {
	onclick = "document.getElementById('success').style.display='none'"
}

$(document).ready(function() {
	
$("#d ").click(function(){
var id = $(this).find("a[href]").attr('href');
//console.log(id);
var temp = id.split("#");
var test = temp[1];
$.ajax({
	//type : "POST",
	//contentType : "application/json",
	url :"dispEmp",
	data : {id:test},
	success : function(data){
			console.log(data);
			$('#dispModal').modal('show');
			$('#dispEmp').html(data)
			
	/*	var dt=data.split("/");
		$('#fn').html(dt[0]);
		$('#ln').html(dt[1]);
		$('#ag').html(dt[2]);
		$('#sl').html(dt[3]);
		$('#dp').html(dt[4]);
		$('#st').html(dt[5]);
		$('#ct').html(dt[6]);
		$('#sk').html(dt[7]);
		$('#ad').html(dt[8]);*/
			
		},
	//contentType : "application/json",
	//dataType : 'json',
	//timeout : 100000,
});
});
});







