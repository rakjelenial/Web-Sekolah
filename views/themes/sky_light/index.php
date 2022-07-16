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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
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
	<?=link_tag('views/themes/sky_light/custom.css')?>
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
</head>
<body oncontextmenu='return false;' onselectstart='return false;' style='-moz-user-select: none; cursor: default;'>
	<div class="container">
	<header>
		<!-- <div class="container-fluid top-bar"> -->
			<div class="container px-3 py-1">
				<!-- <div class="d-flex align-items-center"> -->
					<!-- <div class="col-md-5 col-sm-12 col-xs-12"> -->
					<!-- <div class="col-md-12 col-sm-12 col-xs-12"> -->
						<!-- <div class="top-header"> -->
							<!-- <img src="<?=base_url('media_library/images/' . __session('logo'))?>" width="70" height="70" class="mr-4"> -->
							<ul class="list-unstyled top-left mb-0">
								<!-- <li><h5 class="font-weight-bold brand"><?=strtoupper(__session('school_name'))?></h5></li> -->
								<li><h2 class="font-weight-bold brand mb-0 text-start"><?=strtoupper(__session('school_name'))?></h2></li>
								<!-- <li><small><?=__session('tagline')?></small></li> -->
							</ul>
						<!-- </div> -->
					<!-- </div> -->
					<!-- <div class="col-md-7 col-sm-12 col-xs-12">
						<ul class="list-inline float-right top-right">
							<li class="list-inline-item pl-3 pr-0"><i class="fa fa-envelope"></i> </i> <?=__session('email');?></li>
							<li class="list-inline-item pl-3 pr-0"><i class="fa fa-phone"></i> <?=__session('phone');?></li>
							<li class="list-inline-item pl-3 pr-0"><a href="<?=site_url('feed')?>"><i class="fa fa-rss"></i> RSS</a></li>
							<li class="list-inline-item pl-3 pr-0"><a href="#search_form"><i class="fa fa-search"></i> Pencarian</a></li>
						</ul>
					</div> -->
				<!-- </div> -->
			</div>
		<!-- </div> -->
		<!--  NAVIGATION MENU -->
		<div class="container-fluid menu-bar mb-3" data-toggle="sticky-menu">
			<div class="container py-2 px-2">
				<div class="text-nowrap">
				<!-- <nav class="navbar navbar-expand-lg p-0"> -->
					<!-- <a class="navbar-brand" href="#"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="fa fa-align-justify text-white"></span>
					</button> -->
					<!-- <div class="collapse navbar-collapse" id="navbarNavDropdown"> -->
						<!-- <ul id="main-menu" class="sm sm-clean p-0"> -->
						<!-- <ul class="list-group list-group-horizontal"> -->
							<!-- <li class="list-group-item"> -->
								<a href="<?=base_url()?>"><i class="fa fa-home text-white small"></i></a>
							<!-- </li> -->
							<?php
							$menus = get_menus();
							foreach ($menus as $menu) {
								// echo '<li class="list-group-item">';
								$url = $menu['menu_url'] == '#' ? $menu['menu_url'] : base_url() . $menu['menu_url'];
								if ($menu['menu_type'] == 'links') $url = $menu['menu_url'];
								echo '<a href="'. $url .'" target="'. $menu['menu_target'] .'" class="text-decoration-none text-white small px-2">' . strtoupper($menu['menu_title']) . '</a>';
								$sub_nav = recursive_list($menu['children']);
								if ($sub_nav) echo '<ul>' . $sub_nav . '</ul>';
								// echo '</li>';
							}?>
						<!-- </ul> -->
					<!-- </div> -->
				<!-- </nav> -->
				</div>
			</div>
		</div>

		<!--  /NAVIGATION MENU -->
		<?php if ( ! $this->uri->segment(1)) { ?>
			<!-- IMAGE SLIDERS -->
			<?php $query = get_image_sliders(); if ($query->num_rows() > 0) { ?>
				<div class="container px-3 mb-3 <?php $quotes = get_quotes(); echo $quotes->num_rows() == 0 ? 'mb-3' : ''?>">
					<div class="d-flex justify-content-between">		
						<!-- <div class="col-8 p-0"> -->
							<div id="slide-indicators" class="carousel slide" data-ride="carousel">
								<ol class="carousel-indicators mt-3 mb-3">
									<?php $idx = 0; foreach($query->result() as $row) { ?>
										<li data-target="#slide-indicators" data-slide-to="<?=$idx?>" <?=$idx == 0 ? 'class="active"' : ''?>></li>
									<?php $idx++; } ?>
								</ol>
								<div class="carousel slide" data-ride="carousel">
									<div class="carousel-inner pt-0 rounded-3">
										<?php $idx = 0; foreach($query->result() as $row) { ?>
											<div class="carousel-item <?=$idx == 0 ? 'active' : ''?>">
												<img src="<?=base_url('media_library/image_sliders/'.$row->image);?>" class="img-fluid w-100">
												<!-- <div class="carousel-caption d-none d-md-block">
													<p class="text-center mb-3"><?=$row->caption;?></p>
												</div> -->
											</div>
										<?php $idx++; } ?>
									</div>
								</div>
							</div>
						<!-- </div> -->
						<!-- <div class="col-4 p-0 ml-2" style="background-color: #ef4e17">
						<div class="col-4 p-0 ml-2">
							<div class="d-flex flex-column">
								<div class="h-50 w-100 p-1 mb-2 rounded-lg" style="background-image: linear-gradient(to right, #a1d0eb, #ef4e17)">
									<h5 class="text-center mb-3">VISI</h5>
									<p class="text-center text-capitalize fs-5">terwujudnya sistem perencanaan pembangunan kabupaten kotabaru yang efektif, murah dan cepat untuk meningkatkan perekonomian menjadi lebih baik</p>
								</div>
								<div class="h-50 w-100 p-1 rounded-lg" style="background-image: linear-gradient(to right, #a1d0eb, #e0d0d0)">
									<h5 class="text-center mb-3">MISI</h5>
									<p class="text-center text-capitalize fs-5 mb-2">terwujudnya sistem perencanaan pembangunan kabupaten kotabaru yang efektif, murah dan cepat untuk meningkatkan perekonomian menjadi lebih baik</p>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			<?php } ?>
			<!-- /IMAGE SLIDERS -->

			<!-- QUOTE -->
			<!-- <?php $query = get_quotes(); if ($query->num_rows() > 0) { ?>
				<div class="container p-0 mb-3">
					<div class="quote">
						<div class="quote-title"><i class="fa fa-comments"></i> KUTIPAN</div>
						<ul id="quote" class="quote">
							<?php foreach($query->result() as $row) { ?>
								<li><?=$row->quote?>. <span class="font-weight-bold"><?=$row->quote_by?></span></li>
							<?php } ?>
						</ul>
					</div>
				</div>
			<?php } ?> -->
			<!--  /QUOTE -->
		<?php } ?>
	</header>
	<main class="bg-white p-3 my-2">
        <div class="d-flex flex-wrap justify-content-between">
            <div class="col-4 p-1">
                <img src="https://dbdzm869oupei.cloudfront.net/img/vinylrugs/preview/38592.png" class="img-fluid">
            </div>
            <div class="col-4 p-1">
                <img src="https://dbdzm869oupei.cloudfront.net/img/vinylrugs/preview/38592.png" class="img-fluid">
            </div>
            <div class="col-4 p-1">
                <img src="https://dbdzm869oupei.cloudfront.net/img/vinylrugs/preview/38592.png" class="img-fluid">
            </div>
            <div class="col-4 p-1">
                <img src="https://dbdzm869oupei.cloudfront.net/img/vinylrugs/preview/38592.png" class="img-fluid">
            </div>
            <div class="col-4 p-1">
                <img src="https://dbdzm869oupei.cloudfront.net/img/vinylrugs/preview/38592.png" class="img-fluid">
            </div>
            <div class="col-4 p-1">
                <img src="https://dbdzm869oupei.cloudfront.net/img/vinylrugs/preview/38592.png" class="img-fluid">
            </div>
        </div>
    </main>
	<main class="p-3 my-2">
        <h5>Guru SMKN 1 Kotabaru</h5>
        <div class="d-flex">
            <div class="col-4">
                <div class="card">
                    <img src="https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,ar_5:7/v1634025439/0180d071d9e3bd18b55dcc4924f48437.jpg" alt="">
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <img src="https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,ar_5:7/v1634025439/a9e36e666c24649ccb9a234f3de7af4bddde0c8158b5161ac44de9a0e6018f6a.jpg" alt="">
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <img src="https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,ar_5:7/v1634025439/c0cedaa80899021c1a0da45c74002c51b2f0db6f739b83c671f754bd77a87375.jpg" alt="">
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <img src="https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,ar_5:7/v1634025439/8b55570d5e6b566271c809f0da6a4b96e8b673ae1fa7fd88835169a5262301b3.jpg" alt="">
                </div>
            </div>
        </div>
    </main>
	<section class="content">
		<div class="container px-3">
			<div class="row">
				<?php $this->load->view($content)?>
			</div>
		</div>
	</section>
	<footer>
		<div class="container-fluid primary-footer">
			<div class="container px-3">
				<div class="row">
					<div class="col-md-4 col-xs-12 text-md-left mb-2 mt-2">
					<!-- <div class="col-md-6 col-xs-12 text-md-left mb-2 mt-2"> -->
						<h6 class="page-title">Hubungi Kami</h6>
						<p><?=__session('school_name')?> &sdot; <?=__session('tagline')?></p>
						<dl class="row">
							<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-map-marker"></span> Alamat</dt>
							<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('street_address')?></dd>
							<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-phone"></span> Telepon</dt>
							<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('phone')?></dd>
							<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-envelope"></span> Email</dt>
							<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('email')?></dd>
						</dl>
					</div>
					<div class="col-md-4 col-xs-12 text-md-left mb-2 mt-2">
					<!-- <div class="col-md-6 col-xs-12 text-md-left mb-2 mt-2"> -->
						<h6 class="page-title">Tags</h6>
						<div class="tag-content-block tag">
							<?php $query = get_tags(10); if ($query->num_rows() > 0) { ?>
								<?php foreach ($query->result() as $row) { ?>
									<a href="<?=site_url('tag/'.$row->slug)?>"><?=$row->tag?></a>
								<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="col-md-4 col-xs-12 text-md-left mb-2 mt-2">
						<h6 class="page-title">Ikuti Kami</h6>
						<ul class="list-unstyled">
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
		</div>
		<div class="container-fluid secondary-footer">
			<div class="container copyright">
				<div class="row pt-1 pb-1">
					<div class="col-md-6 col-xs-12 text-md-left text-center">
						<?=copyright(2019, base_url(), __session('school_name'))?>
					</div>
					<div class="col-md-6 col-xs-12 text-md-right text-center">
						Powered by <a href="https://tukarjual.com">TukarJual</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div id="search_form">
		<form action="<?=site_url('hasil-pencarian')?>" method="POST">
			<input type="search_form" name="keyword" autocomplete="off" placeholder="Masukan kata kunci pencarian" />
			<button type="submit" class="btn btn-lg btn btn-outline-light rounded-0"><i class="fa fa-search"></i> CARI</button>
		</form>
	</div>
	<a href="javascript:" id="return-to-top" class="rounded-lg"><i class="fa fa-angle-double-up"></i></a>
	</div>
</body>
</html>
