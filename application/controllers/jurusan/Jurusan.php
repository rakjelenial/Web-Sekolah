<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Jurusan extends Public_Controller {

	/**
	 * Class Constructor
	 *
	 * @return Void
	 */
	public function __construct() {
		parent::__construct();
	}

	/**
	 * Index
	 * @return Void
	 */
	public function index() {
		// $this->vars['title'] = __session('website') . ' | ' . __session('tagline');
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/rpl';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function otkp() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/otkp';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function tkj() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/tkj';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function mm() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/mm';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function bdp() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/bdp';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function akl() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/akl';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function tbs() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/tbs';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function tbg() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/tbg';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function siswa() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/siswa';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function kepala() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/kepala';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function akreditasi() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/akreditasi';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function sarana() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/sarana';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function eskul() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/eskul';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}

	public function kalendar() {
		$this->vars['content'] = 'themes/'.theme_folder().'/jurusan/kalendar';
		$this->load->view('themes/'.theme_folder().'/index', $this->vars);
	}
}