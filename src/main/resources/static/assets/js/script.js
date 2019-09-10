$(document).ready(function() {
    console.log("hello");
    $("#login").click(function(e) {
    	console.log("you clicked me!");
    	e.preventDefault();
    	var popup = $("#popup").attr("aria-hidden");
    	if (popup == "false") {
    		$("#popup").attr("aria-hidden", "true");
    	}
    	else {
    		$("#popup").attr("aria-hidden", "false");
    		if (!$("#registerPanel").hasClass("is-selected")) {
    			$("#loginPanel").addClass("is-selected");
        		$("#popover-list").css("height", "270px");
    		}
    	}	
    })
    $("#createAccount").click(function(e) {
    	e.preventDefault();
    	console.log("Create a new account");
    	$("#registerPanel").addClass("is-selected");
    	$("#loginPanel").removeClass("is-selected");
    	$("#popover-list").css("height", "370px");
    })
    
    $("#loginAccount").click(function(e) {
    	e.preventDefault();
    	$("#registerPanel").removeClass("is-selected");
    	$("#loginPanel").addClass("is-selected");
    	$("#popover-list").css("height", "270px");
    })
})