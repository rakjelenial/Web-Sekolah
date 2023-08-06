<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=isset($page_title) ? $page_title . ' | ' : ''?><?=__session('school_name')?></title>


    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
         (adsbygoogle = window.adsbygoogle || []).push({
              google_ad_client: "ca-pub-2586125774271995",
              enable_page_level_ads: true
         });
    </script>


	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="keywords" content="<?=__session('meta_keywords');?>"/>
	<meta name="description" content="<?=__session('meta_description');?>"/>
	<meta name="subject" content="Situs Pendidikan">
	<meta name="copyright" content="<?=__session('school_name')?>">
	<meta name="language" content="Indonesia">
	<meta name="robots" content="index,follow" />
	<meta name="revised" content="Sunday, July 18th, 2022, 5:15 pm" />
	<meta name="Classification" content="Education">
	<meta name="author" content="Hendri Arifin, arifin.hendri465@gmail.com">
	<meta name="designer" content="Hendri Arifin, arifin.hendri465@gmail.com">
	<meta name="reply-to" content="arifin.hendri465@gmail.com">
	<meta name="owner" content="Hendri Arifin">
	<meta name="url" content="https://www.smkn1kotabaru.sch.id">
	<meta name="identifier-URL" content="https://www.smkn1kotabaru.sch.id">
	<meta name="category" content="Admission, Education">
	<meta name="coverage" content="Worldwide">
	<meta name="distribution" content="Global">
	<meta name="rating" content="General">
	<meta name="revisit-after" content="7 days">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Copyright" content="<?=__session('school_name');?>" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="revisit-after" content="7" />
	<meta name="webcrawlers" content="all" />
	<meta name="rating" content="general" />
	<meta name="spiders" content="all" />
	<meta itemprop="name" content="<?=__session('school_name');?>" />
	<meta itemprop="description" content="<?=__session('meta_description');?>" />
	<meta itemprop="image" content="<?=base_url('media_library/images/'. __session('logo'));?>" />
	<meta name="csrf-token" content="<?=__session('csrf_token')?>">
	<link rel="icon" href="<?=base_url('media_library/images/'.__session('favicon'));?>">
	<link rel="alternate" type="application/rss+xml" title="<?=__session('school_name');?> Feed" href="<?=base_url('feed')?>" />
	<link rel="manifest" href="manifest.json">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://owlcarousel2.github.io/OwlCarousel2/assets/owlcarousel/assets/owl.carousel.min.css">
	<link rel="stylesheet" href="https://owlcarousel2.github.io/OwlCarousel2/assets/owlcarousel/assets/owl.theme.default.min.css">
	<?//=link_tag('assets/plugins/bootstrap-4/bootstrap.min.css')?>
	<?//=link_tag('node_modules/bootstrap/dist/css/bootstrap.min.css')?>
	<?=link_tag('assets/css/font-awesome.min.css')?>
	<?=link_tag('assets/plugins/toastr/toastr.css')?>
	<?=link_tag('assets/plugins/datetimepicker/datetimepicker.css');?>
	<?//=link_tag('assets/plugins/jquery.smartmenus/jquery.smartmenus.bootstrap-4.css')?>
	<?//=link_tag('assets/plugins/jquery.smartmenus/sm-core.css')?>
	<?//=link_tag('assets/plugins/jquery.smartmenus/sm-clean.css')?>
	<?=link_tag('assets/plugins/magnific-popup/magnific-popup.css')?>
	<?=link_tag('assets/css/loading.css')?>
	<?=link_tag('views/themes/sky_light/style.css')?>
	<?=link_tag('views/themes/sky_light/custom.css?v=0.2')?>
	<script type="text/javascript">
	const _BASE_URL = '<?=base_url();?>';
	const _CURRENT_URL = '<?=current_url();?>';
	const _SCHOOL_LEVEL = '<?=__session('school_level');?>';
	const _ACADEMIC_YEAR = '<?=__session('_academic_year');?>';
	const _STUDENT = '<?=__session('_student');?>';
	const _IDENTITY_NUMBER = '<?=__session('_identity_number');?>';
	const _EMPLOYEE = '<?=__session('_employee');?>';
	const _HEADMASTER = '<?=__session('_headmaster');?>';
	const _MAJOR = '<?=__session('_major');?>';
	const _SUBJECT = '<?=__session('_subject');?>';
	const _RECAPTCHA_STATUS = '<?=(NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') ? 'true': 'false';?>'=='true';
	</script>
	<?php if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') { ?>
		<script src="https://www.google.com/recaptcha/api.js?hl=id" async defer></script>
	<?php } ?>
	<script src="<?=base_url('assets/js/frontend.min.js')?>"></script>

	<!-- jsPDF -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"
		integrity="sha256-c9vxcXyAG4paArQG3xk6DjyW/9aHxai2ef9RpMWO44A=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
</head>
<body oncontextmenu='return false;' onselectstart='return false;' style='-moz-user-select: none; cursor: default;' class="bg-light">
<!-- <body class="bg-light"> -->
	<div class="container p-0">
		<a href="<?=base_url()?>" class="bg-white px-3 py-2 d-flex text-decoration-none">
			<img src="<?=base_url('media_library/images/' . __session('logo'))?>" style="width: 27px; margin-right: 10px">
			<h3 class="font-weight-bold brand mb-0 text-start"><?=strtoupper(__session('school_name'))?></h3>
			<!-- <small><?=__session('tagline')?></small> -->
		</a>

		<!--  NAVIGATION MENU -->
		<div class="bg-success px-3 py-2 d-flex fw-bold text-nowrap overflow-auto sticky-top">
			<!-- <div class="overflow-auto"> -->
				<!-- <a href="<?=base_url()?>" class="text-decoration-none text-white small px-2"><i class="fa fa-home text-white small"></i></a> -->
				<a href="<?=base_url()?>" class="text-decoration-none text-white small px-2">BERANDA</a>
				<?php $menus = get_menus();
				foreach ($menus as $menu) {
					// echo '<li class="list-group-item">';
					$url = $menu['menu_url'] == '#' ? $menu['menu_url'] : base_url() . $menu['menu_url'];
					if ($menu['menu_type'] == 'links') $url = $menu['menu_url'];
					echo '<a href="'. $url .'" target="'. $menu['menu_target'] .'" class="text-decoration-none text-white small px-2">' . strtoupper($menu['menu_title']) . '</a>';
					// $sub_nav = recursive_list($menu['children']);
					// if ($sub_nav) echo '<ul>' . $sub_nav . '</ul>';
					// echo '</li>';
				} ?>
				<!-- <a href="<?=base_url()?>data-alumni" class="text-decoration-none text-white small px-2">DATA ALUMNI</a> -->
			<!-- </div> -->
		</div>

		<!--  /NAVIGATION MENU -->
		<?php if ( ! $this->uri->segment(1)) { ?>
			<!-- IMAGE SLIDERS -->
			<?php $query = get_image_sliders(); if ($query->num_rows() > 0) { ?>
				<div class="bg-white p-3 my-2 <?php $quotes = get_quotes(); echo $quotes->num_rows() == 0 ? 'mb-3' : ''?>">
					<h5 class="border-start border-5 border-warning px-2 mb-3">Prestasi & Karya Siswa</h5>
					<div class="owl-carousel">		
						<!-- <ol class="carousel-indicators mt-3 mb-3">
							<?php $idx = 0; foreach($query->result() as $row) { ?>
								<li data-target="#slide-indicators" data-slide-to="<?=$idx?>" <?=$idx == 0 ? 'class="active"' : ''?>></li>
							<?php $idx++; } ?>
						</ol> -->
						<?php $idx = 0; foreach($query->result() as $row) { ?>
							<!-- <div class="carousel-item <?=$idx == 0 ? 'active' : ''?>"> -->
							<div class="d-flex flex-column">
								<img src="<?=base_url('media_library/image_sliders/'.$row->image);?>" class="rounded-3" style="height: 150px; width: 270px">
								<p class="mt-2 lh-base fw-bold text-muted" style="width: 270px"><?=$row->caption;?></p>
							</div>
						<?php $idx++; } ?>
					</div>
				</div>
			<?php } ?>
			<!-- /IMAGE SLIDERS -->

			<!-- QUOTE -->
			<!-- <?php $query = get_quotes(); if ($query->num_rows() > 0) { ?>
				<div class="quote-title"><i class="fa fa-comments"></i> KUTIPAN</div>
				<?php foreach($query->result() as $row) { ?>
					<li><?=$row->quote?>. <span class="font-weight-bold"><?=$row->quote_by?></span></li>
				<?php } ?>
			<?php } ?> -->
			<!--  /QUOTE -->
		<?php } ?>
		<?php $this->load->view($content) ?>
		<div class="container px-3 bg-success bg-gradient text-white">
			<div class="row">
				<div class="col-12 mt-2">
					<h6 class="border-bottom border-warning border-2 pb-2 fw-bold">Hubungi Kami</h6>
					<label class="fw-bold">
						<?=__session('school_name')?>
						<!-- &sdot; <?=__session('tagline')?> -->
						</label>
					<dl class="row">
						<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-map-marker"></span> Alamat</dt>
						<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('street_address')?></dd>
						<!-- <dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-phone"></span> Telepon</dt>
						<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('phone')?></dd> -->
						<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-envelope"></span> Email</dt>
						<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('email')?></dd>
					</dl>
				</div>
				<div class="col-12 my-2">
					<h6 class="border-bottom border-warning border-2 pb-2 fw-bold">Link Terkait</h6>
					<div class="tag-content-block tag">
						<a href="https://btikp.kalselprov.go.id" target="_blank" class="bg-white text-success">BTIKP Kalsel</a>
						<a href="https://sekolah.data.kemdikbud.go.id/index.php/Chome/profil/0EF2B473-ECFD-435A-A2F0-354BABA95B71" target="_blank">Dapodik</a>
						<a href="https://gtk.belajar.kemdikbud.go.id/" target="_blank">GTK Kemdikbud</a>
						<!-- <?php $query = get_tags(10); if ($query->num_rows() > 0) { ?>
							<?php foreach ($query->result() as $row) { ?>
								<a href="<?=site_url('tag/'.$row->slug)?>"><?=$row->tag?></a>
							<?php } ?>
						<?php } ?> -->
					</div>
				</div>
				<div class="col-12 mt-2">
					<h6 class="border-bottom border-warning border-2 pb-2 fw-bold">Ikuti Kami</h6>
					<ul class="list-unstyled d-flex">
						<?php if (NULL !== __session('facebook') && __session('facebook')) { ?>
							<li class="float-left"><a href="<?=__session('facebook')?>" title="Facebook"><i class="fa fa-facebook social-icon facebook" aria-hidden="true"></i></a></li>
						<?php } ?>
						<?php if (NULL !== __session('twitter') && __session('twitter')) { ?>
							<li class="float-left"><a href="<?=__session('facebook')?>" title="Twitter"><i class="fa fa-twitter social-icon twitter" aria-hidden="true"></i></a></li>
						<?php } ?>
						<?php if (NULL !== __session('instagram') && __session('instagram')) { ?>
							<li class="float-left"><a href="<?=__session('instagram')?>" title="Instagram"><i class="fa fa-instagram social-icon instagram" aria-hidden="true"></i></a></li>
						<?php } ?>
						<?php if (NULL !== __session('youtube') && __session('youtube')) { ?>
							<li class="float-left"><a href="<?=__session('youtube')?>" title="Instagram"><i class="fa fa-youtube social-icon youtube" aria-hidden="true"></i></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
		</div>
		<!-- <div class="container-fluid secondary-footer">
			<div class="col-md-6 col-xs-12 text-md-left text-center">
				<?=copyright(2019, base_url(), __session('school_name'))?>
			</div>
			<div class="col-md-6 col-xs-12 text-md-right text-center">
				Powered by <a href="https://tukarjual.com">TukarJual</a>
			</div>
		</div> -->
	<div id="search_form">
		<form action="<?=site_url('hasil-pencarian')?>" method="POST">
			<input type="search_form" name="keyword" autocomplete="off" placeholder="Type here" />
			<button type="submit" class="btn btn-lg btn btn-outline-light rounded-0"><i class="fa fa-search"></i> CARI</button>
		</form>
	</div>
	<!-- <a href="javascript:" id="return-to-top" class="rounded-lg"><i class="fa fa-angle-double-up"></i></a> -->
	</div>
	<!-- <script src="https://owlcarousel2.github.io/OwlCarousel2/assets/vendors/jquery.min.js"></script> -->
	<script src="https://owlcarousel2.github.io/OwlCarousel2/assets/owlcarousel/owl.carousel.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<script src="./assets/js/main.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".owl-carousel").owlCarousel({
				margin      : 10,
				loop        : true,
				autoWidth   : true,
				items       : 5
			});
		});
		// $(".owl-dots").addClass("disabled");
		Notification.requestPermission(status => console.log(status))

		$('#downloadPDF').click(function () {
			domtoimage.toPng(document.getElementById('content2'))
			.then(function (blob) {
				var pdf = new jsPDF('p', 'pt', [$('#content2').width(), $('#content2').height()]);

				pdf.addImage(blob, 'PNG', 0, 0, $('#content2').width(), $('#content2').height());
				pdf.save("skl.pdf");

				that.options.api.optionsChanged();
			});
		});
	</script>
</body>
</html>