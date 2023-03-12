<div class="col-lg-12 col-md-12 col-sm-12 ">
	<h5 class="page-title mb-3"><?=$page_title?></h5>
	<div class="card rounded-0 border border-secondary mb-3">
		<div class="card-body">
			<form>
				<div class="form-group row mb-2">
					<label for="is_transfer" class="col-sm-4 control-label">Jenis Pendaftaran <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<?=form_dropdown('is_transfer', ['' => 'Pilih :', 'false' => 'Baru', 'true' => 'Pindahan'], set_value('is_transfer'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="is_transfer"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="admission_type_id" class="col-sm-4 control-label">Jalur Pendaftaran <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<?=form_dropdown('admission_type_id', $admission_types, set_value('admission_type_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="admission_type_id"')?>
					</div>
				</div>

				<!-- Khusus SMA/SMK/PT -->
				<?php if (__session('major_count') > 0) { ?>
				<h6 class="page-title mb-3">Registrasi Peserta Didik</h6>
					<div class="form-group row mb-2">
						<label for="first_choice_id" class="col-sm-4 control-label">Pilih Jurusan <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<?=form_dropdown('first_choice_id', $majors, set_value('first_choice_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control" id="first_choice_id" onchange="check_options(1)" onblur="check_options(1)" onmouseup="check_options(1)"')?>
						</div>
					</div>
					<!-- <div class="form-group row mb-2">
						<label for="second_choice_id" class="col-sm-4 control-label">Pilihan II (Dua) <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<?//=form_dropdown('second_choice_id', $majors, set_value('second_choice_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="second_choice_id" onchange="check_options(2)" onblur="check_options(2)" onmouseup="check_options(2)"')?>
						</div>
					</div> -->
				<?php } ?>

				<!-- Khusus SMP/Sederajat dan SMA/Sederajat -->
				<?php //if (__session('school_level') == 2 || __session('school_level') == 3 || __session('school_level') == 4) { ?>
					<!-- <div class="form-group row mb-2">
						<label for="prev_exam_number" class="col-sm-4 control-label">Nomor Peserta Ujian Nasional Sebelumnya</label>
						<div class="col-sm-8">
							<input type="text" value="<?php //echo set_value('prev_exam_number')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="prev_exam_number" name="prev_exam_number">
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="paud" class="col-sm-4 control-label">Apakah pernah PAUD</label>
						<div class="col-sm-8">
							<?//=form_dropdown('paud', ['' => 'Pilih :', 'false' => 'Tidak', 'true' => 'Ya'], set_value('paud'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="paud"')?>
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="tk" class="col-sm-4 control-label">Apakah pernah TK</label>
						<div class="col-sm-8">
							<?//=form_dropdown('tk', ['' => 'Pilih :', 'false' => 'Tidak', 'true' => 'Ya'], set_value('tk'), 'class="custom-select custom-select-sm rounded-0 border border-secondary" id="tk"')?>
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="skhun" class="col-sm-4 control-label">Nomor Seri SKHUN Sebelumnya</label>
						<div class="col-sm-8">
							<input type="text" value="<?php //echo set_value('skhun')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="skhun" name="skhun" placeholder="Nomor Surat Keterangan Hasil Ujian Nasional">
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="prev_diploma_number" class="col-sm-4 control-label">Nomor Seri Ijazah Sebelumnya</label>
						<div class="col-sm-8">
							<input type="text" value="<?php //echo set_value('prev_diploma_number')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="prev_diploma_number" name="prev_diploma_number" placeholder="Nomor Seri Ijazah Sebelumnya">
						</div>
					</div> -->
				<?php //} ?>
				<div class="form-group row mb-2">
					<label for="hobby" class="col-sm-4 control-label">Hobi</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('hobby')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="hobby" name="hobby">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="ambition" class="col-sm-4 control-label">Cita-cita</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('ambition')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="ambition" name="ambition">
					</div>
				</div>

				<!-- Biodata -->
				<h6 class="page-title mb-3">Data Pribadi</h6>
				<div class="form-group row mb-2">
					<label for="full_name" class="col-sm-4 control-label">Nama Lengkap <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('full_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="full_name" name="full_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="gender" class="col-sm-4 control-label">Jenis Kelamin <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<?=form_dropdown('gender', ['' => 'Pilih :', 'M' => 'Laki-laki', 'F' => 'Perempuan'], '', 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="gender"')?>
					</div>
				</div>

				<!-- Khusus SMP/Sederajat, SMA/Sederajat -->
				<?php if (__session('school_level') == 2 || __session('school_level') == 3 || __session('school_level') == 4) { ?>
					<div class="form-group row mb-2">
						<label for="nisn" class="col-sm-4 control-label">NISN <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<input type="text" value="<?php echo set_value('nisn')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="nisn" name="nisn" placeholder="Nomor Induk Sekolah Nasional">
						</div>
					</div>
				<?php } ?>

				<!-- Khusus Selain SD -->
				<?php if (__session('school_level') != 1) { ?>
					<div class="form-group row mb-2">
						<label for="nkk" class="col-sm-4 control-label">No. Kartu Keluarga <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<input type="text" value="<?php echo set_value('nkk')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="nkk" name="nkk" placeholder="Nomor Kartu Keluarga">
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="nik" class="col-sm-4 control-label">NIK <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<input type="text" value="<?php echo set_value('nik')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="nik" name="nik" placeholder="Nomor Induk Kependudukan">
						</div>
					</div>
					<div class="form-group row mb-2">
						<label for="no_akta" class="col-sm-4 control-label">No. Akta Kelahiran <span style="color: red">*</span></label>
						<div class="col-sm-8">
							<input type="text" value="<?php echo set_value('no_akta')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="no_akta" name="no_akta" placeholder="Nomor Akta Kelahiran">
						</div>
					</div>
				<?php } ?>

				<div class="form-group row mb-2">
					<label for="birth_place" class="col-sm-4 control-label">Tempat Lahir <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('birth_place')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="birth_place" name="birth_place">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="birth_date" class="col-sm-4 control-label">Tanggal Lahir <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" readonly class="form-control form-control-sm rounded-0 border border-secondary date" id="birth_date" name="birth_date">
							<div class="input-group-append">
								<span class="btn btn-sm btn-outline-secondary rounded-0"><i class="fa fa-calendar text-dark"></i></span>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="religion_id" class="col-sm-4 control-label">Agama <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<?=form_dropdown('religion_id', $religions, set_value('religion_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="religion_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="prev_school_name" class="col-sm-4 control-label">Nama Sekolah Asal <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('prev_school_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="prev_school_name" name="prev_school_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="tahun_lulus" class="col-sm-4 control-label">Tahun Lulus Sekolah Sebelumnya <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('tahun_lulus')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="tahun_lulus" name="tahun_lulus" placeholder="Tahun Lulus Sekolah SMP / Sederajat. contoh : 2020">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="special_need_id" class="col-sm-4 control-label">Kebutuhan Khusus</label>
					<div class="col-sm-8">
						<?=form_dropdown('special_need_id', $special_needs, set_value('special_need_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="special_need_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="street_address" class="col-sm-4 control-label">Alamat Jalan <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<textarea rows="4" name="street_address" id="street_address" class="form-control form-control-sm rounded-0 border border-secondary"><?php echo set_value('street_address')?></textarea>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="rt" class="col-sm-4 control-label">RT</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('rt')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="rt" name="rt" placeholder="Rukun Tetangga">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="rw" class="col-sm-4 control-label">RW</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('rw')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="rw" name="rw" placeholder="Rukun Warga">
					</div>
				</div>
				<!-- <div class="form-group row mb-2">
					<label for="sub_village" class="col-sm-4 control-label">Nama Dusun</label>
					<div class="col-sm-8">
						<input type="text" value="<?php //echo set_value('sub_village')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="sub_village" name="sub_village">
					</div>
				</div> -->
				<div class="form-group row mb-2">
					<label for="village" class="col-sm-4 control-label">Nama Kelurahan / Desa</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('village')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="village" name="village">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="sub_district" class="col-sm-4 control-label">Kecamatan</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('sub_district')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="sub_district" name="sub_district">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="district" class="col-sm-4 control-label">Kabupaten <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('district')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="district" name="district">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="postal_code" class="col-sm-4 control-label">Kode Pos</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('postal_code')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="postal_code" name="postal_code">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="residence_id" class="col-sm-4 control-label">Tempat Tinggal</label>
					<div class="col-sm-8">
						<?=form_dropdown('residence_id', $residences, set_value('residence_id'), 'class="form-control form-control-sm rounded-0 border border-secondary" id="residence_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="transportation_id" class="col-sm-4 control-label">Moda Transportasi</label>
					<div class="col-sm-8">
						<?=form_dropdown('transportation_id', $transportations, set_value('transportation_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control" id="transportation_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mobile_phone" class="col-sm-4 control-label">Nomor HP <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('mobile_phone')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="mobile_phone" name="mobile_phone">
					</div>
				</div>
				<!-- <div class="form-group row mb-2">
					<label for="phone" class="col-sm-4 control-label">Nomor Telepon</label>
					<div class="col-sm-8">
						<input type="text" value="<?php //echo set_value('phone')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="phone" name="phone">
					</div>
				</div> -->
				<div class="form-group row mb-2">
					<label for="email" class="col-sm-4 control-label">E-mail Pribadi</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('email')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="email" name="email">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="sktm" class="col-sm-4 control-label">No. Surat Keterangan Tidak Mampu (SKTM)</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('sktm')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="sktm" name="sktm">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="kks" class="col-sm-4 control-label">No. Kartu Keluarga Sejahtera (KKS)</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('kks')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="kks" name="kks">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="kps" class="col-sm-4 control-label">No. Kartu Pra Sejahtera (KPS)</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('kps')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="kps" name="kps">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="kip" class="col-sm-4 control-label">No. Kartu Indonesia Pintar (KIP)</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('kip')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="kip" name="kip">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="kis" class="col-sm-4 control-label">No. Kartu Indonesia Sehat (KIS)</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('kis')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="kis" name="kis">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="citizenship" class="col-sm-4 control-label">Kewarganegaraan <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<select name="citizenship" id="citizenship" class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" onchange="change_country_field()" onblur="change_country_field()" onmouseup="change_country_field()">
							<option value="">Pilih :</option>
							<option value="WNI">Warga Negara Indonesia (WNI)</option>
							<option value="WNA">Warga Negara Asing (WNA)</option>
						</select>
					</div>
				</div>
				<div class="form-group row mb-2 country">
					<label for="country" class="col-sm-4 control-label">Nama Negara</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('country')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="country" name="country" placeholder="Diisi jika warga negara asing">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="country" class="col-sm-4 control-label">Photo</label>
					<div class="col-sm-8">
						<input type="file" id="photo" name="photo">
						<small class="form-text text-muted">Foto harus JPG dan ukuran file maksimal 1 Mb</small>
					</div>
				</div>
				<!-- <h6 class="page-title mb-3">Nilai Ujian Nasional</h6>
				<label class="badge" for=""><span style="color: red">*</span>Gunakan Titik(.) untuk memisahkan nilai koma. Misal: 80.75</label>
				<div class="form-group row mb-2">
					<label for="bhs_indo" class="col-sm-4 control-label">Bahasa Indonesia<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php //echo set_value('bhs_indo')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="bhs_indo" name="bhs_indo">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="bhs_inggris" class="col-sm-4 control-label">Bahasa Inggris<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php //echo set_value('bhs_inggris')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="bhs_inggris" name="bhs_inggris">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mtk" class="col-sm-4 control-label">Matematika<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="" class="form-control form-control-sm rounded-0 border border-secondary" id="mtk" name="mtk">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="ipa" class="col-sm-4 control-label">IPA<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php //echo set_value('ipa')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="ipa" name="ipa">
					</div>
				</div> -->

				<!-- Ayah -->
				<h6 class="page-title mb-3">Data Ayah Kandung</h6>
				<div class="form-group row mb-2">
					<label for="father_name" class="col-sm-4 control-label">Nama Ayah Kandung <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('father_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="father_name" name="father_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="nik_father" class="col-sm-4 control-label">NIK Ayah<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('nik_father')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="nik_father" name="nik_father" placeholder="Nomor Induk Kependudukan">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="father_birth_year" class="col-sm-4 control-label">Tahun Lahir <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('father_birth_year')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="father_birth_year" name="father_birth_year" placeholder="Tahun Lahir Ayah Kandung. contoh : 1965">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="father_education_id" class="col-sm-4 control-label">Pendidikan</label>
					<div class="col-sm-8">
						<?=form_dropdown('father_education_id', $educations, set_value('father_education_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="father_education_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="father_employment_id" class="col-sm-4 control-label">Pekerjaan</label>
					<div class="col-sm-8">
						<?=form_dropdown('father_employment_id', $employments, set_value('father_employment_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="father_employment_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="father_monthly_income_id" class="col-sm-4 control-label">Penghasilan Bulanan</label>
					<div class="col-sm-8">
						<?=form_dropdown('father_monthly_income_id', $monthly_incomes, set_value('father_monthly_income_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="father_monthly_income_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="phone_father" class="col-sm-4 control-label">Nomor HP <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('phone_father')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="phone_father" name="phone_father">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="father_special_need_id" class="col-sm-4 control-label">Kebutuhan Khusus</label>
					<div class="col-sm-8">
						<?=form_dropdown('father_special_need_id', $special_needs, set_value('father_special_need_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="father_special_need_id"')?>
					</div>
				</div>

				<!-- Ibu -->
				<h6 class="page-title mb-3">Data Ibu Kandung</h6>
				<div class="form-group row mb-2">
					<label for="mother_name" class="col-sm-4 control-label">Nama Ibu Kandung <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('mother_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="mother_name" name="mother_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="nik_mother" class="col-sm-4 control-label">NIK Ibu<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('nik_mother')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="nik_mother" name="nik_mother" placeholder="Nomor Induk Kependudukan">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mother_birth_year" class="col-sm-4 control-label">Tahun Lahir <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('mother_birth_year')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="mother_birth_year" name="mother_birth_year" placeholder="Tahun Lahir Ibu Kandung. contoh : 1965">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mother_education_id" class="col-sm-4 control-label">Pendidikan</label>
					<div class="col-sm-8">
						<?=form_dropdown('mother_education_id', $educations, set_value('mother_education_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="mother_education_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mother_employment_id" class="col-sm-4 control-label">Pekerjaan</label>
					<div class="col-sm-8">
						<?=form_dropdown('mother_employment_id', $employments, set_value('mother_employment_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="mother_employment_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mother_monthly_income_id" class="col-sm-4 control-label">Penghasilan Bulanan</label>
					<div class="col-sm-8">
						<?=form_dropdown('mother_monthly_income_id', $monthly_incomes, set_value('mother_monthly_income_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="mother_monthly_income_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="phone_mother" class="col-sm-4 control-label">Nomor HP <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('phone_mother')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="phone_mother" name="phone_mother">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mother_special_need_id" class="col-sm-4 control-label">Kebutuhan Khusus</label>
					<div class="col-sm-8">
						<?=form_dropdown('mother_special_need_id', $special_needs, set_value('mother_special_need_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="mother_special_need_id"')?>
					</div>
				</div>

				<!-- Wali -->
				<h6 class="page-title mb-3">Data Wali</h6>
				<div class="form-group row mb-2">
					<label for="guardian_name" class="col-sm-4 control-label">Nama Wali</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('guardian_name')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="guardian_name" name="guardian_name">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="nik_guardian" class="col-sm-4 control-label">NIK Wali</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('nik_guardian')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="nik_guardian" name="nik_guardian" placeholder="Nomor Induk Kependudukan">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="guardian_birth_year" class="col-sm-4 control-label">Tahun Lahir </label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('guardian_birth_year')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="guardian_birth_year" name="guardian_birth_year" placeholder="Tahun Lahir Wali. contoh : 1965">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="guardian_education_id" class="col-sm-4 control-label">Pendidikan</label>
					<div class="col-sm-8">
						<?=form_dropdown('guardian_education_id', $educations, set_value('guardian_education_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="guardian_education_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="guardian_employment_id" class="col-sm-4 control-label">Pekerjaan</label>
					<div class="col-sm-8">
						<?=form_dropdown('guardian_employment_id', $employments, set_value('guardian_employment_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="guardian_employment_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="guardian_monthly_income_id" class="col-sm-4 control-label">Penghasilan Bulanan</label>
					<div class="col-sm-8">
						<?=form_dropdown('guardian_monthly_income_id', $monthly_incomes, set_value('guardian_monthly_income_id'), 'class="custom-select custom-select-sm rounded-0 border border-secondary form-control-sm" id="guardian_monthly_income_id"')?>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="phone_guardian" class="col-sm-4 control-label">Nomor HP</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('phone_guardian')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="phone_guardian" name="phone_guardian">
					</div>
				</div>
				<h6 class="page-title mb-3">Alamat Orang Tua / Wali</h6>
				<div class="form-group row mb-2">
					<label for="address_parent" class="col-sm-4 control-label">Alamat Lengkap <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<textarea rows="4" name="address_parent" id="address_parent" class="form-control form-control-sm rounded-0 border border-secondary"><?php echo set_value('address_parent')?></textarea>
					</div>
				</div>
				<!-- Data Periodik -->
				<h6 class="page-title mb-3">Data Periodik</h6>
				<div class="form-group row mb-2">
					<label for="height" class="col-sm-4 control-label">Tinggi Badan (Cm)<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('height')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="height" name="height">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="weight" class="col-sm-4 control-label">Berat Badan (Kg)<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('weight')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="weight" name="weight">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="lingkar_kpl" class="col-sm-4 control-label">Lingkar Kepala (Cm)<span style="color: red">*</span></label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('lingkar_kpl')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="lingkar_kpl" name="lingkar_kpl">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="mileage" class="col-sm-4 control-label">Jarak Tempat Tinggal ke Sekolah (Km)</label>
					<div class="col-sm-8">
						<input type="text" value="<?php echo set_value('mileage')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="mileage" name="mileage">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="traveling_time" class="col-sm-4 control-label">Waktu Tempuh ke Sekolah (Menit)</label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('traveling_time')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="traveling_time" name="traveling_time">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="sibling_number" class="col-sm-4 control-label">Jumlah Saudara Kandung</label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('sibling_number')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="sibling_number" name="sibling_number">
					</div>
				</div>
				<div class="form-group row mb-2">
					<label for="anak_ke" class="col-sm-4 control-label">Anak Ke-</label>
					<div class="col-sm-8">
						<input type="number" value="<?php echo set_value('anak_ke')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="anak_ke" name="anak_ke">
					</div>
				</div>
				<!-- <div class="form-group row mb-2">
					<label for="latitude" class="col-sm-2 control-label">Titik Koordinat</label>
					<div class="col-sm-2 mb-2">
						<button onclick="cariLocation()" class="btn btn-sm btn-info float-right">Cari Lokasi</button>
					</div>
					<div class="col-sm-4 mb-2">
						<input type="text" id="latitude" readonly value="<?php //echo set_value('latitude')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="latitude" name="latitude">
					</div>
					<div class="col-sm-4 mb-2">
						<input type="text" id="longitude" readonly value="<?php //echo set_value('longitude')?>" class="form-control form-control-sm rounded-0 border border-secondary" id="longitude" name="longitude">
					</div>
				</div> -->

				<h6 class="page-title mb-3">Pernyataan dan Keamanan</h6>
				<div class="form-group row mb-2">
					<label for="declaration" class="col-sm-4 control-label">Pernyataan <span style="color: red">*</span></label>
					<div class="col-sm-8">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="declaration" id="declaration">
							<label class="form-check-label" for="declaration">
								Saya menyatakan dengan sesungguhnya bahwa isian data dalam formulir ini adalah benar. Apabila ternyata data tersebut tidak benar / palsu, maka saya bersedia menerima sanksi berupa <strong>Pembatalan</strong> sebagai <strong>Calon <?=__session('school_level') == 5 ? 'Mahasiswa' : 'Peserta Didik' ?></strong> <?=__session('school_name')?>
							</label>
						</div>
					</div>
				</div>
				<div class="form-group row mb-2">
					<label class="col-sm-4 control-label"></label>
					<div class="col-sm-8">
						<div class="g-recaptcha" data-sitekey="<?=$recaptcha_site_key?>"></div>
					</div>
				</div>
			</form>
		</div>
		<div class="card-footer">
			<div class="form-group row mb-0">
				<div class="offset-sm-4 col-sm-8">
					<button type="button" onclick="student_registration(); return false;" class="btn action-button rounded-0"><i class="fa fa-send"></i> Simpan Formulir Pra Pendaftaran</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://maps.google.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU"></script>
<script>
function cariLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
	document.getElementById('latitude').value = position.coords.latitude;
    document.getElementById('longitude').value = position.coords.longitude;
}
</script>