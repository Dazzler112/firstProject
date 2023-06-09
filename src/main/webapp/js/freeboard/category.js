
$(function(){
	$("input:button[name='boardCategory']").on("click", function(){
	const boardCategory = $(this).val();
		$.ajax("/freeboard/freelist", {
			method:"get",
			contentType: "application/json",
			cache : false,
            headers : {"cache-control":"no-cache","pragma":"no-cache"},
			data: {
				id : $(this).val(),
				"boardCategory":boardCategory
			},
			success : function(data){
				console.log(data);
				$('body').html(data);
			},
			erorr: function(data){
				alert("Erorr: " + status);
			}
			
		})
	});
});