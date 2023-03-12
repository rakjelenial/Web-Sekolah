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

class M_registrants extends CI_Model {

	/**
	 * Primary key
	 * @var String
	 */
	public static $pk = 'id';

	/**
	 * Table
	 * @var String
	 */
	public static $table = 'students';

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
	
	public function all() {
		return $this->db->get('students')->result();
	}
	
	public function bank_member() {
	   // return $this->db->get_where('students', array('bank_status' => 'member'))->result();
	    
	    $this->db->select('students.id, full_name, nisn, bank_status, majors.major_name');
        $this->db->from('students');
        $this->db->join('majors', 'students.major_id = majors.id', 'left');
        $this->db->where('bank_status', 'member');
	    return $this->db->get()->result();
	}
	
	public function bank_not_member() {
	    return $this->db->get_where('students', array('bank_status' => 'not_member'))->result();
	}
	
	public function member_selected($id) {
	    $this->db->select('students.id, full_name, nisn, bank_status, majors.major_name');
        $this->db->from('students');
        $this->db->join('majors', 'students.major_id = majors.id', 'left');
        $this->db->where('students.id', $id);
	    return $this->db->get()->row();
	}
	
	public function add_member($id) {
	    $data = [
			"bank_status" => 'member'
		];
		$this->db->where("id", $id);
		$this->db->update('students', $data);
		$this->output->set_status_header(200);
        $this->output->set_output(json_encode(array('message' => 'Member added successfully')));
	}

	/**
	 * Display a listing of the resource.
	 * @param String $keyword
	 * @param Integer $limit
	 * @param Integer $offset
	 * @return Resource
	 */
	public function get_where($keyword = '', $return_type = 'count', $limit = 0, $offset = 0) {
		$fields = [
			"x1.id"
			, "x1.registration_number"
			, "x1.re_registration"
			, "x1.created_at"
			, "x1.full_name"
			, "x1.birth_date"
			, "IF(x1.gender = 'M', 'L', 'P') AS gender"
			, "x1.photo"
			, "x1.is_deleted"
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
			->where('registration_number', $registration_number)
			// ->where('birth_date', $birth_date)
			->get(self::$table);
		if ($query->num_rows() === 1) {
			$result = $query->row();
			if ($result->re_registration === "false") {
				$response['status'] = 'danger';
				$response['message'] = 'Anda Tidak Lolos Seleksi Penerimaan Peserta Didik Baru '.__session('school_name');
			} else if ($result->selection_result === 'unapproved') {
				$response['status'] = 'warning';
				$response['message'] = 'Anda menjadi cadangan di '.__session('school_name');
			} else {
				if (__session('major_count') > 0 AND !empty($result->selection_result)) {
					$response['status'] = 'success';
					$majors = $this->model->RowObject('id', $result->selection_result, 'majors');
					$response['message'] = '<p><span class="bg-warning">'.$result->full_name.'</span> dengan nomor registrasi '.$registration_number.'</p><p>Lolos Seleksi Penerimaan Peserta Didik Baru dan diterima di ' . __session('_major') . ' <span class="bg-warning">' . $majors->major_name . '</span> ' . __session('school_name').'<br><br><span class="text-info small">Download Syarat Daftar Ulang</span><br><a href="https://drive.google.com/file/d/14bN76QC_xOfB5sZhMt7DqgZa7MCGX9ll/view?usp=sharing" target="_blank" class="btn btn-info">download</a></p>';
				} else {
					$response['status'] = 'warning';
					$response['message'] = 'Pra registrasi Anda berhasil. Silahkan pantau terus web SMKN 1 Kotabaru untuk tahap Registrasi dan Peminatan';
			
					// $data_session = array(
					// 	'registration_number'	=> $registration_number
					// );
					// $this->session->set_userdata($data_session);
					// redirect('registrasi-mandiri-form');
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
