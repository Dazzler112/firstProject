
	
		export default {
			props: ["images"],
			data() {
			  return {
				length: this.images.length,
				selected: 1
			  };
			},
			mounted() {},
			methods: {
			  next() {
				if (this.selected == this.length) {
				  this.selected = 1;
				} else {
				  this.selected = this.selected + 1;
				}
				console.log(this.selected);
			  },
			  pre() {
				if (this.selected == 1) {
				  this.selected = this.length;
				} else {
				  this.selected = this.selected - 1;
				}
				console.log(this.selected);
			  }
			}
		  };
