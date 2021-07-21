<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="/tiger/resources/bootstrap/css/main.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<!-- main container -->
<div class="swiper-container">
  <!-- wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="slide1 swiper-slide"></div>
    <div class="slied2 swiper-slide"></div>
    <div class="slied3 swiper-slide"></div>
  </div>
  <!-- pagination -->
  <div class="swiper-pagination"></div>

  <!-- navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>
</div>
<script type="text/javascript">
const swiper = new Swiper('.swiper-container', {
	  /* 자동재생 */
	  autoplay: {
		  delay: 3000,
	  },
	  loop: true,
	  pagination: {
	    el: '.swiper-pagination',
	  },
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },
	});
</script>
</body>
</html>