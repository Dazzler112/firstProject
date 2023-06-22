

$("#likeIcon").click(function(){
	 
	 console.log("123")
	 const productId = $("#productIdText").text().trim();
	 console.log(productId)
	 
	 const url=`/teamProject/like`;
	 const data={productId}
	 $.ajax(url, {
		 method:'post',
		 contentType:'application/json',
		 data:JSON.stringify(data)
	 })
});