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
}