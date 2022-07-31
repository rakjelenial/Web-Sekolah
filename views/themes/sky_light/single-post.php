<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<script type="text/javascript">
var page = 1;
var total_page = "<?=$total_page;?>";
$(document).ready(function() {
	if (parseInt(total_page) == page || parseInt(total_page) == 0) {
		$('.more-comments').remove();
	}
});
function get_post_comments() {
	page++;
	var data = {
		page_number: page,
		comment_post_id: '<?=$this->uri->segment(2)?>'
	};
	if ( page <= parseInt(total_page) ) {
		$.post( _BASE_URL + 'public/post_comments/get_post_comments', data, function( response ) {
			var res = _H.StrToObject( response );
			var rows = res.comments;
			var str = '';
			for (var z in rows) {
				var row = rows[ z ];
				str += '<div class="card rounded-0 border border-secondary mb-3 post-comments">';
				str += '<div class="card-body">';
				str += row.comment_content;
				str += '</div>';
				str += '<div class="card-footer">';
				str += '<small class="text-muted float-right">';
				str += row.created_at.substr(8, 2) + '/' + row.created_at.substr(5, 2) + '/' + row.created_at.substr(0, 4);
				str += ' ' + row.created_at.substr(11, 5);
				str += ' - ' + row.comment_author;
				str += '</small>';
				str += '</div>';
				str += '</div>';
			}
			var elementId = $(".post-comments:last");
			$( str ).insertAfter( elementId );
			if ( page == parseInt(total_page) ) $('.more-comments').remove();
		});
	}
}
</script>
<!-- CONTENT -->
<div class="bg-white p-3 mt-2">
	<div class="card border-0 mb-3">
		<?php if ($post_type == 'post' && file_exists('./media_library/posts/large/'.$query->post_image)) { ?>
			<img src="<?=base_url('media_library/posts/large/'.$query->post_image)?>" class="card-img-top rounded-3 w-100">
		<?php } ?>
		<div class="card-body px-0">
			<small class="text-muted fst-italic"><?=date('d/m/Y H:i', strtotime($query->created_at))?> - <?=$post_author?></small>
			<h4 class="card-title"><?=$query->post_title?></h4>
			<p class="card-text"><?=$query->post_content?></p>
		</div>
		<!-- <div class="card-footer">
			<small class="text-muted float-right"><?=date('d/m/Y H:i', strtotime($query->created_at))?> - <?=$post_author?></small>
		</div> -->
	</div>
</div>
<div class="bg-white p-3 my-2">
	<!--  Komentar-->
	<?php if ($post_comments->num_rows() > 0) { ?>
		<h5 class="border-start border-5 border-warning px-2 mb-3">Komentar</h5>
		<?php foreach($post_comments->result() as $row) { ?>
			<div class="card rounded-3 border border-secondary mb-3 post-comments">
				<div class="card-body">
					<p class="card-text"><?=strip_tags($row->comment_content)?></p>
				</div>
				<div class="card-footer">
					<small class="text-muted small fst-italic"><?=date('d/m/Y H:i', strtotime($row->created_at))?> - <?=$row->comment_author?></small>
				</div>
			</div>
		<?php } ?>
		<div class="justify-content-between align-items-center float-right mb-3 w-100 more-comments">
			<button type="button" onclick="get_post_comments()" class="btn action-button rounded-0"><i class="fa fa-refresh"></i> Komentar Lainnya</button>
		</div>
	<?php } ?>

	<!-- Form Comment -->
	<?php if (
		(
			$query->post_comment_status == 'open' &&
			filter_var(__session((string) 'comment_registration'), FILTER_VALIDATE_BOOLEAN) &&
			$this->auth->hasLogin()
			) ||
			(
				$query->post_comment_status == 'open' &&
				__session('comment_registration') == 'false'
				)
			) { ?>
				<!-- <h5 class="page-title mt-3 mb-3">Komentari Tulisan Ini</h5> -->
				<h5 class="border-start border-5 border-warning px-2 mb-3">Kirim Komentar</h5>
				<div class="card rounded-3 border border-secondary mb-3">
					<div class="card-body">
						<div class="form-group row mb-2">
							<label for="comment_author" class="col-sm-3 control-label">Nama Lengkap <span style="color: red">*</span></label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm border border-secondary" id="comment_author" name="comment_author">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="comment_email" class="col-sm-3 control-label">Email <span style="color: red">*</span></label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm border border-secondary" id="comment_email" name="comment_email">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="comment_url" class="col-sm-3 control-label">URL</label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm border border-secondary" id="comment_url" name="comment_url">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="comment_content" class="col-sm-3 control-label">Komentar <span style="color: red">*</span></label>
							<div class="col-sm-9">
								<textarea name="name" class="form-control form-control-sm border border-secondary" id="comment_content" rows="4"></textarea>
							</div>
						</div>
						<?php if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') { ?>
							<div class="form-group row mb-2">
								<label class="col-sm-3 control-label"></label>
								<div class="col-sm-9">
									<div class="g-recaptcha" data-sitekey="<?=$recaptcha_site_key?>"></div>
								</div>
							</div>
						<?php } ?>
					</div>
					<div class="card-footer">
						<div class="form-group row mb-0">
							<div class="offset-sm-3 col-sm-9">
								<input type="hidden" name="comment_post_id" id="comment_post_id" value="<?=$this->uri->segment(2)?>">
								<button type="button" onclick="post_comments(); return false;" class="btn action-button"><i class="fa fa-send"></i> Submit</button>
							</div>
						</div>
					</div>
				</div>
			<?php } ?>
</div>
<div class="bg-white p-3">
			<!-- Get Anther Posts -->
			<?php $query = $post_type == 'post' ? get_related_posts($query->post_categories, _toInteger($this->uri->segment(2))) : get_another_pages(_toInteger($this->uri->segment(2)), 5); if ($query->num_rows() > 0) { ?>
				<h5 class="border-start border-5 border-warning px-2"><?=$post_type == 'post' ? 'Tulisan':'Halaman'?> Lainnya</h5>
				<?php foreach($query->result() as $row) { ?>
					<!-- <div class="card rounded-3 border border-secondary mb-3"> -->
					<div class="card mb-3 border-0 border-0 border-bottom rounded-0 pb-2">
						<div class="card-body p-0">
							<h5 class="card-title mb-0"><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>" class="text-decoration-none"><?=$row->post_title?></a></h5>
							<p class="card-text"><?=substr(strip_tags($row->post_content), 0, 85)?></p>
							<!-- <div class="d-flex justify-content-between align-items-center mt-1">
								<small class="text-muted fst-italic"><?=date('d/m/Y H:i', strtotime($row->created_at))?> WIB - <?=$row->post_author?></small>
								<a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>" class="btn btn-sm action-button rounded-0"><i class="fa fa-search"></i></a>
							</div> -->
						</div>
					</div>
				<?php } ?>
			<?php } ?>

		</div>
		<?php //$this->load->view('themes/sky_light/sidebar')?>
