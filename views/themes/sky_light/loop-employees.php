<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<script type="text/javascript">
var page = 1;
var total_page = "<?=$total_page;?>";
$(document).ready(function() {
	if (parseInt(total_page) == page || parseInt(total_page) == 0) {
		$('.more-employees').remove();
	}
});

function get_employees() {
	page++;
	var data = {
		page_number: page
	};
	if ( page <= parseInt(total_page) ) {
		_H.Loading( true );
		$.post( _BASE_URL + 'public/employee_directory/get_employees', data, function( response ) {
			_H.Loading( false );
			var res = _H.StrToObject( response );
			var rows = res.rows;
			var str = '';
			var no = parseInt($('.number:last').text()) + 1;
			for (var z in rows) {
				var row = rows[ z ];
				str += '<div class="col-md-6 mb-4 profile-alumni">';
				str += '<div class="card h-100 border border-secondary rounded-0">';
				str += '<div class="row no-gutters">';
				str += '<div class="col-md-4">';
				str += '<img src="' + row.photo + '" class="card-img border border-secondary rounded-0 m-2">';
				str += '</div>';
				str += '<div class="col-md-8">';
				str += '<div class="card-body pt-2 pb-2">';
				str += '<dl class="row">';
				str += '<dt class="col-sm-5">Nama Lengkap</dt>';
				str += '<dd class="col-sm-7">' + row.full_name + '</dd>';
				str += '<dt class="col-sm-5">NIK</dt>';
				str += '<dd class="col-sm-7">' + row.nik + '</dd>';
				str += '<dt class="col-sm-5">Jenis Kelamin</dt>';
				str += '<dd class="col-sm-7">' + row.gender + '</dd>';
				str += '<dt class="col-sm-5">Tempat Lahir</dt>';
				str += '<dd class="col-sm-7">' + row.birth_place + '</dd>';
				str += '<dt class="col-sm-5">Tanggal Lahir</dt>';
				str += '<dd class="col-sm-7">' + row.birth_date + '</dd>';
				str += '<dt class="col-sm-5">Jenis GTK</dt>';
				str += '<dd class="col-sm-7">' + row.employment_type + '</dd>';
				str += '</dl>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
				str += '</div>';
			}
			var elementId = $("div.profile-alumni:last");
			$( str ).insertAfter( elementId );
			if ( page == parseInt(total_page) ) $('.more-employees').remove();
		});
	}
}
</script>
<div class="bg-white p-3 my-2">
	<!-- <h5 class="page-title mb-3"><?=$page_title?></h5> -->
    <h5 class="border-start border-5 border-warning px-2 mb-3">Guru Pengajar</h5>
		<?php foreach($query->result() as $row) { ?>
			<div class="card border border-secondary rounded-3 mb-3 shadow-sm">
				<div class="card-body pt-2 pb-2">
					<dl class="row mb-0">
						<dt class="col-5">Nama Lengkap</dt>
						<dd class="col-7 px-0"><?=$row->full_name?></dd>

						<dt class="col-5">NIP</dt>
						<dd class="col-7 px-0"><?=$row->nip?></dd>

						<dt class="col-5">Jenis Kelamin</dt>
						<dd class="col-7 px-0"><?=$row->gender?></dd>

						<dt class="col-5">Jabatan</dt>
						<dd class="col-7 px-0"><?=$row->mother_name?></dd>
					</dl>
				</div>
			</div>
		<?php } ?>
	<div class="px-3 d-flex justify-content-end align-items-center mb-3 w-100 more-employees">
		<button type="button" onclick="get_employees()" class="btn btn-sm btn-outline-warning"><i class="fa fa-refresh"></i> Tampilkan Lebih Banyak</button>
	</div>
</div>
