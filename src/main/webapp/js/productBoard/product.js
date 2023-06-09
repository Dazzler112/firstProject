const category = $("#category_div").val();

$(function() {
	$('input:button[name="boardCategory"]').on("click", function() {
		const kind = $(this).val();
		$.ajax("/productboard/exList", {
			method: "get",
			contentType: "application/json",
			data: {
				id: $(this).val(),
				"kind": kind
			},
			success: function(data) {
				$("body").html(data);
			},
			error: function(data) {
				arguments("Error: " + status);
			}
		})
	});
});