/**
 
 */

 <script type="text/javascript">
    var nav = document.getElementsByClassName("navigation");

    window.onscroll = function sticky() {
      if(window.pageYOffset > nav[0].offsetTop) {
        nav[0].classList.add("nav");
      } else {
        nav[0].classList.remove("nav");
      }
    }
  </script>