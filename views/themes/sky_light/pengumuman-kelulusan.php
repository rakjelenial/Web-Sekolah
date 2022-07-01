<div class="col-lg-12 col-md-12 col-sm-12 ">
	<h5 class="page-title mb-3"><?=$page_title?></h5>
	<div class="card rounded-0 border border-secondary mb-3">
		<form action="<?= base_url('kelulusan') ?>" method="post">
			<div class="card-body">
				<h3>Masukkan nomor NISN untuk melihat status LULUS / TIDAK LULUS</h3>
				<div class="form-group row mb-2">
					<label for="registration_number" class="col-sm-2 control-label">Nomor NISN <span style="color: red">*</span></label>
					<div class="col-sm-5">
						<input type="text" class="form-control form-control-sm rounded-0 border border-secondary" id="registration_number" name="registration_number">
					</div>
				</div>
				<!-- <div class="form-group row mb-2">
					<label for="birth_date" class="col-sm-3 control-label">Tanggal Lahir <span style="color: red">*</span></label>
					<div class="col-sm-9">
						<div class="input-group">
							<input type="text" readonly class="form-control form-control-sm rounded-0 border border-secondary date" id="birth_date" name="birth_date">
							<div class="input-group-append">
								<span class="btn btn-sm btn-outline-secondary rounded-0"><i class="fa fa-calendar text-dark"></i></span>
							</div>
						</div>
					</div>
				</div> -->
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
					<div class="offset-sm-3 col-sm-5">
						<button type="submit" class="btn action-button rounded-0"><i class="fa fa-send"></i> <?=$button?></button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<?php //$this->load->view('themes/sky_light/sidebar')?>
