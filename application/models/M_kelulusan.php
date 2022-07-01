<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * CMS Sekolahku | CMS (Content Management System) dan PPDB/PMB Online GRATIS
 * untuk sekolah SD/Sederajat, SMP/Sederajat, SMA/Sederajat, dan Perguruan Tinggi
 * @version    2.4.4
 * @author     Anton Sofyan | https://facebook.com/antonsofyan | 4ntonsofyan@gmail.com | 0857 5988 8922
 * @copyright  (c) 2014-2019
 * @link       https://sekolahku.web.id
 *
* PERINGATAN :
 * 1. TIDAK DIPERKENANKAN MENGGUNAKAN CMS INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 2. TIDAK DIPERKENANKAN MEMPERJUALBELIKAN APLIKASI INI TANPA SEIZIN DARI PIHAK PENGEMBANG APLIKASI.
 * 3. TIDAK DIPERKENANKAN MENGHAPUS KODE SUMBER APLIKASI.
 */

class M_kelulusan extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	// public static $table = 'students';
	public static $table = 'kelulusan';

	/**
	 * Admission Year
	 * @var Integer
	 */
	public $admission_year;

	/**
	 * Class Constructor
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
		$year = __session('admission_year');
		$this->admission_year = (NULL !== $year && $year > 0) ? $year : date('Y');
	}

	/**
	 * Display a listing of the resource.
	 * @param String $keyword
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		// $fields = [
		// 	"x1.id"
		// 	, "x1.registration_number"
		// 	, "x1.re_registration"
		// 	, "x1.created_at"
		// 	, "x1.full_name"
		// 	, "x1.birth_date"
		// 	, "IF(x1.gender = 'M', 'L', 'P') AS gender"
		// 	, "x1.photo"
		// 	, "x1.is_deleted"
		// ];
		$fields = [
			"x1.id"
			, "x1.nama_lengkap"
			, "x1.tanggal_lahir"
			, "x1.nis"
			, "x1.nisn"
			, "x1.jurusan"
			, "x1.status"
		];
		if (__session('major_count') > 0) {
			array_push($fields, 'x2.major_name AS first_choice');
			array_push($fields, 'x3.major_name AS second_choice');
		}
		$this->db->select(implode(', ', $fields));
		if (__session('major_count') > 0) {
			$this->db->join('majors x2', 'x1.first_choice_id = x2.id', 'LEFT');
			$this->db->join('majors x3', 'x1.second_choice_id = x3.id', 'LEFT');
		}
		$this->db->where('x1.is_prospective_student', 'true');
		$this->db->where('LEFT(x1.registration_number, 4) = ', $this->admission_year);
		if ( ! empty($keyword) ) {
			$this->db->group_start();
			$this->db->like('x1.registration_number', $keyword);
			$this->db->or_like('x1.re_registration', $keyword);
			$this->db->or_like('x1.created_at', $keyword);
			if (__session('major_count') > 0) {
				$this->db->or_like('x2.major_name', $keyword);
				$this->db->or_like('x3.major_name', $keyword);
			}
			$this->db->or_like('x1.full_name', $keyword);
			$this->db->or_like('x1.gender', $keyword);
			$this->db->group_end();
		}
		if ( $return_type == 'count' ) return $this->db->count_all_results(self::$table . ' x1');
		if ( $limit > 0 ) $this->db->limit($limit, $offset);
		return $this->db->get(self::$table . ' x1');
	}

	/**
	 * insert
	 * @param Int $selection_result
	 * @param Array $registration_number
	 * @return Boolean
	 */
	public function insert($selection_result, array $registration_number = []) {
		$approved = 0;
		$unapproved = 0;
		$error = 0;
		foreach($registration_number as $reg_number) {
			if ($selection_result != 'unapproved') {
				if ($this->check_quota($reg_number)) {
					$query = $this->db
						->where('registration_number', $reg_number)
						->update(self::$table, ['selection_result' => $selection_result]);
					$query ? $approved++ : $error++;
				} else {
					$unapproved++;
				}
			} else {
				$query = $this->db
					->where('registration_number', $reg_number)
					->update(self::$table, ['selection_result' => $selection_result]);
				$query ? $approved++ : $error++;
			}
		}
		$response = 'Sukses : '.$approved. ' SQL Error : '. $error.', Gagal : ' . $unapproved;
		return $response;
	}

	/**
	 * check_quota
	 * @access 	private
	 * @param String
	 * @return Boolean
	 */
	private function check_quota($registration_number) {
		// Get First Choice
		if (__session('major_count') > 0) {
			$student = $this->db
				->select('first_choice_id')
				->where('registration_number', $registration_number)
				->get(self::$table)
				->row();
		}

		// Set Default Quota
		$quota = 0;
		// Get Quota
		$this->db->select('quota');
		$this->db->where('year', $this->admission_year);
		// If SMK or PT
		if (__session('major_count') > 0) {
			$this->db->where('major_id', $student->first_choice_id);
		}
		$this->db->limit(1);
		$query = $this->db->get('admission_quotas');
		if ($query->num_rows() === 1) {
			$result = $query->row();
			$quota = $result->quota;
		}

		// Get Approved Students
		$approved = $this->db
			->where('is_prospective_student', 'true')
			->where('selection_result IS NOT NULL')
			->where('selection_result !=', 'unapproved')
			->where('LEFT(registration_number, 4) = ', $this->admission_year)
			->count_all_results(self::$table);
		return $quota > $approved;
	}

	/**
	 * Generate Registration Number
	 * @return Boolean
	 */
	public function registration_number() {
		$admission_year = $this->admission_year;
		$query = $this->db->query("
			SELECT MAX(RIGHT(registration_number, 6)) AS max_number
			FROM students
			WHERE is_prospective_student='true'
			AND LEFT(registration_number, 4) = ?
		", [$admission_year]);
		$registration_number = "000001";
		if ($query->num_rows() === 1) {
			$data = $query->row();
			$number = ((int) $data->max_number) + 1;
			$registration_number = sprintf("%06s", $number);
		}
		return $admission_year . $registration_number;
	}

	/**
	 * Generate Password Number
	 * @return Boolean
	 */
	public function password_number()
	{
		$admission_year = $this->admission_year;
		$query = $this->db->query("
			SELECT MAX(RIGHT(registration_number, 6)) AS max_number
			FROM students
			WHERE is_prospective_student='true'
			AND LEFT(registration_number, 4) = ?
		", [$admission_year]);
		$reg_number = "1";
		if ($query->num_rows() === 1) {
			$data = $query->row();
			$number = ((int) $data->max_number) + 1;
			$pass_number = $admission_year + $number;
		}else{
			$pass_number = $admission_year + $reg_number;
		}
		return $pass_number;
	}

	/**
	 * Selection Result
	 * @param String $registration_number
	 * @param String $birth_date
	 * @return Array
	 */
	// public function selection_result($registration_number, $birth_date) {
	public function selection_result($registration_number) {
		$query = $this->db
			->where('nisn', $registration_number)
			// ->where('birth_date', $birth_date)
			->get(self::$table);
		if ($query->num_rows() === 1) {
			$result = $query->row();
			if ($result->re_gistration === "false") {
				$response['status'] = 'danger';
				$response['message'] = 'Anda Tidak Lolos Seleksi Penerimaan Peserta Didik Baru '.__session('school_name');
			} else if ($result->selection_result === 'unapproved') {
				$response['status'] = 'warning';
				$response['message'] = 'Anda menjadi cadangan di '.__session('school_name');
			} else {
				// if (__session('major_count') > 0 AND !empty($result->selection_result)) {
				if (__session('major_count') > 0) {
					$response['status'] = 'white';
					$majors = $this->model->RowObject('id', $result->selection_result, 'majors');
					// $response['message'] = '<p>Anda dengan nomor registrasi '.$registration_number.'</p><p>Lolos Seleksi Penerimaan Peserta Didik Baru dan diterima di ' . __session('_major') . ' <span class="bg-warning">' . $majors->major_name . '</span> ' . __session('school_name').'</p>';
					$response['message'] = '
					<div style="max-width: 800px; margin: 0 auto">
						<div class="kop-surat d-flex justify-content-between text-center pb-1" style="border-bottom: 3px solid">
							<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Coat_of_arms_of_South_Kalimantan.svg/800px-Coat_of_arms_of_South_Kalimantan.svg.png" style="width:90px">
							<div style="font-size: 18px" class="d-flex flex-column">
								<span style="font-size: 18px;line-height: 0.8">PEMERINTAH PROVINSI KALIMANTAN SELATAN</span>
								<span style="font-size: 18px">DINAS PENDIDIKAN DAN KEBUDAYAAN</span>
								<h4 class="font-weight-bold m-0" style="line-height: 0.8">SMK NEGERI 1 KOTABARU</h4>
								<span style="font-size: 15px" class="font-weight-bold">NPSN. 30303326 NSS. 401150901001</span>
								<span style="font-size: 13px;line-height: 0.8">Jalan Berangas Km 4 No. 35 Telp/Fax: 0518-25330, Kotabaru - Prov. Kalsel 72112</span>
								<span style="font-size: 13px">email: smknegeri1kotabaru@gmail.com web: smkn1kotabaru.sch.id</span>
							</div>
							<img src="https://scontent.fbdj4-1.fna.fbcdn.net/v/t1.18169-9/431590_168574486588306_853826933_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGKFV3-Euh4ihrhBJC8WAACU54FnubKMs9TngWe5soyz_mAuOoahicRzm3BtibW18tJZOTox-c9hzm3Lox7Jf8D&_nc_ohc=ZJMWVx_PLV8AX8SlStV&_nc_ht=scontent.fbdj4-1.fna&oh=00_AT8uvOzTyQWhlNVF8lpxqkpyZsaH5-ODkLOF_rCcChvsHA&oe=62BC4A08" style="width:90px">
						</div>
					<h4 class="pt-4 mb-0 font-weight-bold"><u>SURAT KETERANGAN LULUS</u></h4>
					<p style="font-size: 18px" class="font-weight-bold">Nomor : 421.7/ 176  -SMKN 1 KTB/DISDIKBUD/2022</p>
					<p class="text-left" style="font-size: 18px">Kepala ' . __session('school_name').' selaku Ketua Penyelenggara Ujian Sekolah Tahun 2021/2022 berdasarkan:</p>
					<ol class="text-left pl-3" style="font-size: 18px">
						<li>Ketuntasan dari seluruh program pembelajaran pada Kurikulum 2013.</li>
						<li>Kriteria kelulusan dari satuan Pendidikan sesuai dengan peraturan perundang-
						undangan.</li>
						<li>Rapat Pleno Dewan Pendidik tentang Kelulusan pada tanggal 31 Mei 2022 menerangkan bahwa:</li>
					</ol>
					<table class="table-sm text-left my-5">
						<tr>
							<td style="font-size: 18px">Nama</td>
							<td style="font-size: 18px; padding:0 10px">:</td>
							<td style="font-size: 18px" class="font-weight-bold">'.$result->nama_lengkap.'</td>
						</tr>
						<tr>
							<td style="font-size: 18px">Tempat dan Tanggal Lahir</td>
							<td style="font-size: 18px; padding:0 10px">:</td>
							<td style="font-size: 18px">'.$result->tanggal_lahir.'</td>
						</tr>
						<tr>
							<td style="font-size: 18px">Nomor Induk Siswa</td>
							<td style="font-size: 18px; padding:0 10px">:</td>
							<td style="font-size: 18px">'.$result->nis.'</td>
						</tr>
						<tr>
							<td style="font-size: 18px">Nomor Induk Siswa Nasional</td>
							<td style="font-size: 18px; padding:0 10px">:</td>
							<td style="font-size: 18px">'.$result->nisn.'</td>
						</tr>
						<tr>
							<td style="font-size: 18px">Kompetensi Keahlian</td>
							<td style="font-size: 18px; padding:0 10px">:</td>
							<td style="font-size: 18px">'.$result->jurusan.'</td>
						</tr>
						<tr>
							<td style="font-size: 18px">Dinyatakan</td>
							<td style="font-size: 18px; padding:0 10px">:</td>
							<td style="font-size: 18px" class="font-weight-bold"><u>'.$result->status.'</u></td>
						</tr>
					</table>
					<p class="text-left" style="font-size: 18px">Demikian surat keterangan ini dibuat, untuk diketahui dan dipergunakan sebagaimana mestinya.</p>
					<table class="d-flex mt-5 justify-content-end text-left" style="font-size: 18px">
						<tr>
							<td></td>
							<td>
							Kotabaru, 3 Juni 2022 <br>
							Kepala, <br>
							<img src="./assets/img/stempel.png" style="width: 150px; margin:-35px 0 -30px -50px; position: relative">
							<img src="./assets/img/tanda-tangan.png" style="width: 170px; margin-left:-70px; position: relative"><br>
							Drs. Sugiyatno, M.Si <br>
							NIP 19620720 198703 1 013
							</td>
						</tr>
					</table>
					</div>';
					// <p>Anda dengan nomor registrasi '.$registration_number.'</p><p>Lolos Seleksi Penerimaan Peserta Didik Baru dan diterima di ' . __session('_major') . ' <span class="bg-warning">' . $majors->major_name . '</span> ' . __session('school_name').'</p>
				} else {
					// $response['status'] = 'warning';
					// $response['message'] = 'Pra registrasi Anda berhasil. Silahkan pantau terus web SMKN 1 Kotabaru untuk tahap Registrasi dan Peminatan';
			
					$data_session = array(
						'registration_number'	=> $registration_number
					);
					$this->session->set_userdata($data_session);
					// redirect('registrasi-mandiri-form');
					redirect('kelulusan');
				}
			}
		} else {
			$response['status'] = 'warning';
			$response['message'] = 'Data Anda tidak terdaftar pada database kami';
		}
		return $response;
	}

	public function edit_form($registration_number) {
		// $this->db->where('registration_number', $registration_number);
		$this->db->where('registration_number', $this->session->userdata("registration_number"));
		return $this->db->get('students')->row();
	}

	public function updateForm($registration_number, $gambar, $gambar1, $gambar2, $gambar3, $gambar4, $gambar5) {
		$data = array(
			"photo"			=> $gambar,
			"bhs_indo"		=> $this->input->post('bhs_indo'),
			"bhs_inggris"	=> $this->input->post('bhs_inggris'),
			"mtk"			=> $this->input->post('mtk'),
			"ipa"			=> $this->input->post('ipa'),
			"photo1"		=> $gambar1,
			"bhs_indo2"		=> $this->input->post('bhs_indo2'),
			"bhs_inggris2"	=> $this->input->post('bhs_inggris2'),
			"mtk2"			=> $this->input->post('mtk2'),
			"ipa2"			=> $this->input->post('ipa2'),
			"photo2"		=> $gambar2,
			"bhs_indo3"		=> $this->input->post('bhs_indo3'),
			"bhs_inggris3"	=> $this->input->post('bhs_inggris3'),
			"mtk3"			=> $this->input->post('mtk3'),
			"ipa3"			=> $this->input->post('ipa3'),
			"photo3"		=> $gambar3,
			"photo_kk"		=> $gambar4,
			"photo_akta"	=> $gambar5,
		);
		$this->db->where('registration_number', $registration_number);
		$this->db->update('students', $data);
		redirect('peminatan');
		// redirect('registrasi-mandiri-form');
	}

	public function DeleteFoto($registration_number) {
		$this->db->where('registration_number', $registration_number);
		return $this->db->get('students')->row();
	}

	public function soalTes() {
		return $this->db->get('soal')->result();
	}

	public function jawabanTes($registration_number) {
		$id 	= $_POST['id'];
		$jawaban= $_POST['jawaban'];

		$filesCount = count($id); 
		for($i = 0; $i < $filesCount; $i++){ 
			$data = array(
				"registration_number"	=> $registration_number,
				"soal_id"				=> $id[$i],
				"jawaban"				=> $jawaban[$i]
			);
		// echo json_encode($data);
		$this->db->insert('jawabantes', $data);
		}
		redirect('finishJawab');
	}

	/**
	 * Find Registrant
	 * @param String $birth_date
	 * @param String $registration_number
	 * @return Array
	 */
	public function find_registrant($birth_date, $registration_number) {
		$this->db->select("
			x1.id
		  , IF(x1.is_transfer='true', 'Pindahan', 'Baru') AS is_transfer
		  , x1.registration_number
		  , x1.created_at
		  , x2.major_name AS first_choice
		  , x3.major_name AS second_choice
		  , x1.prev_school_name
		  , x1.prev_school_address
		  , x1.full_name
		  , IF(x1.gender = 'M', 'Laki-laki', 'Perempuan') AS gender
		  , x1.nisn
		  , x1.nik
		  , x1.birth_place
		  , x1.birth_date
		  , x4.option_name AS religion
		  , x5.option_name AS special_needs
		  , x6.option_name AS admission_type
		  , x1.street_address
		  , x1.rt
		  , x1.rw
		  , x1.sub_district
		  , x1.district
		  , x1.sub_village
		  , x1.village
		  , x1.postal_code
		  , x1.email
		  , x7.username
		  , x7.password
		");
		$this->db->join('majors x2', 'x1.first_choice_id = x2.id', 'LEFT');
		$this->db->join('majors x3', 'x1.second_choice_id = x3.id', 'LEFT');
		$this->db->join('options x4', 'x1.religion_id = x4.id', 'LEFT');
		$this->db->join('options x5', 'x1.special_need_id = x5.id', 'LEFT');
		$this->db->join('options x6', 'x1.admission_type_id = x6.id', 'LEFT');
		$this->db->join('participants_account x7', 'x1.registration_number = x7.username', 'LEFT');
		$this->db->where('x1.birth_date', $birth_date);
		$this->db->where('x1.registration_number', $registration_number);
		return $this->db->get(self::$table.' x1')->row_array();
	}

	/**
	 * Is Valid Registrant
	 * @param String $registration_number
	 * @param String $birth_date
	 * @return Boolean
	 */
	public function is_valid_registrant($registration_number, $birth_date) {
		$this->db->where('registration_number', $registration_number);
		$this->db->where('birth_date', $birth_date);
		$count = $this->db->count_all_results(self::$table);
		return $count > 0;
	}

	/**
	 * Admission Reports
	 * @return Resource
	 */
	public function admission_reports() {
		$this->load->model('m_students');
		$query = $this->m_students->student_query();
		$query .= "
		AND x1.is_prospective_student='true'
		ORDER BY x1.registration_number, x1.full_name ASC";
		return $this->db->query($query);
	}
}
