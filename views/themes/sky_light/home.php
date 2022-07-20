<!-- CONTENT -->
<div class="bg-white p-3 my-2">
	<!-- TULISAN POPULER -->
	<?php $query = get_latest_posts(5); if ($query->num_rows() > 0) { ?>
		<h5 class="border-start border-5 border-warning px-2 mb-3">Tulisan Terbaru</h5>
		<?php foreach($query->result() as $row) { ?>
			<div class="card mb-3 border-0 border-0 border-bottom rounded-0 pb-2">
				<div class="row g-0">
					<div class="col-3 d-flex">
						<img src="<?=base_url('media_library/posts/medium/'.$row->post_image)?>" class="img-fluid h-100 rounded-start" style="padding-right: 5px" alt="<?=$row->post_title?>">
					</div>
					<div class="col-9">
						<div class="card-body p-0">
							<h5 class="card-title mb-0"><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>" class="text-decoration-none"><?=substr($row->post_title, 0, 25)?>...</a></h5>
							<p class="card-text"><?=substr(strip_tags($row->post_content), 0, 50)?>...</p>
							<!-- <div class="d-flex justify-content-between align-items-center mt-1">
								<small class="text-muted"><?=date('d/m/Y H:i', strtotime($row->created_at))?> WIB - <?=$row->post_author?></small>
								<a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>" class="btn btn-sm action-button rounded-0"><i class="fa fa-search"></i></a>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		<?php } ?>
	<?php } ?>

	<!-- Photo Terbaru -->
	<?php $query = get_albums(4); if ($query->num_rows() > 0) { ?>
		<h5 class="page-title mt-3 mb-3">Foto Terbaru</h5>
		<div class="row">
			<?php foreach($query->result() as $row) { ?>
				<div class="col-md-6 mb-3">
					<div class="card h-100 shadow-sm border border-secondary rounded-0">
						<img src="<?=base_url('media_library/albums/'.$row->album_cover)?>" class="card-img-top rounded-0">
						<div class="card-body pb-2">
							<h5 class="card-title"><?=$row->album_title?></h5>
							<p class="card-text"><?=$row->album_description?></p>
						</div>
						<div class="card-footer">
							<button type="button" onclick="photo_preview(<?=$row->id?>)" class="btn action-button rounded-0 float-right"><i class="fa fa-search"></i></button>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
	<?php } ?>

	<!-- Video Terbaru -->
	<?php $query = get_videos(2); if ($query->num_rows() > 0) { ?>
		<h5 class="page-title mt-3 mb-3">Video Terbaru</h5>
		<div class="row">
			<?php foreach($query->result() as $row) { ?>
				<div class="col-md-6 mb-3">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?=$row->post_content?>" allowfullscreen></iframe>
					</div>
				</div>
			<?php } ?>
		</div>
	<?php } ?>
</div>

<?php //$this->load->view('themes/sky_light/sidebar')?>
