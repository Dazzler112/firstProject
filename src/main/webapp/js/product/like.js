$("#likeIcon").click(function() {

	const productId = $("#productIdText").text().trim();
	const url = `/teamProject/like`;
	const data = { productId }
	$.ajax(url, {
		method: 'post',
		contentType: 'application/json',
		data: JSON.stringify(data),

		success: function(data) {
			if (data.like) {
				$("#likeIcon").html(`<i class="fa-solid fa-heart"></i>`);
			} else {
				$("#likeIcon").html(`<i class="fa-regular fa-heart"></i>`);
			}
			$("#likeNumber").text(data.count);
		},
		error: function() {
			const toastLiveExample = document.querySelector("#liveToast");
			const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample);
			toastBootstrap.show();
		}
	});
});