-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 03:25 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `websmk`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `academic_year`, `semester`, `current_semester`, `admission_semester`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '2021-2022', 'odd', 'true', 'true', '2020-05-09 16:36:37', '2022-06-30 10:05:58', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT '0',
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT '0',
  `achievement_level` smallint(6) NOT NULL DEFAULT '0',
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admission_phases`
--

CREATE TABLE `admission_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admission_phases`
--

INSERT INTO `admission_phases` (`id`, `academic_year_id`, `phase_name`, `phase_start_date`, `phase_end_date`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 'Umum', '2020-05-01', '2020-05-17', '2020-05-09 16:37:27', '2020-05-09 09:37:27', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `admission_quotas`
--

CREATE TABLE `admission_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admission_quotas`
--

INSERT INTO `admission_quotas` (`id`, `academic_year_id`, `admission_type_id`, `major_id`, `quota`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 170, 1, 10, '2022-05-28 10:12:43', '2022-05-28 02:12:43', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', 'post', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Uncategorized', 'uncategorized', 'Uncategorized', 'file', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT '0' COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT '0' COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_group_students`
--

CREATE TABLE `class_group_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT '0',
  `student_id` bigint(20) DEFAULT '0',
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) DEFAULT '0',
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT '0',
  `marriage_status_id` bigint(20) DEFAULT '0',
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT '0' COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT '0' COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT '0' COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT '0' COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT '0' COMMENT 'Pangkat / Golongan',
  `salary_source_id` bigint(20) DEFAULT '0' COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah ?',
  `laboratory_skill_id` bigint(20) DEFAULT '0' COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT '0' COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT '0',
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `jawabantes`
--

CREATE TABLE `jawabantes` (
  `id` int(11) NOT NULL,
  `registration_number` varchar(100) NOT NULL,
  `soal_id` int(11) NOT NULL,
  `jawaban` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelulusan`
--

CREATE TABLE `kelulusan` (
  `id` int(11) NOT NULL,
  `nama_lengkap` char(255) NOT NULL,
  `tanggal_lahir` varchar(50) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `jurusan` char(255) NOT NULL,
  `status` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelulusan`
--

INSERT INTO `kelulusan` (`id`, `nama_lengkap`, `tanggal_lahir`, `nis`, `nisn`, `jurusan`, `status`) VALUES
(1, 'ANDI MUHAMAD BADARUDIN MAKITA', 'Kotabaru, 22 Nopember 2003', '10552', '0037789273', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(2, 'AHLATUL KARIMAH', 'Kotabaru, 24 Januari 2004', '10533', '0049264836', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(3, 'EVA TRIANA SAPUTRI', 'Kotabaru, 20 Maret 2004', '10588', '0043378490', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(4, 'FITRIA KHOFIFAH LAILATUL QODAR', 'KOTABARU, 15 Nopember 2003', '10595', '0038970387', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(5, 'HENDRY KASNIAWAN', 'Kotabaru, 12 Oktober 2002', '10611', '0029875650', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(6, 'JULFA KAMELIA', 'SELARU, 18 Juli 2004', '10630', '3049161594', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(7, 'LIDYA AYU ASTUTI', 'Kotabaru, 27 April 2004', '10637', '0041791137', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(8, 'M. FAUZAN HAITAMI', 'KOTABARU, 06 Juni 2003', '10644', '0035459396', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(9, 'MAHMUD', 'Kotabaru, 26 Maret 2004', '10668', '0046880045', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(10, 'MUHAMMAD ARIFIN', 'Kotabaru, 16 April 2004', '10693', '0044811503', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(11, 'MUHAMMAD NOOR FADILLAH', 'Kotabaru, 02 Desember 2003', '10717', '0035799398', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(12, 'MUHAMMAD SAHDI', 'KOTABARU, 12 Juli 2002', '10732', '0039434700', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(13, 'MUTIA MAULINDA', 'KOTABARU, 08 Mei 2004', '10742', '0042178743', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(14, 'NOR AINI', 'Kotabaru, 05 Nopember 2003', '10751', '0024889402', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(15, 'NORHAYATI', 'Hulu Sungai Selatan, 21 Juni 2003', '10752', '0031946991', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(16, 'NUR AWALI RIZKY', 'KOTABARU, 17 April 2004', '10761', '0047356589', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(17, 'NUR AZMI', 'KOTABARU, 23 Januari 2004', '10763', '0046205219', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(18, 'RAHMA DAMAYANTI', 'KOTABARU, 26 Agustus 2003', '10781', '0035099906', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(19, 'REZTY DWI PUJIANTI', 'Kotabaru, 18 Juni 2003', '10796', '0035719028', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(20, 'RISKI BUDIAWAN', 'Kotabaru, 17 Juni 2002', '10436', '0023229035', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(21, 'SALEHUDIN', 'BATU TUNAU, 27 Juli 2002', '10819', '0025713741', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'TIDAK LULUS'),
(22, 'SHINDY HARISA', 'KOTABARU, 30 Agustus 2004', '10836', '0046648098', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(23, 'SOFIA RANTI', 'KOTABARU, 07 Mei 2004', '10845', '0041659296', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(24, 'ST. NOOR HASNA', 'Kotabaru, 16 Mei 2003', '10848', '0039662872', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(25, 'SUCI RAHMAWATI', 'SEMISIR, 01 Juli 2004', '10849', '0048151535', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(26, 'TIARA NANDA RAHAYU', 'Kotabaru, 07 Maret 2004', '10859', '0041599419', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(27, 'UMI KALSUM', 'PULAU KERASIAN, 11 September 2003', '10863', '0034936457', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(28, 'WINDI FITRIA ANDRIANI', 'KOTABARU, 22 Nopember 2003', '10865', '3034876605', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(29, 'YULIANA', 'KOTABARU, 16 Juni 2000', '10868', '0034106296', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(30, 'ZAINAL', 'Sarang Tiung, 17 Juli 2002', '10515', '0025148763', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(31, 'ALIF AL-AMIN', 'KOTABARU, 26 Desember 2002', '10547', '3022595270', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(32, 'AULIA RAHMAH', 'Sarigadung, 10 Desember 2003', '10562', '0031140970', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(33, 'AYU SUSANTI', 'Kotabaru, 11 Nopember 2003', '10564', '0033123259', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(34, 'FAHRIDWAN ISMAIL', 'KOTABARU, 07 Juli 2003', '10589', '0035696505', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(35, 'FIA ANGGRIANI', 'Kotabaru, 24 Juni 2003', '10591', '0035271420', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(36, 'FITRIANI', 'KANIBUNGAN, 16 Oktober 2003', '10596', '0042908460', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(37, 'HIKMAH ANANDA RAHAYU', 'Kotabaru, 22 September 2002', '10614', '0025735429', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(38, 'JUMRANA', 'Berangas, 08 April 2004', '10632', '0045747830', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(39, 'M. ZAKY FAHREJI', 'KOTABARU, 24 Maret 2003', '10656', '0037215180', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(40, 'M.RA\'IS', 'KOTABARU, 20 Desember 2003', '10665', '0035271447', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(41, 'MELIKA ARIANI', 'SEKAPUNG, 22 Juli 2004', '10677', '0041818486', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(42, 'MUHAMMAD HAFIZUL GOFUR', 'Kotabaru, 29 Pebruari 2004', '10706', '0046510015', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(43, 'MUHAMMAD QOSIM AKBAR', 'Kotabaru, 24 Maret 2002', '10720', '0031589715', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(44, 'MUHAMMAD WILDAN', 'KOTABARU, 08 Januari 2004', '10736', '0049642925', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(45, 'NOOR HAFIZAH ALMI', 'Kotabaru, 15 April 2004', '10749', '0041472703', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(46, 'NUR ASDELLA', 'KOTABARU, 28 Januari 2004', '10759', '0041813334', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(47, 'NUR AZIZAH RASIKHAH', 'KOTABARU, 16 Maret 2004', '10762', '0042190231', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(48, 'NURHALIZAH', 'SEKAPUNG, 20 Pebruari 2004', '10771', '0041818474', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(49, 'PUTRI LYDIA WATI NINGSIH', 'Kotabaru, 03 Agustus 2004', '10779', '0041605693', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(50, 'RARA KURNIAWATI', 'Purwokerto, Banyumas, 07 Pebruari 2004', '10790', '0042136590', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(51, 'RIDENIE MONTELA', 'Kotabaru, 15 Desember 2003', '10799', '0035099914', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(52, 'SITI ANISA', 'KOTABARU, 14 Nopember 2003', '10839', '0037071199', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(53, 'SONALAWATI', 'KOTABARU, 10 Desember 2003', '10846', '0039419318', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(54, 'SRI SELMA', 'Sei Nipah, 14 Pebruari 2004', '10847', '0041872477', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(55, 'WINA FITRIAH', 'SEKAPUNG, 15 Juni 2003', '10864', '0039923557', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(56, 'YULIANA', 'Kotabaru, 19 Desember 2003', '10867', '0037843971', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(57, 'ZELIKA APRILIA', 'Kotabaru, 22 April 2004', '10869', '0036771675', 'AKUNTANSI DAN KEUANGAN LEMBAGA', 'LULUS'),
(58, 'ABDULLAH SYAIDI', 'KOTABARU , 04 Nopember 2002', '10526', '0034370864', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(59, 'AKHMAD EKBAL MAULANA', 'Pudi Seberang, 24 Desember 2003', '10541', '0036776789', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(60, 'ASTRID YULIANDA', 'Kotabaru, 03 Maret 2004', '10560', '0043611611', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(61, 'DIMAS SATRIA', 'Kotabaru, 10 September 2003', '10581', '0035798662', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(62, 'DWI NUR MAHDALENA', 'KOTABARU, 13 September 2003', '10582', '0034174534', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(63, 'EMILA AGUSTINA', 'Pamekasan, 13 Agustus 2003', '10586', '0035783863', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(64, 'FAJRIN WAHYUDA', 'KOTABARU, 20 Maret 2003', '10590', '0035817559', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(65, 'FITRAH DARA NATASYA', 'KOTABARU, 03 Juni 2004', '10593', '0049228406', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(66, 'GUNTURAHMAT', 'Kotabaru, 20 Juli 2002', '10247', '0025321418', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(67, 'GUSTI MUHAMMAD FATHURROGIBIN', 'KOTABARU, 01 Juli 2004', '10600', '0041897762', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(68, 'HELDAWATI', 'Kotabaru, 11 Maret 2004', '10607', '0041593459', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(69, 'IKHSAN SUKMA DINATA', 'Kotabaru, 08 Desember 2003', '10616', '0022281660', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(70, 'M. HARIYADI', 'KOTABARU, 03 Pebruari 2004', '10647', '0042596527', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(71, 'M. ROSTADI BINTANG', 'PALANGKARAYA, 29 September 2002', '10651', '0026275951', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(72, 'MUHAMMAD CHANDRA', 'Kotabaru, 12 Mei 2004', '10698', '0041593463', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(73, 'MUHAMMAD RAJUDIN ALFIANNUR', 'Kotabaru, 19 September 2003', '10724', '0037419324', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(74, 'MUHAMMAD ZIKRULLAH', 'KOTABARU, 26 Nopember 2003', '10739', '0039389098', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(75, 'NOOR SHOFIA AZZAHRA', 'Kotabaru, 09 Pebruari 2004', '10750', '0044883061', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(76, 'NORLATIFAH', 'Kotabaru, 30 Maret 2004', '10753', '0044090617', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(77, 'NOVIANTI', 'KOTABARU, 20 Nopember 2003', '10757', '0034226214', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(78, 'NUR RAHAYU SINTIA', 'Jakarta, 27 September 2003', '10766', '0037033851', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(79, 'NUR RAHMIA', 'Pangkep, 08 April 2004', '10767', '0047599261', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(80, 'NUR SEFIANI HAFIFAH', 'KOTABARU, 28 September 2003', '10769', '0035813869', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(81, 'RAHMAT MAULIDAN', 'KOTABARU, 28 Mei 2003', '10785', '0035538107', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(82, 'RESIVA ERLIANTI', 'Kotabaru, 14 Nopember 2003', '10794', '0038115640', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(83, 'RIFKA RASYIDA', 'Kotabaru, 29 April 2004', '10800', '0046133393', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(84, 'RINA ASTUTI', 'Kotabaru, 06 Desember 2005', '10802', '0059359146', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(85, 'RISKI UMIASARI', 'TELUK GOSONG, 06 Juli 2003', '10807', '0035918197', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(86, 'SALMA FARIDAH', 'Muara Wahau, 26 Januari 2004', '10820', '0041378229', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(87, 'SETIAWATI', 'Kotabaru, 25 Desember 2003', '10834', '0039135749', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(88, 'SITI JAHRAH', 'KOTABARU, 04 Pebruari 2004', '10840', '0044077967', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(89, 'YUDI SUSANTO', 'Kotabru, 01 Mei 2001', '10866', '0015644122', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(90, 'ABDUL FEI', 'Labuan Mas, 09 Agustus 2003', '10521', '0032731011', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(91, 'ABDUL HADI', 'LABUAN MAS, 11 Oktober 2003', '10522', '0032731016', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(92, 'ALFIN', 'Katingan, 07 Agustus 2003', '10545', '0017541606', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(93, 'AMELIA YULIANI TEJO MULYONO', 'Wonosobo, 27 Juli 2002', '10550', '0024551154', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(94, 'CITA ANGGARSARI', 'SEKAPUNG, 26 Januari 2004', '10572', '0041818472', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(95, 'ELSA', 'Kotabaru, 17 April 2004', '10584', '0043378495', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(96, 'FUTRI RISQI CAHYANI', 'Tg.Mangkok, 04 Pebruari 2004', '10597', '0046070120', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(97, 'GLADIS AINUL HELDA KHAIRANSYAH', 'KOTABARU, 08 Juni 2003', '10599', '0036112331', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(98, 'GUSTINA NUR HASANAH', 'Kotabaru, 21 Agustus 2003', '10602', '0033782181', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(99, 'HAIRUN NAJMI', 'KOTABARU, 26 Maret 2004', '10604', '0041811667', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(100, 'IRMA WATI', 'KOTABARU, 20 Nopember 2003', '10620', '0038651050', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(101, 'IRWANSYAH', 'Sungai Betung, 25 Nopember 2003', '10621', '0035717711', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(102, 'M. ANDRI FAHRIZAL', 'Maniang, 11 Januari 2004', '10658', '0048744498', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(103, 'MAGHRISA ASSYFA', 'Kotabaru, 27 Maret 2004', '10666', '0043356221', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(104, 'MUHAMMAD ANSARI', 'Pudi, 25 Oktober 2004', '10692', '0043035929', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(105, 'MUHAMMAD DONI ABDULLAH', 'Kotabaru, 10 Oktober 2003', '10701', '0037605275', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(106, 'MUHAMMAD RIZKY', 'KOTABARU, 19 April 2002', '10731', '0025123212', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(107, 'MUHAMMAD ZAINI AL MADANI', 'Kotabaru, 02 Desember 2003', '10738', '0035459410', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(108, 'MUHYAR', 'Marabatuan, 28 Pebruari 2004', '10740', '0044223319', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(109, 'NENENG BUNGA SARI', 'Kotabaru, 20 Oktober 2003', '10747', '0033145960', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(110, 'NUR AFNI', 'MAKASAR, 21 Oktober 2003', '10758', '0038959493', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(111, 'NUR RIZKY JULIANA', 'Kotabaru, 23 Juli 2003', '10768', '0037275094', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(112, 'NURMIATI', 'Kotabaru, 02 Agustus 2003', '10773', '0035651523', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(113, 'RAHMAWATI', 'Kotabaru, 24 September 2003', '10786', '0038936194', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(114, 'RAMA GHANNY', 'Kotabaru, 02 Juni 2004', '10788', '0041378241', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(115, 'RIMA SELVIA MAHARANI', 'KANIBUNGAN, 23 Mei 2004', '10801', '0041872606', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(116, 'RIZKA RAMADHANI', 'SENAKIN, 08 Nopember 2003', '10813', '0035859708', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(117, 'SELVIANA DEWI', 'Banjarmasin, 20 Maret 2004', '10832', '0043755037', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(118, 'SEPHIA ANGGRAINI', 'Surabaya, 03 Mei 2003', '10833', '0034372152', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(119, 'SERI HELDAYANTI', 'Kotabaru, 09 Juni 2003', '10467', '0037683681', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(120, 'SHELLA NOVITA SARI', 'Kotabaru, 14 Mei 2004', '10835', '0043611612', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(121, 'SITI MASFUPAH', 'Senakin, 10 Juni 2003', '10841', '0033222565', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(122, 'SUCI ULAN DARI', 'Batulicin, 05 April 2003', '10850', '0048650830', 'OTOMATISASI DAN TATA KELOLA PERKANTORAN', 'LULUS'),
(123, 'ALWI', 'Labuan Mas, 17 April 2004', '10549', '0043899561', 'BISNIS DARING PEMASARAN', 'LULUS'),
(124, 'AWALUDIN', 'Kotabaru, 24 Oktober 2003', '10563', '0041743875', 'BISNIS DARING PEMASARAN', 'LULUS'),
(125, 'BAYU SAPUTRA', 'Kotabaru, 30 November 2003', '10569', '0035099913', 'BISNIS DARING PEMASARAN', 'LULUS'),
(126, 'HUSNI FADILLAH', 'Kotabaru, 24 Desember 2002', '10615', '0032833616', 'BISNIS DARING PEMASARAN', 'LULUS'),
(127, 'JALDI', 'Kotabaru, 16 September 2002', '10626', '0026745626', 'BISNIS DARING PEMASARAN', 'LULUS'),
(128, 'JUMRAH', 'Kotabaru, 21 Maret 2003', '10631', '0035271412', 'BISNIS DARING PEMASARAN', 'LULUS'),
(129, 'M. AKBAR MAULANA', 'Teluk Gosong, 22 Agustus 2004', '10657', '0041413139', 'BISNIS DARING PEMASARAN', 'LULUS'),
(130, 'M. ALDI HARISUPIAN FIRDAUS', 'Sembilang, 13 Desember 2002', '10642', '0024312970', 'BISNIS DARING PEMASARAN', 'LULUS'),
(131, 'M.OKSAL SYAFRUDDIN NUR', 'Sarang Tiung, 07 Oktober 2003', '10653', '0035271436', 'BISNIS DARING PEMASARAN', 'LULUS'),
(132, 'M. SYAIFUL AKBAR', 'KOTABARU, 15 Desember 2003', '10664', '0036320669', 'BISNIS DARING PEMASARAN', 'LULUS'),
(133, 'MAHAMUDIN', 'Kotabaru, 4 Januari 2002', '10667', '0027225391', 'BISNIS DARING PEMASARAN', 'LULUS'),
(134, 'MISLIANTI', 'Kotabaru, 9 September 2003', '10680', '0034684877', 'BISNIS DARING PEMASARAN', 'LULUS'),
(135, 'MUH FADILLA', 'Kotabaru, 17 Spetember 2002', '10683', '0027976600', 'BISNIS DARING PEMASARAN', 'LULUS'),
(136, 'MUHAMMAD ALDONI', 'Kotabaru, 14 Maret 2003', '10333', '0036125759', 'BISNIS DARING PEMASARAN', 'LULUS'),
(137, 'MUHAMMAD IRVAN', 'Kotabaru, 20 Juli 2000', '10710', '0001673982', 'BISNIS DARING PEMASARAN', 'LULUS'),
(138, 'MUHAMMAD NUR RAMADHANI', 'Kotabaru, 29 Oktober 2003', '10649', '0037425563', 'BISNIS DARING PEMASARAN', 'LULUS'),
(139, 'MUHAMMAD RAFLI RAMADHAN', 'Martapura, 27 Oktober 2003', '10722', '0037822777', 'BISNIS DARING PEMASARAN', 'LULUS'),
(140, 'MUHAMMAD RIAN FIRDAUS', 'Kotabaru, 7 September 2003', '10726', '0033703471', 'BISNIS DARING PEMASARAN', 'LULUS'),
(141, 'MUHAMMAD RIF\'AH RAMADANI', 'Kotabaru, 12 November 2003', '10728', '0037275111', 'BISNIS DARING PEMASARAN', 'LULUS'),
(142, 'MUHAMMAD RISKI MAULANA', 'Kotabaru, 13 Maret 2004', '10729', '0048337994', 'BISNIS DARING PEMASARAN', 'LULUS'),
(143, 'MUHAMMAD SAHRUL RAMADHAN', 'Kotabaru, 8 Desember 2001', '10366', '0018777925', 'BISNIS DARING PEMASARAN', 'LULUS'),
(144, 'NUR AULIANA ADINDA', 'Kotabaru, 18 September 2003', '10760', '0037419323', 'BISNIS DARING PEMASARAN', 'LULUS'),
(145, 'RASYID', 'Kotabaru, 16 Juni 2003', '10791', '0037504813', 'BISNIS DARING PEMASARAN', 'LULUS'),
(146, 'RENDI SAPUTRA', 'Kotabaru, 13 Januari 2002', '10427', '0020029618', 'BISNIS DARING PEMASARAN', 'LULUS'),
(147, 'RISDA WULANDARI', 'Kotabaru, 15 September 2003', '10805', '0031818585', 'BISNIS DARING PEMASARAN', 'LULUS'),
(148, 'SAHRUDDIN', 'Kotabaru, 13 Agustus 2002', '10815', '0027499092', 'BISNIS DARING PEMASARAN', 'LULUS'),
(149, 'SAIFUL RAHMAN', 'Kotabaru, 2 Juli 2002', '10817', '3021862899', 'BISNIS DARING PEMASARAN', 'LULUS'),
(150, 'SAPTIAN NURHIDAYAT', 'Kotabaru, 16 Februari 2002', '10824', '0029972907', 'BISNIS DARING PEMASARAN', 'LULUS'),
(151, 'SELFIANI', '', '', '0011605482', 'BISNIS DARING PEMASARAN', 'TIDAK LULUS'),
(152, 'SELMA', '', '', '0026177899', 'BISNIS DARING PEMASARAN', 'TIDAK LULUS'),
(153, 'ABDUL HAFIZ', 'KOTABARU, 30 Desember 2002', '10523', '0022022193', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(154, 'AFIF PUTRA WARDHANA', 'BANJARMASIN, 11 Oktober 2004', '10530', '0041994735', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(155, 'Agung Gumelar', 'Kotabaru, 26 Maret 2004', '10531', '0042190234', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(156, 'Ahmad Basir', 'Kotabaru, 25 Agustus 2002', '10167', '0021238487', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(157, 'AHMAD FATURRAHMAN', 'KOTABARU, 08 Mei 2003', '10535', '0032977369', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(158, 'ALFIYYAH NUR AZIZAH', 'KOTABARU, 13 Juni 2003', '10546', '0037193521', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(159, 'ANDRI SAPUTRA', 'KOTABARU, 17 Oktober 2003', '10553', '0035497512', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(160, 'Arbani', 'Serongga, 09 Oktober 2002', '10555', '0023844735', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(161, 'ARNITA', 'Kotabaru, 14 April 2003', '10558', '0035790853', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(162, 'DEVI MAULIDA', 'KOTABARU, 10 Mei 2004', '10578', '0049727376', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(163, 'EMIELDA FEBRIARI', 'KOTABARU, 23 Pebruari 2004', '10585', '0043256554', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(164, 'Gustiyawan', 'Pagatan, 18 Agustus 2002', '10603', '0027781643', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(165, 'Janatul Firdaus', 'Langkang Lama, 19 Oktober 2004', '10627', '0045685733', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(166, 'Jima Febry Biauty', 'Kotabaru, 20 Pebruari 2004', '10628', '1111111111', 'TEKNIK KOMPUTER DAN JARINGAN', 'TIDAK LULUS'),
(167, 'JONI', 'SEKAPUNG, 16 Desember 2003', '10629', '0035813873', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(168, 'M. SYAIFUL BAHRI', 'KOTABARU, 02 Juli 2004', '10654', '0049999064', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(169, 'Maulana', 'Kotabaru, 18 Nopember 2003', '10674', '0039167344', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(170, 'MUHAMMAD ADE WIJAYA', 'Kotabaru, 01 Agustus 2003', '10685', '0035798658', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(171, 'MUHAMMAD AIDHIL FATRANI', 'KOTABARU, 23 Nopember 2003', '10687', '0030021542', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(172, 'Muhammad Arqam', 'Kotabaru, 19 April 2002', '10337', '0026276767', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(173, 'MUHAMMAD ATTAYBAH', 'KOTABARU, 07 Juni 2004', '10694', '0048237512', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(174, 'MUHAMMAD AULIA RAHMAN', 'KOTABARU, 02 Mei 2003', '10695', '0032833595', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(175, 'MUHAMMAD AZHAR MAULANA', 'KOTABARU, 14 Juni 2003', '10696', '0030021533', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(176, 'MUHAMMAD HAFIZ ANSARI', 'KANDANGAN, 12 Pebruari 2004', '10705', '0041024187', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(177, 'MUHAMMAD RIDWANSYAH', 'Kotabaru, 31 Mei 2003', '10727', '0035099899', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(178, 'NICOLAS CRESPO MAROLOP SIBARANI', 'BAMBAN, 19 Juli 2004', '10748', '0046525317', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(179, 'Nuur Anita Sari', 'Kotabaru, 03 Oktober 2003', '10775', '0032208011', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(180, 'RHIYOGA ADITAMA', 'BANJARMASIN, 29 Juni 2003', '10797', '0037193525', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(181, 'RISNA SAPUTRI', 'KOTABARU, 01 Mei 2003', '10811', '3034963172', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(182, 'Sahrul Roziqin', 'Kotabaru, 12 Desember 2003', '10816', '0037419342', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(183, 'Siti Fatkhul Umam', 'Blitar, 28 Pebruari 2004', '11241', '0036331188', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(184, 'SULTAN', 'KOTABARU, 02 April 2002', '10852', '3023071369', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(185, 'Sumarno', 'Matasirih, 23 Pebruari 2004', '10873', '0040873488', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(186, 'Ta\'lim Algani', 'Kotabaru, 25 Oktober 2003', '10857', '0035651527', 'TEKNIK KOMPUTER DAN JARINGAN', 'LULUS'),
(187, 'ABEL SAPUTRI', 'SEKAPUNG, 04 Juli 2003', '10527', '2222222222', 'MULTIMEDIA', 'TIDAK LULUS'),
(188, 'AGUNG SWARYA', 'Kotabaru, 13 Juli 2003', '10532', '0031068948', 'MULTIMEDIA', 'LULUS'),
(189, 'AIDHA SOFIA RAHMAH', 'Kotabaru, 01 Februari 2004', '10539', '0043356217', 'MULTIMEDIA', 'LULUS'),
(190, 'ALFI RIZKY RACHMAN', 'Kotabaru, 31 Maret 2004', '10544', '0048906693', 'MULTIMEDIA', 'LULUS'),
(191, 'AZKA AIRA CHAIRANI', 'Kotabaru, 19 Desember 2003', '10566', '0037419344', 'MULTIMEDIA', 'LULUS'),
(192, 'FIRMAN SYAHYOGA', 'Kotabaru, 14 Maret 2004', '10592', '0044077351', 'MULTIMEDIA', 'LULUS'),
(193, 'HELMELIA PUTRI', 'Kotabaru, 22 Maret 2004', '10608', '0047191124', 'MULTIMEDIA', 'LULUS'),
(194, 'IRMA ANDINI', 'Kotabaru, 23 Juni 2003', '10619', '0035459399', 'MULTIMEDIA', 'LULUS'),
(195, 'JUMARWAN', 'Kotabaru, 30 Desember 2003', '10633', '0039112631', 'MULTIMEDIA', 'LULUS'),
(196, 'KOKOH AGUNG SETIA BUDI', 'Kotabaru, 04 April 2003', '10636', '0037972514', 'MULTIMEDIA', 'LULUS'),
(197, 'M. KHAIDIR ANSYARI', 'Kotabaru, 11 November 2002', '10712', '0032061684', 'MULTIMEDIA', 'LULUS'),
(198, 'M.ARDIANSYAH', 'Kotabaru, 05 September 2003', '10659', '0035195074', 'MULTIMEDIA', 'LULUS'),
(199, 'M.FAYYADL HABIBI', 'Kotabaru, 09 Januari 2004', '10645', '0041378225', 'MULTIMEDIA', 'LULUS'),
(200, 'MARIYANA', 'Betung, 09 Januari 2004', '10670', '0049279888', 'MULTIMEDIA', 'LULUS'),
(201, 'MUH. ALWI', 'Sarang Tiung, 15 Oktober 2004', '10682', '0047433126', 'MULTIMEDIA', 'LULUS'),
(202, 'MUHAMMAD ALFIAN', 'Kotabaru, 17 Oktober 2003', '10689', '0035696520', 'MULTIMEDIA', 'LULUS'),
(203, 'MUHAMMAD FAISAL', 'Kotabaru, 15 Februari 2003', '10703', '0136001176', 'MULTIMEDIA', 'LULUS'),
(204, 'MUHAMMAD MARWAN', 'Kotabaru, 02 November 2003', '10714', '0035366265', 'MULTIMEDIA', 'LULUS'),
(205, 'MUHAMMAD NIZAR', 'Kotabaru, 01 Agustus 2004', '10716', '0043378509', 'MULTIMEDIA', 'LULUS'),
(206, 'MUHAMMAD RIZKI ADAM', 'Kotabaru, 02 Desember 2003', '10730', '0039136509', 'MULTIMEDIA', 'LULUS'),
(207, 'MUSMULYADI', 'Sarang Tiung, 21 Maret 2003', '10741', '0049032130', 'MULTIMEDIA', 'LULUS'),
(208, 'RANDY RIFANI SANTOSA', 'Kediri, 26 Februari 2004', '10789', '0048089364', 'MULTIMEDIA', 'LULUS'),
(209, 'REHAN ALVA REZA', 'Kotabaru, 08 April 2003', '10793', '0032170049', 'MULTIMEDIA', 'LULUS'),
(210, 'RISKA YANTI', 'Batulicin, 16 September 2002', '10806', '3028639584', 'MULTIMEDIA', 'LULUS'),
(211, 'RISMA FENI', 'Kotabaru, 10 Januari 2003', '10809', '0019606948', 'MULTIMEDIA', 'LULUS'),
(212, 'SAJRIANI', 'Putiangin, 03 Oktober 2003', '10818', '0037478476', 'MULTIMEDIA', 'LULUS'),
(213, 'SELA YUNIANOR', 'Kotabaru, 17 Juni 2003', '10828', '3038000120', 'MULTIMEDIA', 'LULUS'),
(214, 'SYAHRUL RAMADHANI', 'Kotabaru, 27 Oktober 2004', '10855', '0044844809', 'MULTIMEDIA', 'LULUS'),
(215, 'ABDULLAH NOR', 'Kotabaru, 06 Januari 2004', '10525', '0041573631', 'MULTIMEDIA', 'LULUS'),
(216, 'ADHIETYA DHIMAS PRATAMA', 'Kotabaru, 29 November 2003', '10529', '0035696526', 'MULTIMEDIA', 'LULUS'),
(217, 'AHMAD RIZANI', 'Kotabaru, 05 Januari 2004', '10537', '0046159315', 'MULTIMEDIA', 'LULUS'),
(218, 'ANADAN', 'Kotabaru, 21 Juni 2003', '10551', '0038482061', 'MULTIMEDIA', 'LULUS'),
(219, 'BAHRIANSYAH', 'Kotabaru, 08 Oktober 2001', '10568', '0017544939', 'MULTIMEDIA', 'LULUS'),
(220, 'ERGIAWAN OSHIWAR FEBRI', 'Kotabaru, 11 Februari 2004', '10587', '0035459397', 'MULTIMEDIA', 'LULUS'),
(221, 'HENI RAHMADANI', 'Kotabaru, 06 Januari 2003', '10612', '0035512023', 'MULTIMEDIA', 'LULUS'),
(222, 'JABAL RAHMAN', 'Kotabaru, 14 Desember 2003', '10625', '0039670329', 'MULTIMEDIA', 'LULUS'),
(223, 'KEVIN antony', '', '', '3333333333', 'MULTIMEDIA', 'TIDAK LULUS'),
(224, 'LOLA PUSPITA', 'Sarko, 03 September 2004', '10638', '0047221253', 'MULTIMEDIA', 'LULUS'),
(225, 'M SIRRAHUL INSAN', 'Kotabaru, 05 Maret 2004', '10641', '0041937121', 'MULTIMEDIA', 'LULUS'),
(226, 'M. ADAM AL FAHIRZI', 'Kotabaru, 15 Februari 2004', '10699', '0048699510', 'MULTIMEDIA', 'LULUS'),
(227, 'M. DANIL RIZKI HIDAYAT', 'Kalsel, 28 Januari 2004', '10648', '0043749489', 'MULTIMEDIA', 'LULUS'),
(228, 'M. HENDRI KURNIAWAN', 'Kotabaru, 28 Maret 2004', '10652', '0041659291', 'MULTIMEDIA', 'LULUS'),
(229, 'M.SULTAN', 'Tanah Bumbu, 04 Agustus 2004', '10673', '3047092252', 'MULTIMEDIA', 'LULUS'),
(230, 'MASRIANI', 'Kotabaru, 04 Oktober 2003', '10733', '0035271435', 'MULTIMEDIA', 'LULUS'),
(231, 'MUHAMMAD AKBAR FADILLAH', 'Kotabaru, 25 April 2004', '10688', '0047350834', 'MULTIMEDIA', 'LULUS'),
(232, 'MUHAMMAD ISA DAUD', 'Kotabaru, 27 Agustus 2004', '10711', '0044174372', 'MULTIMEDIA', 'LULUS'),
(233, 'MUHAMMAD MALIK PUTRA ZULRIANSYAH', 'Kotabaru, 01 Januari 2004', '10713', '3047384127', 'MULTIMEDIA', 'LULUS'),
(234, 'MUHAMMAD MAULID AKBAR', 'Tanah Bumbu, 11 Mei 2004', '10663', '0042400787', 'MULTIMEDIA', 'LULUS'),
(235, 'MUHAMMAD RAFLI ALBAR PRATAMA', 'Kotabaru, 21 Desember 2004', '10721', '0022961024', 'MULTIMEDIA', 'LULUS'),
(236, 'RAHMAT ALI', 'Kotabaru, 23 Maret 2004', '10783', '0045306984', 'MULTIMEDIA', 'LULUS'),
(237, 'RAUDAH', 'Kotabaru, 12 Desember 2003', '10792', '0039404422', 'MULTIMEDIA', 'LULUS'),
(238, 'RICHO TAMPATI SAPUTRA', 'Kotabaru, 25 Juli 2004', '10798', '0043378507', 'MULTIMEDIA', 'LULUS'),
(239, 'RISMA', 'Kotabaru, 16 Juni 2004', '10808', '0042618234', 'MULTIMEDIA', 'LULUS'),
(240, 'RISWAN ADRIAN', 'Sepagar, 23 Juli 2003', '10812', '0035271426', 'MULTIMEDIA', 'LULUS'),
(241, 'SATRIANI', 'Labuan Mas, 12 Mei 2003', '10827', '0032731015', 'MULTIMEDIA', 'LULUS'),
(242, 'UMAR BAKERI', 'Kotabaru, 16 Maret 2004', '10862', '0041812324', 'MULTIMEDIA', 'LULUS'),
(243, 'ABDUL MUHID', 'Kotabaru, 11 Juni 2003', '10524', '0033497123', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(244, 'DENI BANJAWA', 'KOTABARU, 10 Juli 2003', '10576', '0039553857', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(245, 'HAMSAN', 'Katingan, 07 Maret 2002', '10605', '9995440376', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(246, 'HELMI RAHMAN', 'Banjarmasin, 02 Agustus 2000', '10609', '0003463255', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(247, 'HENDRA JAYA', 'Kotabaru, 12 Juli 2003', '10610', '0034662054', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(248, 'INDRA TRISJAYADI', 'Kotabaru, 23 Juni 2003', '10618', '0037039607', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(249, 'IRZAN MAHMUD', 'Bone, 24 Mei 2004', '10622', '0043898892', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(250, 'M. FREDY ADAM', 'Kotabaru, 14 Mei 2003', '10662', '0030021529', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(251, 'M. ZACKY RAFIALDIN SAPUTRA', 'Kotabaru, 25 Mei 2003', '10655', '0037419304', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(252, 'M. FADHILLAH', 'KOTABARU, 19 Agustus 2003', '10643', '0037419318', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(253, 'M. HARIS SAPUTRA', 'KOTABARU, 20 Desember 2003', '10646', '0033869352', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(254, 'MARTINAH', 'Kotabaru, 01 April 2004', '10672', '0046699767', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(255, 'MUHAMMAD HARITS NUR', 'Kotabaru, 14 Mei 2003', '10707', '0033743224', 'REKAYASA PERANGKAT LUNAK', 'PENDING'),
(256, 'MUHAMMAD CHALIL WAHYUDIN', 'Kotabaru, 25 Desember 2003', '10697', '0032023952', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(257, 'MUHAMMAD IQBAL SHANDY MARPAUNG', 'Kotabaru, 18 Desember 2003', '10709', '0036110985', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(258, 'MUHAMMAD NOR ARIFIN', 'GEDAMBAAN, 08 Maret 2004', '10718', '3046694641', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(259, 'MUHAMMAD NUR ABSHAR', 'KOTABARU, 18 Pebruari 2004', '10719', '0041812322', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(260, 'MUHAMMAD RAIHAN FAHRIFI', 'Kotabaru, 13 Desember 2004', '10723', '0046762642', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(261, 'MUHAMMAD RAMADHAN', 'KOTABARU, 16 Nopember 2003', '10725', '3031754298', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(262, 'MUHAMMAD SYAHDAN', 'KOTABARU, 08 Agustus 2003', '10735', '0039606879', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(263, 'PUTRA JAYADI', 'KOTABARU, 24 Pebruari 2004', '10777', '0037779631', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(264, 'RACHMAT ADITYA ERWANDY', 'Kotabaru, 20 Desember 2003', '10780', '0037275118', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(265, 'RAHUL', 'Kotabaru, 15 Januari 2003', '10787', '0034132755', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(266, 'SABIT RAMADHAN', 'KOTABARU, 09 Nopember 2003', '10814', '0032202889', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(267, 'SUGENG PARIANTO', 'Kotabaru, 21 Maret 2003', '10851', '0036310528', 'REKAYASA PERANGKAT LUNAK', 'LULUS'),
(268, 'ADE INDRIYANI', 'Kotabaru, 10 Pebruari 2003', '10528', '0035817569', 'TATA BOGA', 'LULUS'),
(269, 'AHMAD ARIFANDI', 'Kotabaru, 26 Maret 2003', '10534', '0033628911', 'TATA BOGA', 'LULUS'),
(270, 'AZZAHRA MAWARNI', 'Kotabaru, 06 Januari 2004', '10567', '0041599085', 'TATA BOGA', 'LULUS'),
(271, 'DIANDRA ANNISA PUTRI', 'Kotabaru,22 Agustus 2002', '10580', '0028038563', 'TATA BOGA', 'LULUS'),
(272, 'FITRIA NURJANNAH', 'Kotabaru, 03 Desember 2002', '11238', '3025514092', 'TATA BOGA', 'LULUS'),
(273, 'IMAM SEPTIONO', 'Sembilang, 11 September 2003', '10617', '0034370869', 'TATA BOGA', 'LULUS'),
(274, 'MELIANI', 'Kotabaru, 23 Juli 2003', '10676', '0037071187', 'TATA BOGA', 'LULUS'),
(275, 'MOH. DANDONG FIRDAUS', 'Kotabaru, 04 April 2003', '10681', '0033481923', 'TATA BOGA', 'LULUS'),
(276, 'MUHAMMAD AGUS RIYADI', 'Kotabaru, 05 Agustus 2002', '10686', '0023048849', 'TATA BOGA', 'LULUS'),
(277, 'MUHAMMAD FACHREZA ARYA FADILLAH', 'Kotabaru, 21 Januari 2004', '10702', '0041659283', 'TATA BOGA', 'LULUS'),
(278, 'MUHAMMAD IKHSAN RAMADHAN', 'Koatabru, 23 Nopember 2003', '10708', '0038429612', 'TATA BOGA', 'LULUS'),
(279, 'MUHAMMAD WILI', 'Kotabaru, 02 Oktober 2003', '10737', '0039591701', 'TATA BOGA', 'LULUS'),
(280, 'NAGINA ATMADEA PUTRI', 'Kotabaru, 18 Maret 2004', '10745', '0040934760', 'TATA BOGA', 'LULUS'),
(281, 'NORMAYANTI', 'Kotabaru, 15 Oktober 2003', '10754', '0035698924', 'TATA BOGA', 'LULUS'),
(282, 'RANI', 'Kotabaru, 01 Januari 2001', '10419', '0018550486', 'TATA BOGA', 'LULUS'),
(283, 'SITI AMINAH', 'Kotabaru, 24 Juli 2002', '10838', '0026894825', 'TATA BOGA', 'LULUS'),
(284, 'SITI NUR HAFTSAH', 'Kotabaru, 04 April 2003', '10843', '0031877974', 'TATA BOGA', 'LULUS'),
(285, 'TIRA CAHYATI', 'Balikpapan, 10 Desember 2003', '10861', '0035225039', 'TATA BOGA', 'LULUS'),
(286, 'ATIKA SYAHDILLA', 'KOTABARU, 15 Nopember 2003', '10561', '0037193552', 'TATA BUSANA', 'LULUS'),
(287, 'CONI HELMAWATI BALQIS', 'KOTABARU, 06 Oktober 2003', '10573', '0033322639', 'TATA BUSANA', 'LULUS'),
(288, 'DEA AMELIA FAISAL', 'KOTABARU, 21 Pebruari 2003', '10575', '0036523122', 'TATA BUSANA', 'LULUS'),
(289, 'DESY RAPITA SARI', 'Rantau Keminting, 20 Desember 2003', '10577', '0035194254', 'TATA BUSANA', 'LULUS'),
(290, 'EKA SAWATI', 'Pondok labu, 22 Maret 2001', '10583', '0011228216', 'TATA BUSANA', 'LULUS'),
(291, 'GHAIDA MAHARANI', 'Kotabaru, 19 Juni 2003', '10598', '0037419306', 'TATA BUSANA', 'LULUS'),
(292, 'HERNAWATI', 'PONDOK LABU, 10 Juni 2003', '10613', '0034928677', 'TATA BUSANA', 'LULUS'),
(293, 'ISNA HARDIANTI', 'P.KERUMPUTAN, 29 September 2004', '10623', '0041613637', 'TATA BUSANA', 'LULUS'),
(294, 'LUTFI MARDA ULFIAH', 'KOTABARU, 28 Januari 2004', '10639', '0049188501', 'TATA BUSANA', 'LULUS'),
(295, 'MAISAROH', 'KOTABARU, 13 Mei 2003', '10669', '0037062751', 'TATA BUSANA', 'LULUS'),
(296, 'MARSANTI HIKMAH', 'KOTABARU, 07 Maret 2004', '10671', '0041599089', 'TATA BUSANA', 'LULUS'),
(297, 'MELYNA', 'Kotabaru, 24 Maret 2003', '10678', '0038612539', 'TATA BUSANA', 'LULUS'),
(298, 'MIA FITRI', 'PONDOK LABU, 05 Agustus 2003', '10679', '0032339861', 'TATA BUSANA', 'LULUS'),
(299, 'NADA SYIFA', 'KOTABARU, 24 Juni 2003', '10743', '0035696500', 'TATA BUSANA', 'LULUS'),
(300, 'NADIA LUTHFIYA THAIBAH', 'KOTABARU, 16 September 2003', '10744', '0037193538', 'TATA BUSANA', 'LULUS'),
(301, 'NOVA RAMADHANI', 'KOTABARU, 12 Nopember 2003', '10755', '0035813868', 'TATA BUSANA', 'LULUS'),
(302, 'NUR HAJAR ASWAD', 'Takalar, 08 Maret 2003', '10764', '0032833597', 'TATA BUSANA', 'LULUS'),
(303, 'NUR HIKMAH', 'Kotabaru, 02 Desember 2003', '10765', '0033863442', 'TATA BUSANA', 'LULUS'),
(304, 'NUR SYIFA', 'KOTABARU, 17 Agustus 2003', '10770', '3033654276', 'TATA BUSANA', 'LULUS'),
(305, 'NURLAILA DEWI', 'KOTABARU, 10 Januari 2003', '10772', '0031107502', 'TATA BUSANA', 'LULUS'),
(306, 'PUTRI HAMIDAH', 'Tanjung Pengharapan, 14 Agustus 2002', '10778', '0033698219', 'TATA BUSANA', 'LULUS'),
(307, 'RISMA FINA', 'KOTABARU, 10 Januari 2003', '10910', '0039381168', 'TATA BUSANA', 'LULUS'),
(308, 'RIZKA PUTRI DIAN NOVIANTI PRAYITNO S', 'Batulicin, 08 Nopember 2003', '11245', '0031748327', 'TATA BUSANA', 'LULUS'),
(309, 'SALSA BILA FIRDA AZAHRA', 'KOTABARU, 17 Maret 2004', '10822', '0048645772', 'TATA BUSANA', 'LULUS'),
(310, 'SANTIKA', 'KOTABARU, 12 Desember 2003', '10823', '0035813872', 'TATA BUSANA', 'LULUS'),
(311, 'SITI NOORJENNAH', 'KOTABARU, 01 Oktober 2003', '10842', '0037327874', 'TATA BUSANA', 'LULUS'),
(312, 'TIARA DEWI', 'KOTABARU, 12 Pebruari 2004', '10858', '0043378484', 'TATA BUSANA', 'LULUS'),
(313, 'WAHIDA', 'Pusu, 23 Januari 2003', '10516', '0039105167', 'TATA BUSANA', 'LULUS');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', NULL, 'link', '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `major_name`, `major_short_name`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Rekayasa Perangkat Lunak', 'RPL', 'true', '2020-05-13 19:53:04', '2020-05-13 11:53:04', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT '0',
  `menu_position` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 9, '2019-04-01 21:44:37', '2022-05-28 00:05:17', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'PPDB 2019', '#', '_self', 'links', 0, 7, '2019-04-01 21:44:37', '2022-05-28 00:05:17', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 8, '2019-04-01 21:44:37', '2022-05-28 00:05:17', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Kategori', '#', '_self', 'links', 0, 3, '2019-04-01 21:44:37', '2022-05-28 00:05:17', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'Uncategorized', 'kategori/uncategorized', '_self', 'post_categories', 10, 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'Direktori', '#', '_self', 'links', 0, 4, '2019-04-01 21:44:37', '2022-05-28 00:05:17', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'Direktori Alumni', 'direktori-alumni', '_self', 'modules', 12, 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'Direktori Peserta Didik', 'direktori-peserta-didik', '_self', 'modules', 12, 3, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'Direktori Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 2, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'Pendaftaran Alumni', 'pendaftaran-alumni', '', 'modules', 0, 5, '2019-04-01 21:44:37', '2022-06-14 08:25:40', '2022-06-14 16:25:40', NULL, 0, 1, 1, 0, 'true'),
(17, 'Profil', 'read/2/profil', '_self', 'pages', 0, 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '_self', 'pages', 0, 2, '2019-04-01 21:44:37', '2022-05-28 00:05:16', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'Pengumuman Kelulusan', 'pengumuman-kelulusan', '', 'modules', 0, 6, '2022-05-28 08:04:29', '2022-06-30 11:19:14', '2022-06-14 16:25:35', '2022-06-30 19:19:14', 1, 1, 1, 1, 'false'),
(20, 'PENGUMUMAN KELULUSAN 2022', 'read/10/pengumuman-kelulusan-2022', '', 'pages', 0, 0, '2022-06-03 09:31:46', '2022-06-30 11:19:20', '2022-06-14 16:25:12', '2022-06-30 19:19:20', 1, 1, 1, 1, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Akademik', 'Akademik', 'academic', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kabupaten', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Provinsi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama orang tua', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'residences', 'Wali', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan pribadi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua yayasan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kabupaten/Kota', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false'),
(170, 'admission_types', 'Umum', '2020-05-09 16:37:37', '2020-05-09 09:37:37', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) DEFAULT '0',
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT '0',
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Profil', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'profil', 'berita, pengumuman, sekilas-info', 10, '2019-04-01 21:44:37', '2022-06-14 11:28:30', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, '+1+', 'page', 'publish', 'public', 'open', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 8, '2019-04-01 21:44:37', '2022-06-14 09:04:13', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Sample Post 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-1', 'berita, pengumuman, sekilas-info', 7, '2019-04-01 21:44:37', '2022-03-27 02:11:20', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 2, '2019-04-01 21:44:37', '2022-03-27 02:11:14', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '+1+', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2019-04-01 21:44:37', '2019-04-01 14:44:37', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'PENGUMUMAN KELULUSAN', '<p>Sebelum mengetahui hasil kelulusan silahkan simak video sambutan dari kepala smkn 1 kotabaru melalui link Youtube dibawah ini</p>\n<p>Silahkan tonton sampai selesai dan baru cek pengumuman pada Link yang ada di deskripsi video Youtube</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'pengumuman-kelulusan', NULL, 0, '2022-06-03 09:30:11', '2022-06-03 01:30:11', NULL, NULL, 1, 0, 0, 0, 'false'),
(10, 'PENGUMUMAN KELULUSAN 2022', '<p>Sebelum mengetahui hasil kelulusan silahkan simak video sambutan dari kepala smkn 1 kotabaru melalui link Youtube dibawah ini</p>\n<p><iframe class=\"mx-auto\" title=\"YouTube video player\" src=\"https://www.youtube.com/embed/N35wp1PSCvU?controls=0\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>\n<p>Silahkan tonton sampai selesai dan baru cek pengumuman pada Link yang ada di deskripsi video Youtube</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'open', 'pengumuman-kelulusan-2022', NULL, 4, '2022-06-03 09:30:36', '2022-06-30 11:19:25', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pendidikan merupakan tiket untuk masa depan. Hari esok untuk orang-orang yang telah mempersiapkan dirinya hari ini', 'Anonim', '2019-04-01 21:44:36', '2019-04-01 14:44:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Agama tanpa ilmu pengetahuan adalah buta. Dan ilmu pengetahuan tanpa agama adalah lumpuh', 'Anonim', '2019-04-01 21:44:36', '2019-04-01 14:44:36', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Hiduplah seakan-akan kau akan mati besok. Belajarlah seakan-akan kau akan hidup selamanya', 'Anonim', '2019-04-01 21:44:36', '2019-04-01 14:44:36', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) DEFAULT '0',
  `scholarship_type` bigint(20) DEFAULT '0',
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text,
  `setting_default_value` text,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2019-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', NULL, 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'general', 'google_map_api_key', NULL, 'AIzaSyDmiycFxzYZ37FOwA4wqSbL3z2YvIYIArw', 'public', 'API Key Google Map', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'general', 'latitude', NULL, '-6.2407311', 'public', 'Latitude', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'longitude', NULL, '106.9972892', 'public', 'Longitude', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'general', 'timezone', 'Asia/Singapore', 'Asia/Jakarta', 'public', 'Time Zone', '2019-04-01 21:44:34', '2020-05-11 08:18:07', NULL, NULL, 0, 1, 0, 0, 'false'),
(16, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'social_account', 'facebook', 'https://fb.me/hendri.arifin.skom', '', 'public', 'Facebook', '2019-04-01 21:44:34', '2020-05-13 12:17:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(59, 'social_account', 'twitter', NULL, '', 'public', 'Twitter', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'social_account', 'youtube', NULL, '', 'public', 'Youtube', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'social_account', 'instagram', 'https://instagram.com/hendri.arifin.skom', '', 'public', 'Instagram', '2019-04-01 21:44:34', '2020-05-13 12:18:45', NULL, NULL, 0, 1, 0, 0, 'false'),
(63, 'mail_server', 'sendgrid_username', NULL, '', 'public', 'Sendgrid Username', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'mail_server', 'sendgrid_password', NULL, '', 'public', 'Sendgrid Password', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'mail_server', 'sendgrid_api_key', NULL, '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', 'public', 'Sendgrid API Key', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'school_profile', 'npsn', NULL, '123', 'public', 'NPSN', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'school_profile', 'school_name', 'SMK Negeri 1 Kotabaru', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2019-04-01 21:44:34', '2022-06-14 08:21:30', NULL, NULL, 0, 1, 0, 0, 'false'),
(68, 'school_profile', 'headmaster', NULL, 'Anton Sofyan', 'public', 'Kepala Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'school_profile', 'headmaster_photo', NULL, 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'school_profile', 'school_level', '99', '3', 'public', 'Bentuk Pendidikan', '2019-04-01 21:44:34', '2020-05-18 17:10:35', NULL, NULL, 0, 1, 0, 0, 'false'),
(71, 'school_profile', 'school_status', NULL, '1', 'public', 'Status Sekolah', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'ownership_status', '106', '1', 'public', 'Status Kepemilikan', '2019-04-01 21:44:34', '2020-05-18 17:12:30', NULL, NULL, 0, 1, 0, 0, 'false'),
(73, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'school_profile', 'decree_operating_permit_date', NULL, '2019-04-01', 'public', 'Tanggal SK Izin Operasional', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'school_profile', 'tagline', 'Ilmu akan menjadikan kita memiliki derajat yang lebih tinggi', 'Where Tomorrow\'s Leaders Come Together', 'public', 'Slogan', '2019-04-01 21:44:34', '2022-06-14 11:37:00', NULL, NULL, 0, 1, 0, 0, 'false'),
(76, 'school_profile', 'rt', NULL, '12', 'public', 'RT', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'school_profile', 'rw', NULL, '06', 'public', 'RW', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'school_profile', 'sub_village', NULL, 'Wage', 'public', 'Dusun', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'school_profile', 'village', NULL, 'Kadugede', 'public', 'Kelurahan / Desa', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'school_profile', 'sub_district', NULL, 'Kadugede', 'public', 'Kecamatan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'school_profile', 'district', NULL, 'Kuningan', 'public', 'Kabupaten', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'school_profile', 'postal_code', NULL, '45561', 'public', 'Kode Pos', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'school_profile', 'street_address', NULL, 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'school_profile', 'phone', NULL, '0232123456', 'public', 'Telepon', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'school_profile', 'fax', NULL, '0232123456', 'public', 'Fax', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'school_profile', 'email', NULL, 'info@sman9kuningan.sch.id', 'public', 'Email', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'school_profile', 'website', NULL, 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'school_profile', 'logo', '32f8cc4f2ce445835d8a04659d90a4a6.png', 'logo.png', 'public', 'Logo', '2019-04-01 21:44:34', '2022-06-14 08:24:48', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'admission', 'admission_status', NULL, 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2019-04-01 21:44:34', '2019-04-01 14:44:34', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'admission', 'admission_year', '2022', '2019', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2019-04-01 21:44:34', '2022-05-28 01:02:30', NULL, NULL, 0, 1, 0, 0, 'false'),
(91, 'admission', 'admission_start_date', '2022-06-07', '2019-01-01', 'public', 'Tanggal Mulai PPDB', '2019-04-01 21:44:34', '2022-06-08 01:34:39', NULL, NULL, 0, 1, 0, 0, 'false'),
(92, 'admission', 'admission_end_date', '2022-06-21', '2019-12-31', 'public', 'Tanggal Selesai PPDB', '2019-04-01 21:44:34', '2022-06-08 01:34:49', NULL, NULL, 0, 1, 0, 0, 'false'),
(93, 'admission', 'announcement_start_date', '2022-06-29', '2019-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2019-04-01 21:44:34', '2022-06-30 11:10:13', NULL, NULL, 0, 1, 0, 0, 'false'),
(94, 'admission', 'announcement_end_date', '2022-07-03', '2019-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2019-04-01 21:44:34', '2022-06-30 11:10:23', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id` int(11) NOT NULL,
  `soal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id`, `soal`) VALUES
(1, 'Siapa presiden pertama Indonesia ?'),
(2, 'Siapa presiden Indonesia saat ini ?');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT '0' COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT '0' COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(20) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT '0' COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni ?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan / KTP',
  `nkk` varchar(50) DEFAULT NULL COMMENT 'nomor_kk',
  `no_akta` varchar(50) DEFAULT NULL COMMENT 'Nomor Akta Kelahiran',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `tahun_lulus` smallint(4) DEFAULT NULL COMMENT 'Tahun Lulus SMP',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT '0',
  `special_need_id` bigint(20) DEFAULT '0' COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT '0' COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT '0' COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `nik_father` varchar(50) DEFAULT NULL COMMENT 'Nomor KTP Ayah',
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT '0',
  `father_employment_id` bigint(20) DEFAULT '0',
  `father_monthly_income_id` bigint(20) DEFAULT '0',
  `father_special_need_id` bigint(20) DEFAULT '0',
  `phone_father` varchar(50) DEFAULT NULL COMMENT 'HP Ayah',
  `mother_name` varchar(150) DEFAULT NULL,
  `nik_mother` varchar(50) DEFAULT NULL COMMENT 'Nomor KTP Ibu',
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT '0',
  `mother_employment_id` bigint(20) DEFAULT '0',
  `mother_monthly_income_id` bigint(20) DEFAULT '0',
  `mother_special_need_id` bigint(20) DEFAULT '0',
  `phone_mother` varchar(50) DEFAULT NULL COMMENT 'HP Ibu',
  `guardian_name` varchar(150) DEFAULT NULL,
  `nik_guardian` varchar(50) DEFAULT NULL COMMENT 'Nomor KTP Wali',
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT '0',
  `guardian_employment_id` bigint(20) DEFAULT '0',
  `guardian_monthly_income_id` bigint(20) DEFAULT '0',
  `phone_guardian` varchar(50) DEFAULT NULL COMMENT 'HP Wali',
  `address_parent` varchar(255) DEFAULT NULL,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(3) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(3) DEFAULT NULL COMMENT 'Berat Badan',
  `lingkar_kpl` smallint(3) DEFAULT NULL COMMENT 'Lingkar Kepala',
  `bhs_indo` varchar(6) NOT NULL,
  `bhs_inggris` varchar(6) NOT NULL,
  `mtk` varchar(6) NOT NULL,
  `ipa` varchar(6) NOT NULL,
  `photo1` varchar(100) DEFAULT NULL,
  `bhs_indo2` varchar(6) NOT NULL,
  `bhs_inggris2` varchar(6) NOT NULL,
  `mtk2` varchar(6) NOT NULL,
  `ipa2` varchar(6) NOT NULL,
  `photo2` varchar(100) DEFAULT NULL,
  `bhs_indo3` varchar(6) NOT NULL,
  `bhs_inggris3` varchar(6) NOT NULL,
  `mtk3` varchar(6) NOT NULL,
  `ipa3` varchar(6) NOT NULL,
  `photo3` varchar(100) DEFAULT NULL,
  `photo_kk` varchar(100) DEFAULT NULL,
  `photo_akta` varchar(100) DEFAULT NULL,
  `sibling_number` smallint(2) DEFAULT '0' COMMENT 'Jumlah Saudara Kandng',
  `anak_ke` tinyint(2) DEFAULT '0',
  `student_status_id` bigint(20) DEFAULT '0' COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1064, 1, 0, 0, '486100400530218', NULL, '3', 1, 170, '', NULL, 'true', 'true', 'false', '', 'true', NULL, NULL, '2212', '2212', '2212', '2212', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2020, NULL, NULL, NULL, 'NAVILLA MAULIDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', '19', '3', NULL, 'Semayap', 'Pulau Laut Utara', 'Kotabaru', '72117', 74, NULL, NULL, '85746080544', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2212', 1990, 50, 19, 73, 0, '85746080544', 'DWI LALA SANTI', '2212', 1988, 50, 19, 73, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 6, 15, 170, 60, 22, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 3, 3, 1, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 1, 0, 0, 'false'),
(1065, 0, 0, 0, '486100400530099', NULL, '3', 1, 170, 'd87bf7d0efe9b29f71fb4f34db267ef9.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2212', '2212', '2212', '2212', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2020, NULL, NULL, NULL, 'AULIA DEVIKA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', '19', '3', NULL, 'Semayap', 'Pulau Laut Utara', 'Kotabaru', '72117', 74, NULL, NULL, '85746080544', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2212', 1990, 50, 19, 73, 0, '85746080544', 'DWI LALA SANTI', '2212', 1990, 50, 19, 73, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 6, 15, 170, 60, 22, '12', '12', '12', '12', '5c1dad07ea8e09701a01c5cffd601134.jpg', '12', '12', '12', '12', '133ae1b756a19f3e1edba37a3c2851de.JPG', '12', '12', '12', '12', 'b3864f6b9a4455ee656e7e1073e3b6a5.jpg', 'f5dff1a3e0b505af38d9d90d5d2338c9.jpg', '66cfec789dfd832807cfdcd4a8c11450.jpg', 3, 3, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1066, 0, 1, 0, '486100400530195', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2020, NULL, NULL, NULL, 'SALSA AMELIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7211', NULL, NULL, NULL, '857460805', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 6, 15, 222, 22, 22, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 1, 0, 0, 'false'),
(1067, 0, 1, 0, '486100400530267', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2021, NULL, NULL, NULL, 'TARRA AMELIA AGUSTINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7212', NULL, NULL, NULL, '857460806', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1068, 0, 1, 0, '486100400530269', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2022, NULL, NULL, NULL, 'KASMA AMALIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7213', NULL, NULL, NULL, '857460807', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1069, 0, 1, 0, '486100400530274', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2023, NULL, NULL, NULL, 'WINDA AHMALIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7214', NULL, NULL, NULL, '857460808', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1070, 0, 1, 0, '486100400530276', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2024, NULL, NULL, NULL, 'KASMAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7215', NULL, NULL, NULL, '857460809', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1071, 0, 1, 0, '486100400530277', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2025, NULL, NULL, NULL, 'AZIZATUL SAFITRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7216', NULL, NULL, NULL, '857460810', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1072, 0, 1, 0, '486100400530278', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2026, NULL, NULL, NULL, 'HAERUNNISA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7217', NULL, NULL, NULL, '857460811', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1073, 0, 1, 0, '486100400530279', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2027, NULL, NULL, NULL, 'SITI RAHMAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7218', NULL, NULL, NULL, '857460812', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1074, 0, 1, 0, '486100400530280', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2028, NULL, NULL, NULL, 'ZIRROH AGUSTINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7219', NULL, NULL, NULL, '857460813', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1075, 0, 1, 0, '486100400530281', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2029, NULL, NULL, NULL, 'RINI MAISAROH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7220', NULL, NULL, NULL, '857460814', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1076, 0, 1, 0, '486100400530282', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2030, NULL, NULL, NULL, 'DILA CAHYANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7221', NULL, NULL, NULL, '857460815', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1077, 0, 1, 0, '486100400530284', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2031, NULL, NULL, NULL, 'HERNISA RAMADHANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7222', NULL, NULL, NULL, '857460816', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1078, 0, 1, 0, '486100400530286', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2032, NULL, NULL, NULL, 'WULAN MARSHA ARESTA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7223', NULL, NULL, NULL, '857460817', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1079, 0, 1, 0, '486100400530262', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2033, NULL, NULL, NULL, 'BAENAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7224', NULL, NULL, NULL, '857460818', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1080, 0, 1, 0, '486100400530271', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2034, NULL, NULL, NULL, 'RIRIN ADI SAFITRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7225', NULL, NULL, NULL, '857460819', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1081, 0, 1, 0, '486104400530011', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2035, NULL, NULL, NULL, 'RUSDIANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7226', NULL, NULL, NULL, '857460820', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1082, 0, 1, 0, '486106400530006', NULL, '3', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2036, NULL, NULL, NULL, 'YULIANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7227', NULL, NULL, NULL, '857460821', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1083, 0, 1, 0, '486100400530175', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2037, NULL, NULL, NULL, 'CHELSIA PEGI SIR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7228', NULL, NULL, NULL, '857460822', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1084, 0, 1, 0, '486100400530232', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2038, NULL, NULL, NULL, 'NADIYA AULIA PUTRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7229', NULL, NULL, NULL, '857460823', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1085, 0, 1, 0, '486100400530233', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2039, NULL, NULL, NULL, 'MAYA MULYANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7230', NULL, NULL, NULL, '857460824', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1086, 0, 1, 0, '486100400530234', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2040, NULL, NULL, NULL, 'NOOR KUMALA SINTYA RAHMADANIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7231', NULL, NULL, NULL, '857460825', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1087, 0, 1, 0, '486100400530235', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2041, NULL, NULL, NULL, 'RISQY AULIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7232', NULL, NULL, NULL, '857460826', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1088, 0, 1, 0, '486100400530236', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2042, NULL, NULL, NULL, 'XENIA DUWI ARISANDI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7233', NULL, NULL, NULL, '857460827', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1089, 0, 1, 0, '486100400530237', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2043, NULL, NULL, NULL, 'AMANDA APRILIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7234', NULL, NULL, NULL, '857460828', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1090, 0, 1, 0, '486100400530266', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2044, NULL, NULL, NULL, 'NANDA AGUSTINA. A', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7235', NULL, NULL, NULL, '857460829', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1091, 0, 1, 0, '486100400530248', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2045, NULL, NULL, NULL, 'DEFI DWI SILFIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7236', NULL, NULL, NULL, '857460830', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1092, 0, 1, 0, '486100400530159', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2046, NULL, NULL, NULL, 'VIRNIA NAURAH CHANTIKA PUTRI ADAM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7237', NULL, NULL, NULL, '857460831', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1093, 0, 1, 0, '486100400530289', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2047, NULL, NULL, NULL, 'PUTRI WAHDANIAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7238', NULL, NULL, NULL, '857460832', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1094, 0, 1, 0, '486100400530207', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2048, NULL, NULL, NULL, 'AHMAD HUSAINI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7239', NULL, NULL, NULL, '857460833', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1095, 0, 1, 0, '486100400530108', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2049, NULL, NULL, NULL, 'MUHAMMAD RISKI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7240', NULL, NULL, NULL, '857460834', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1096, 0, 1, 0, '486100400530144', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2050, NULL, NULL, NULL, 'M. ANAS AGUSSALIM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7241', NULL, NULL, NULL, '857460835', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1097, 0, 1, 0, '486100400530216', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2051, NULL, NULL, NULL, 'RIGINA NATASA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7242', NULL, NULL, NULL, '857460836', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1098, 0, 1, 0, '486100400530257', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2052, NULL, NULL, NULL, 'MUHAMMAD AKBAR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7243', NULL, NULL, NULL, '857460837', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1099, 0, 1, 0, '486104400530016', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2053, NULL, NULL, NULL, 'HELDIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7244', NULL, NULL, NULL, '857460838', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1100, 0, 1, 0, '486104400530015', NULL, '8', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2054, NULL, NULL, NULL, 'SERLIE JULIARYANTO', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7245', NULL, NULL, NULL, '857460839', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1101, 0, 1, 0, '486100400530045', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2055, NULL, NULL, NULL, 'MULIDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7246', NULL, NULL, NULL, '857460840', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1102, 0, 1, 0, '486100400530255', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2056, NULL, NULL, NULL, 'SITI RASMA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7247', NULL, NULL, NULL, '857460841', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1103, 0, 1, 0, '486100400530086', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2057, NULL, NULL, NULL, 'NIA RAMADANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7248', NULL, NULL, NULL, '857460842', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1104, 0, 1, 0, '486100400530002', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2058, NULL, NULL, NULL, 'CHRISTINE CLAUDIA SOENTANTO', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7249', NULL, NULL, NULL, '857460843', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1105, 0, 1, 0, '486100400530051', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2059, NULL, NULL, NULL, 'MAULIDIYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7250', NULL, NULL, NULL, '857460844', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1106, 0, 1, 0, '486100400530181', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2060, NULL, NULL, NULL, 'NURHIKMAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7251', NULL, NULL, NULL, '857460845', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1107, 0, 1, 0, '486100400530193', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2061, NULL, NULL, NULL, 'KHOFIZHOH DURRATUN NASHAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7252', NULL, NULL, NULL, '857460846', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1108, 0, 1, 0, '486100400530137', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2062, NULL, NULL, NULL, 'MELYNDA INZALNA BILQIS', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7253', NULL, NULL, NULL, '857460847', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1109, 0, 1, 0, '486100400530079', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2063, NULL, NULL, NULL, 'LINDA LIANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7254', NULL, NULL, NULL, '857460848', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1110, 0, 1, 0, '486100400530061', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2064, NULL, NULL, NULL, 'SALSABILA PUTRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7255', NULL, NULL, NULL, '857460849', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1111, 0, 1, 0, '486100400530272', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2065, NULL, NULL, NULL, 'AULIA RAHMADI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7256', NULL, NULL, NULL, '857460850', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1112, 0, 1, 0, '486100400530222', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2066, NULL, NULL, NULL, 'RENI YULIANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7257', NULL, NULL, NULL, '857460851', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1113, 0, 1, 0, '486100400530178', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2067, NULL, NULL, NULL, 'RISKA YULIANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7258', NULL, NULL, NULL, '857460852', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1114, 0, 1, 0, '486100400530060', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2068, NULL, NULL, NULL, 'RASMI HARDIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7259', NULL, NULL, NULL, '857460853', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1115, 0, 1, 0, '486100400530035', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2069, NULL, NULL, NULL, 'ROSI DYAN EKA APRYANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7260', NULL, NULL, NULL, '857460854', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1116, 0, 1, 0, '486100400530010', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2070, NULL, NULL, NULL, 'SITI JILSIA YULIANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7261', NULL, NULL, NULL, '857460855', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1117, 0, 1, 0, '486100400530013', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2071, NULL, NULL, NULL, 'NURUL HUDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7262', NULL, NULL, NULL, '857460856', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1118, 0, 1, 0, '486100400530135', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2072, NULL, NULL, NULL, 'EKA RIZKY MAULANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7263', NULL, NULL, NULL, '857460857', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1119, 0, 1, 0, '486100400530077', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2073, NULL, NULL, NULL, 'M. REZA PIKRIAWAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7264', NULL, NULL, NULL, '857460858', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1120, 0, 1, 0, '486100400530036', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2074, NULL, NULL, NULL, 'MUHAMMAD ALDI ALFARIZI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7265', NULL, NULL, NULL, '857460859', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1121, 0, 1, 0, '486100400530004', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2075, NULL, NULL, NULL, 'RIRIN KURNIATI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7266', NULL, NULL, NULL, '857460860', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1122, 0, 1, 0, '486100400530089', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2076, NULL, NULL, NULL, 'RIZKY SETYA PRATAMA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7267', NULL, NULL, NULL, '857460861', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1123, 0, 1, 0, '486100400530273', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2077, NULL, NULL, NULL, 'M.ZAINUDDIN NOOR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7268', NULL, NULL, NULL, '857460862', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1124, 0, 1, 0, '486100400530250', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2078, NULL, NULL, NULL, 'MAKSUM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7269', NULL, NULL, NULL, '857460863', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1125, 0, 1, 0, '486100400530245', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2079, NULL, NULL, NULL, 'HERMAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7270', NULL, NULL, NULL, '857460864', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1126, 0, 1, 0, '486100400530029', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2080, NULL, NULL, NULL, 'MUHAMMAD ARDIANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7271', NULL, NULL, NULL, '857460865', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1127, 0, 1, 0, '486104400530023', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2081, NULL, NULL, NULL, 'MUHAMMAD WAWAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7272', NULL, NULL, NULL, '857460866', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1128, 0, 1, 0, '486104400530008', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2082, NULL, NULL, NULL, 'DODI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7273', NULL, NULL, NULL, '857460867', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1129, 0, 1, 0, '486104400530013', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2083, NULL, NULL, NULL, 'RIDHO ROBBI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7274', NULL, NULL, NULL, '857460868', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1130, 0, 1, 0, '486104400530017', NULL, '7', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2084, NULL, NULL, NULL, 'M.RIZKY FADILLAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7275', NULL, NULL, NULL, '857460869', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1131, 0, 1, 0, '486100400530034', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2085, NULL, NULL, NULL, 'MUHAMMAD NAUFAL FADHILAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7276', NULL, NULL, NULL, '857460870', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1132, 0, 1, 0, '486100400530001', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2086, NULL, NULL, NULL, 'FAHMI DWI PRAYOGA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7277', NULL, NULL, NULL, '857460871', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1133, 0, 1, 0, '486100400530031', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2087, NULL, NULL, NULL, 'MOCH.IQBAL.AS', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7278', NULL, NULL, NULL, '857460872', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1134, 0, 1, 0, '486100400530101', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2088, NULL, NULL, NULL, 'M. SADDAM HUSEIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7279', NULL, NULL, NULL, '857460873', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1135, 0, 1, 0, '486100400530052', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2089, NULL, NULL, NULL, 'MUHAMMAD DZULFIKAR AL FARUQ', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7280', NULL, NULL, NULL, '857460874', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1136, 0, 1, 0, '486100400530005', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2090, NULL, NULL, NULL, 'RAMZIE FAUZAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7281', NULL, NULL, NULL, '857460875', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1137, 0, 1, 0, '486100400530041', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2091, NULL, NULL, NULL, 'RIFQI WIDHIANTORO', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7282', NULL, NULL, NULL, '857460876', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1138, 0, 1, 0, '486100400530226', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2092, NULL, NULL, NULL, 'M. RIZKI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7283', NULL, NULL, NULL, '857460877', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1139, 0, 1, 0, '486100400530046', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2093, NULL, NULL, NULL, 'AHMAD GAFURI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7284', NULL, NULL, NULL, '857460878', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1140, 0, 1, 0, '486100400530227', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2094, NULL, NULL, NULL, 'SAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7285', NULL, NULL, NULL, '857460879', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1141, 0, 1, 0, '486100400530251', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2095, NULL, NULL, NULL, 'M. IHSAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7286', NULL, NULL, NULL, '857460880', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1142, 0, 1, 0, '486100400530190', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2096, NULL, NULL, NULL, 'MUHAMMAD ALDYANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7287', NULL, NULL, NULL, '857460881', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1143, 0, 1, 0, '486100400530239', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2097, NULL, NULL, NULL, 'MUHAMMAD INDRA FAUZI RAHMAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7288', NULL, NULL, NULL, '857460882', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1144, 0, 1, 0, '486100400530117', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2098, NULL, NULL, NULL, 'MUHAMMAD FIKRI BADRIANOR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7289', NULL, NULL, NULL, '857460883', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1145, 0, 1, 0, '486100400530275', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2099, NULL, NULL, NULL, 'MUHAMMAD RIDHO', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7290', NULL, NULL, NULL, '857460884', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1146, 0, 1, 0, '486100400530024', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2100, NULL, NULL, NULL, 'MUHAMMAD IBNI TSAQIF', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7291', NULL, NULL, NULL, '857460885', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1147, 0, 1, 0, '486100400530011', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2101, NULL, NULL, NULL, 'ABDHIKA NOOR PRATAMA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7292', NULL, NULL, NULL, '857460886', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1148, 0, 1, 0, '486100400530223', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2102, NULL, NULL, NULL, 'MUHAMMAD RAMADAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7293', NULL, NULL, NULL, '857460887', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1149, 0, 1, 0, '486100400530224', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2103, NULL, NULL, NULL, 'RHIDO', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7294', NULL, NULL, NULL, '857460888', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1150, 0, 1, 0, '486100400530259', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2104, NULL, NULL, NULL, 'MUHAMMAD FAISAL RIFALDI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7295', NULL, NULL, NULL, '857460889', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1151, 0, 1, 0, '486100400530081', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2105, NULL, NULL, NULL, 'M. SYAIFUL ARIF SYAHPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7296', NULL, NULL, NULL, '857460890', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1152, 0, 1, 0, '486100400530261', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2106, NULL, NULL, NULL, 'MISRAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7297', NULL, NULL, NULL, '857460891', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1153, 0, 1, 0, '486100400530206', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2107, NULL, NULL, NULL, 'MUHAMMAD ARBAIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7298', NULL, NULL, NULL, '857460892', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1154, 0, 1, 0, '486100400530068', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2108, NULL, NULL, NULL, 'M. SUKMA MULIADI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7299', NULL, NULL, NULL, '857460893', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1155, 0, 1, 0, '486104400530009', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2109, NULL, NULL, NULL, 'MANDALA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7300', NULL, NULL, NULL, '857460894', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1156, 0, 1, 0, '486104400530024', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2110, NULL, NULL, NULL, 'MUHAMMAD ABRAR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7301', NULL, NULL, NULL, '857460895', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1157, 0, 1, 0, '486100400530292', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2111, NULL, NULL, NULL, 'M. BIM BIM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7302', NULL, NULL, NULL, '857460896', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1158, 0, 1, 0, '486100400530295', NULL, '1', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2112, NULL, NULL, NULL, 'ERPANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7303', NULL, NULL, NULL, '857460897', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1159, 0, 1, 0, '486100400530252', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2113, NULL, NULL, NULL, 'HAYYU MEYDINA SALMA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7304', NULL, NULL, NULL, '857460898', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1160, 0, 1, 0, '486100400530069', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2114, NULL, NULL, NULL, 'RIVALDO PURNAMA PUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7305', NULL, NULL, NULL, '857460899', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1161, 0, 1, 0, '486100400530256', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2115, NULL, NULL, NULL, 'MUHAMMAD ALFAREZA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7306', NULL, NULL, NULL, '857460900', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1162, 0, 1, 0, '486100400530139', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2116, NULL, NULL, NULL, 'RASUNA AMALIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7307', NULL, NULL, NULL, '857460901', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1163, 0, 1, 0, '486100400530157', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2117, NULL, NULL, NULL, 'M. HABIBI MUTTAQIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7308', NULL, NULL, NULL, '857460902', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1164, 0, 1, 0, '486100400530136', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2118, NULL, NULL, NULL, 'MUHAMMAD RAMADHANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7309', NULL, NULL, NULL, '857460903', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1165, 0, 1, 0, '486100400530180', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2119, NULL, NULL, NULL, 'AKHMAD RAMADANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7310', NULL, NULL, NULL, '857460904', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1166, 0, 1, 0, '486100400530165', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2120, NULL, NULL, NULL, 'MUHAMMAD AFREZA AL AZHAR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7311', NULL, NULL, NULL, '857460905', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1167, 0, 1, 0, '486100400530185', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2121, NULL, NULL, NULL, 'KHOIRONNISA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7312', NULL, NULL, NULL, '857460906', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1168, 0, 1, 0, '486100400530228', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2122, NULL, NULL, NULL, 'NAZLIA NURAINI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7313', NULL, NULL, NULL, '857460907', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1169, 0, 1, 0, '486100400530177', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2123, NULL, NULL, NULL, 'NIYAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7314', NULL, NULL, NULL, '857460908', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1170, 0, 1, 0, '486100400530122', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2124, NULL, NULL, NULL, 'MUHAMMAD ADITYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7315', NULL, NULL, NULL, '857460909', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1171, 0, 1, 0, '486100400530092', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2125, NULL, NULL, NULL, 'ANDRI CHRISTIAN P', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7316', NULL, NULL, NULL, '857460910', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1172, 0, 1, 0, '486100400530014', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2126, NULL, NULL, NULL, 'SITI WARDIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7317', NULL, NULL, NULL, '857460911', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1173, 0, 1, 0, '486100400530087', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2127, NULL, NULL, NULL, 'MARTA OLIVIA SANTOSO', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7318', NULL, NULL, NULL, '857460912', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1174, 0, 1, 0, '486100400530290', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2128, NULL, NULL, NULL, 'NURBAITI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7319', NULL, NULL, NULL, '857460913', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1175, 0, 1, 0, '486100400530128', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2129, NULL, NULL, NULL, 'M. REYHAN AKBAR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7320', NULL, NULL, NULL, '857460914', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1176, 0, 1, 0, '486100400530214', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2130, NULL, NULL, NULL, 'YISI AMELIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7321', NULL, NULL, NULL, '857460915', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1177, 0, 1, 0, '486100400530243', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2131, NULL, NULL, NULL, 'ALFIANOR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7322', NULL, NULL, NULL, '857460916', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1178, 0, 1, 0, '486100400530161', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2132, NULL, NULL, NULL, 'NOOR RIZKY ALPIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7323', NULL, NULL, NULL, '857460917', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1179, 0, 1, 0, '486100400530124', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2133, NULL, NULL, NULL, 'NAILA SITA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7324', NULL, NULL, NULL, '857460918', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1180, 0, 1, 0, '486100400530201', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2134, NULL, NULL, NULL, 'RIYAN HIDAYAT', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7325', NULL, NULL, NULL, '857460919', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1181, 0, 1, 0, '486100400530196', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2135, NULL, NULL, NULL, 'M. RAFI FADILLAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7326', NULL, NULL, NULL, '857460920', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1182, 0, 1, 0, '486100400530177', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2136, NULL, NULL, NULL, 'NIYAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7327', NULL, NULL, NULL, '857460921', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1183, 0, 1, 0, '486100400530088', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2137, NULL, NULL, NULL, 'LESDA SUCIE RAMADAYANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7328', NULL, NULL, NULL, '857460922', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1184, 0, 1, 0, '486100400530182', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2138, NULL, NULL, NULL, 'M. ARIEL AFANSYAH PUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7329', NULL, NULL, NULL, '857460923', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1185, 0, 1, 0, '486100400530094', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2139, NULL, NULL, NULL, 'FEBRIKAL DEPPASULLE', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7330', NULL, NULL, NULL, '857460924', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1186, 0, 1, 0, '486100400530215', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2140, NULL, NULL, NULL, 'AHMAD INDRA SAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7331', NULL, NULL, NULL, '857460925', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1187, 0, 1, 0, '486100400530264', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2141, NULL, NULL, NULL, 'MASLIAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7332', NULL, NULL, NULL, '857460926', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1188, 0, 1, 0, '486100400530121', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2142, NULL, NULL, NULL, 'AKHMAD RIZKY FAUZIAN NOOR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7333', NULL, NULL, NULL, '857460927', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1189, 0, 1, 0, '486100400530242', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2143, NULL, NULL, NULL, 'ENDA ARIANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7334', NULL, NULL, NULL, '857460928', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1190, 0, 1, 0, '486100400530210', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2144, NULL, NULL, NULL, 'MUHAMMAD ADITIYA KHOIR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7335', NULL, NULL, NULL, '857460929', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1191, 0, 1, 0, '486100400530288', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2145, NULL, NULL, NULL, 'SEPTIANOR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7336', NULL, NULL, NULL, '857460930', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1192, 0, 1, 0, '486100400530285', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2146, NULL, NULL, NULL, 'RISFIKA MAULIDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7337', NULL, NULL, NULL, '857460931', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1193, 0, 1, 0, '486100400530129', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2147, NULL, NULL, NULL, 'RIDHA RAHMA DINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7338', NULL, NULL, NULL, '857460932', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1194, 0, 1, 0, '486100400530015', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2148, NULL, NULL, NULL, 'MIRJA ALIM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7339', NULL, NULL, NULL, '857460933', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1195, 0, 1, 0, '486100400530270', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2149, NULL, NULL, NULL, 'SYAIFUL RASYED', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7340', NULL, NULL, NULL, '857460934', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1196, 0, 1, 0, '486100400530009', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2150, NULL, NULL, NULL, 'MUHAMMAD IRZHA FIRDAUS', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7341', NULL, NULL, NULL, '857460935', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1197, 0, 1, 0, '486100400530027', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2151, NULL, NULL, NULL, 'MUTIA ANJANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7342', NULL, NULL, NULL, '857460936', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1198, 0, 1, 0, '486100400530119', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2152, NULL, NULL, NULL, 'MUHAMMAD RAFI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7343', NULL, NULL, NULL, '857460937', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1199, 0, 1, 0, '486100400530116', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2153, NULL, NULL, NULL, 'SITI ANISA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7344', NULL, NULL, NULL, '857460938', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1200, 0, 1, 0, '486100400530107', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2154, NULL, NULL, NULL, 'HARRY WINATA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7345', NULL, NULL, NULL, '857460939', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1201, 0, 1, 0, '486100400530169', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2155, NULL, NULL, NULL, 'MUHAMMAD APRI MAULANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7346', NULL, NULL, NULL, '857460940', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1202, 0, 1, 0, '486100400530049', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2156, NULL, NULL, NULL, 'MUHAMMAD JAPAR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7347', NULL, NULL, NULL, '857460941', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1203, 0, 1, 0, '486100400530026', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2157, NULL, NULL, NULL, 'M. IRPAN FAKHRUDDIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7348', NULL, NULL, NULL, '857460942', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1204, 0, 1, 0, '486100400530225', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2158, NULL, NULL, NULL, 'M. RAFLI FADILLAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7349', NULL, NULL, NULL, '857460943', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1205, 0, 1, 0, '486100400530188', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2159, NULL, NULL, NULL, 'M. YUSRIL', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7350', NULL, NULL, NULL, '857460944', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1206, 0, 1, 0, '486100400530008', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2160, NULL, NULL, NULL, 'RINI MULYANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7351', NULL, NULL, NULL, '857460945', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1207, 0, 1, 0, '486100400530093', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2161, NULL, NULL, NULL, 'MUHAMMAD HAFIDZ ZAINI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7352', NULL, NULL, NULL, '857460946', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1208, 0, 1, 0, '486100400530125', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2162, NULL, NULL, NULL, 'MARSHALINDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7353', NULL, NULL, NULL, '857460947', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1209, 0, 1, 0, '486100400530130', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2163, NULL, NULL, NULL, 'NASRUDIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7354', NULL, NULL, NULL, '857460948', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1210, 0, 1, 0, '486100400530150', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2164, NULL, NULL, NULL, 'M. HAFIZ', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7355', NULL, NULL, NULL, '857460949', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1211, 0, 1, 0, '486100400530032', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2165, NULL, NULL, NULL, 'RAHMADANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7356', NULL, NULL, NULL, '857460950', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1212, 0, 1, 0, '486100400530254', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2166, NULL, NULL, NULL, 'GALANG KURNIAWAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7357', NULL, NULL, NULL, '857460951', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1213, 0, 1, 0, '486100400530171', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2167, NULL, NULL, NULL, 'MUHAMMAD ANDIKA RAMLI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7358', NULL, NULL, NULL, '857460952', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1214, 0, 1, 0, '486100400530006', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2168, NULL, NULL, NULL, 'MEILIZA RUBIANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7359', NULL, NULL, NULL, '857460953', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1215, 0, 1, 0, '486100400530296', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2169, NULL, NULL, NULL, 'M.ADREANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7360', NULL, NULL, NULL, '857460954', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1216, 0, 1, 0, '486100400530143', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2170, NULL, NULL, NULL, 'BERY SEPREZY', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7361', NULL, NULL, NULL, '857460955', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1217, 0, 1, 0, '486100400530293', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2171, NULL, NULL, NULL, 'M. SYAHRIANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7362', NULL, NULL, NULL, '857460956', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1218, 0, 1, 0, '486100400530120', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2172, NULL, NULL, NULL, 'HAYATUL MAULIDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7363', NULL, NULL, NULL, '857460957', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1219, 0, 1, 0, '486100400530141', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2173, NULL, NULL, NULL, 'MUHAMMAD RIFA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7364', NULL, NULL, NULL, '857460958', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1220, 0, 1, 0, '486104400530018', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2174, NULL, NULL, NULL, 'MUHAMMAD FAUZAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7365', NULL, NULL, NULL, '857460959', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1221, 0, 1, 0, '486104400530020', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2175, NULL, NULL, NULL, 'MUHAMMAD ADZKARIL MUSYAFFA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7366', NULL, NULL, NULL, '857460960', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1222, 0, 1, 0, '486104400530022', NULL, '6', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2176, NULL, NULL, NULL, 'NIDA AMIRAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7367', NULL, NULL, NULL, '857460961', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1223, 0, 1, 0, '486100400530080', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2177, NULL, NULL, NULL, 'RIZKY RAHMAWATI PUTRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7368', NULL, NULL, NULL, '857460962', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1224, 0, 1, 0, '486100400530208', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2178, NULL, NULL, NULL, 'NAILA FARKHATUN KHISAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7369', NULL, NULL, NULL, '857460963', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1225, 0, 1, 0, '486100400530244', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2179, NULL, NULL, NULL, 'NIA RAHMADANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7370', NULL, NULL, NULL, '857460964', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1226, 0, 1, 0, '486100400530071', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2180, NULL, NULL, NULL, 'SITI NUR KHOLISHAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7371', NULL, NULL, NULL, '857460965', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1227, 0, 1, 0, '486100400530179', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2181, NULL, NULL, NULL, 'MARTIAS DWI RAHAYU', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7372', NULL, NULL, NULL, '857460966', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1228, 0, 1, 0, '486100400530054', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2182, NULL, NULL, NULL, 'AHMAD DWI RIFANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7373', NULL, NULL, NULL, '857460967', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1229, 0, 1, 0, '486100400530221', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2183, NULL, NULL, NULL, 'HAIYATUN NISA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7374', NULL, NULL, NULL, '857460968', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1230, 0, 1, 0, '486100400530043', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2184, NULL, NULL, NULL, 'RISTY NUR HALIZAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7375', NULL, NULL, NULL, '857460969', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1231, 0, 1, 0, '486100400530062', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2185, NULL, NULL, NULL, 'DESI RAHIMAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7376', NULL, NULL, NULL, '857460970', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1232, 0, 1, 0, '486100400530151', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2186, NULL, NULL, NULL, 'DIMAS SAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7377', NULL, NULL, NULL, '857460971', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1233, 0, 1, 0, '486100400530184', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2187, NULL, NULL, NULL, 'GUSTI KARINA LIYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7378', NULL, NULL, NULL, '857460972', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1234, 0, 1, 0, '486100400530057', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2188, NULL, NULL, NULL, 'ANDI NUR SARIRA AGUSTINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7379', NULL, NULL, NULL, '857460973', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1235, 0, 1, 0, '486100400530040', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2189, NULL, NULL, NULL, 'NABILA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7380', NULL, NULL, NULL, '857460974', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1236, 0, 1, 0, '486100400530164', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2190, NULL, NULL, NULL, 'ENI YULIA DAMAYANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7381', NULL, NULL, NULL, '857460975', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1237, 0, 1, 0, '486100400530030', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2191, NULL, NULL, NULL, 'HAIDHAR ALI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7382', NULL, NULL, NULL, '857460976', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1238, 0, 1, 0, '486100400530173', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2192, NULL, NULL, NULL, 'MUHAMMAD DICKY SYAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7383', NULL, NULL, NULL, '857460977', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1239, 0, 1, 0, '486100400530007', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2193, NULL, NULL, NULL, 'NAZMI MAULANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7384', NULL, NULL, NULL, '857460978', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1240, 0, 1, 0, '486100400530091', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2194, NULL, NULL, NULL, 'RIKO PRATAMA SAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7385', NULL, NULL, NULL, '857460979', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1241, 0, 1, 0, '486100400530162', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2195, NULL, NULL, NULL, 'MUHAMMAD FADILLAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7386', NULL, NULL, NULL, '857460980', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1242, 0, 1, 0, '486100400530073', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2196, NULL, NULL, NULL, 'RAJWA ALFISYAH AZ ZAHRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7387', NULL, NULL, NULL, '857460981', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1243, 0, 1, 0, '486100400530241', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2197, NULL, NULL, NULL, 'MUHAMMAD TAUFIK', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7388', NULL, NULL, NULL, '857460982', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1244, 0, 1, 0, '486100400530131', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2198, NULL, NULL, NULL, 'DINA ADDELIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7389', NULL, NULL, NULL, '857460983', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1245, 0, 1, 0, '486100400530176', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2199, NULL, NULL, NULL, 'NISWATUL KARIMAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7390', NULL, NULL, NULL, '857460984', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1246, 0, 1, 0, '486100400530083', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2200, NULL, NULL, NULL, 'HELDA YANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7391', NULL, NULL, NULL, '857460985', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1247, 0, 1, 0, '486100400530203', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2201, NULL, NULL, NULL, 'KAMELYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7392', NULL, NULL, NULL, '857460986', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1248, 0, 1, 0, '486100400530199', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2202, NULL, NULL, NULL, 'IVAN SAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7393', NULL, NULL, NULL, '857460987', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1249, 0, 1, 0, '486100400530067', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2203, NULL, NULL, NULL, 'NAILAH ZAHRA AZMI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7394', NULL, NULL, NULL, '857460988', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1250, 0, 1, 0, '486100400530168', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2204, NULL, NULL, NULL, 'M. SYAHRAMADHAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7395', NULL, NULL, NULL, '857460989', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1251, 0, 1, 0, '486100400530105', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2205, NULL, NULL, NULL, 'MUHAMMAD REHAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7396', NULL, NULL, NULL, '857460990', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1252, 0, 1, 0, '486100400530113', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2206, NULL, NULL, NULL, 'RAHMA SAFITRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7397', NULL, NULL, NULL, '857460991', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1253, 0, 1, 0, '486100400530021', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2207, NULL, NULL, NULL, 'HASNAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7398', NULL, NULL, NULL, '857460992', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1254, 0, 1, 0, '486100400530016', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2208, NULL, NULL, NULL, 'SHIFA ANGRIANI MAWIKERE', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7399', NULL, NULL, NULL, '857460993', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1255, 0, 1, 0, '486100400530109', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2209, NULL, NULL, NULL, 'MADINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7400', NULL, NULL, NULL, '857460994', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1256, 0, 1, 0, '486100400530204', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2210, NULL, NULL, NULL, 'ANISA NUGRAINI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7401', NULL, NULL, NULL, '857460995', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1257, 0, 1, 0, '486100400530098', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2211, NULL, NULL, NULL, 'MUHAMAD FEBRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7402', NULL, NULL, NULL, '857460996', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1258, 0, 1, 0, '486100400530127', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2212, NULL, NULL, NULL, 'JAMILATUL HUSNA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7403', NULL, NULL, NULL, '857460997', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1259, 0, 1, 0, '486100400530212', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2213, NULL, NULL, NULL, 'GT. LISDA SUSANTI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7404', NULL, NULL, NULL, '857460998', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1260, 0, 1, 0, '486100400530187', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2214, NULL, NULL, NULL, 'MUHAMMAD ALBANJARI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7405', NULL, NULL, NULL, '857460999', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1261, 0, 1, 0, '486100400530219', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2215, NULL, NULL, NULL, 'ANGGIE JULYA FEREZYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7406', NULL, NULL, NULL, '857461000', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1262, 0, 1, 0, '486100400530229', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2216, NULL, NULL, NULL, 'AMALIA AL FISYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7407', NULL, NULL, NULL, '857461001', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1263, 0, 1, 0, '486100400530230', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2217, NULL, NULL, NULL, 'NILAM CAHYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7408', NULL, NULL, NULL, '857461002', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1264, 0, 1, 0, '486100400530294', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2218, NULL, NULL, NULL, 'MAHNA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7409', NULL, NULL, NULL, '857461003', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1265, 0, 1, 0, '486100400530287', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2219, NULL, NULL, NULL, 'FITRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7410', NULL, NULL, NULL, '857461004', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1266, 0, 1, 0, '486100400530112', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2220, NULL, NULL, NULL, 'HALIMATUSSADIAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7411', NULL, NULL, NULL, '857461005', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1267, 0, 1, 0, '486100400530183', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2221, NULL, NULL, NULL, 'ITA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7412', NULL, NULL, NULL, '857461006', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1268, 0, 1, 0, '486100400530123', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2222, NULL, NULL, NULL, 'RISKY AULIA RAMADHANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7413', NULL, NULL, NULL, '857461007', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1269, 0, 1, 0, '486100400530042', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2223, NULL, NULL, NULL, 'RIZKYA NURHIKMAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7414', NULL, NULL, NULL, '857461008', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1270, 0, 1, 0, '486100400530095', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2224, NULL, NULL, NULL, 'UMMI HABIBAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7415', NULL, NULL, NULL, '857461009', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1271, 0, 1, 0, '486100400530076', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2225, NULL, NULL, NULL, 'NOVITA SALSABILA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7416', NULL, NULL, NULL, '857461010', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1272, 0, 1, 0, '486100400530205', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2226, NULL, NULL, NULL, 'SULASTRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7417', NULL, NULL, NULL, '857461011', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1273, 0, 1, 0, '486100400530134', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2227, NULL, NULL, NULL, 'AULIA NABILA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7418', NULL, NULL, NULL, '857461012', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1274, 0, 1, 0, '486100400530102', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2228, NULL, NULL, NULL, 'NANDA KOMAHRIAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7419', NULL, NULL, NULL, '857461013', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1275, 0, 1, 0, '486100400530100', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2229, NULL, NULL, NULL, 'TIARA NOVITA SARI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7420', NULL, NULL, NULL, '857461014', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1276, 0, 1, 0, '486100400530247', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2230, NULL, NULL, NULL, 'MUHAMMAD SYAHBANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7421', NULL, NULL, NULL, '857461015', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1277, 0, 1, 0, '486100400530158', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2231, NULL, NULL, NULL, 'REZA PAHLEVI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7422', NULL, NULL, NULL, '857461016', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1278, 0, 1, 0, '486100400530148', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2232, NULL, NULL, NULL, 'NUR ZASKHIYANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7423', NULL, NULL, NULL, '857461017', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1279, 0, 1, 0, '486100400530015', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2233, NULL, NULL, NULL, 'MIRJA ALIM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7424', NULL, NULL, NULL, '857461018', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1280, 0, 1, 0, '486100400530188', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2234, NULL, NULL, NULL, 'M. YUSRIL', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7425', NULL, NULL, NULL, '857461019', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1281, 0, 1, 0, '486100400530093', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2235, NULL, NULL, NULL, 'MUHAMMAD HAFIDZ ZAINI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7426', NULL, NULL, NULL, '857461020', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1282, 0, 1, 0, '486100400530194', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2236, NULL, NULL, NULL, 'ALDA RISMA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7427', NULL, NULL, NULL, '857461021', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1283, 0, 1, 0, '486100400530189', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2237, NULL, NULL, NULL, 'ANDRI SURAHMAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7428', NULL, NULL, NULL, '857461022', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1284, 0, 1, 0, '486104400530014', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2238, NULL, NULL, NULL, 'FARDA INDRIA FUTRI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7429', NULL, NULL, NULL, '857461023', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1285, 0, 1, 0, '486104400530006', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2239, NULL, NULL, NULL, 'APRILIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7430', NULL, NULL, NULL, '857461024', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1286, 0, 1, 0, '486106400530003', NULL, '11', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2240, NULL, NULL, NULL, 'ANSARI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7431', NULL, NULL, NULL, '857461025', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1287, 0, 1, 0, '486100400530153', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2241, NULL, NULL, NULL, 'RAFI AKHMAD', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7432', NULL, NULL, NULL, '857461026', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1288, 0, 1, 0, '486100400530156', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2242, NULL, NULL, NULL, 'MUHAMMAD FUZI ANGGAR SAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7433', NULL, NULL, NULL, '857461027', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1289, 0, 1, 0, '486100400530238', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2243, NULL, NULL, NULL, 'ARBAIN MUSTAKIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7434', NULL, NULL, NULL, '857461028', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1290, 0, 1, 0, '486100400530110', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2244, NULL, NULL, NULL, 'DAVA ARI FIRANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7435', NULL, NULL, NULL, '857461029', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1291, 0, 1, 0, '486100400530114', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2245, NULL, NULL, NULL, 'MUHAMMAD FAHRI SYARIF', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7436', NULL, NULL, NULL, '857461030', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1292, 0, 1, 0, '486100400530053', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2246, NULL, NULL, NULL, 'AMIRAH AZMI NASYWA SALSABILA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7437', NULL, NULL, NULL, '857461031', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1293, 0, 1, 0, '486100400530167', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2247, NULL, NULL, NULL, 'MUHAMMAD FIKRI NOOR ALMADANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7438', NULL, NULL, NULL, '857461032', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1294, 0, 1, 0, '486100400530097', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2248, NULL, NULL, NULL, 'AHMAD FAUZAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7439', NULL, NULL, NULL, '857461033', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1295, 0, 1, 0, '486100400530138', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2249, NULL, NULL, NULL, 'RIONALDI ADIGUNA JAYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7440', NULL, NULL, NULL, '857461034', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1296, 0, 1, 0, '486100400530263', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2250, NULL, NULL, NULL, 'M. TRI ARYA WIJAYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7441', NULL, NULL, NULL, '857461035', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1297, 0, 1, 0, '486100400530072', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2251, NULL, NULL, NULL, 'MUHAMMAD ZAINI HAFIDZ', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7442', NULL, NULL, NULL, '857461036', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1298, 0, 1, 0, '486100400530132', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2252, NULL, NULL, NULL, 'MUHAMMAD REZVI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7443', NULL, NULL, NULL, '857461037', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1299, 0, 1, 0, '486100400530074', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2253, NULL, NULL, NULL, 'MUHAMAD FAZZA CAESA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7444', NULL, NULL, NULL, '857461038', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1300, 0, 1, 0, '486100400530038', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2254, NULL, NULL, NULL, 'GISHA SEFTIASA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7445', NULL, NULL, NULL, '857461039', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1301, 0, 1, 0, '486100400530146', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2255, NULL, NULL, NULL, 'MUHAMMAD ZAKY YASIN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7446', NULL, NULL, NULL, '857461040', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1302, 0, 1, 0, '486100400530103', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2256, NULL, NULL, NULL, 'MUHAMMAD FAUZI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7447', NULL, NULL, NULL, '857461041', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1303, 0, 1, 0, '486100400530253', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2257, NULL, NULL, NULL, 'JON LIE BULANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7448', NULL, NULL, NULL, '857461042', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1304, 0, 1, 0, '486100400530050', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2258, NULL, NULL, NULL, 'MUHAMMAD NORRIZKY MAULANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7449', NULL, NULL, NULL, '857461043', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1305, 0, 1, 0, '486100400530078', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2259, NULL, NULL, NULL, 'M. HAFIANNAZIL', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7450', NULL, NULL, NULL, '857461044', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1306, 0, 1, 0, '486100400530063', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2260, NULL, NULL, NULL, 'MUHAMMAD NAUFAL BAGASYAPUTRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7451', NULL, NULL, NULL, '857461045', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1307, 0, 1, 0, '486100400530065', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2261, NULL, NULL, NULL, 'PAHRUL', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7452', NULL, NULL, NULL, '857461046', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1308, 0, 1, 0, '486100400530126', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2262, NULL, NULL, NULL, 'PERDIANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7453', NULL, NULL, NULL, '857461047', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1309, 0, 1, 0, '486100400530217', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2263, NULL, NULL, NULL, 'M.RAFLI JULIANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7454', NULL, NULL, NULL, '857461048', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1310, 0, 1, 0, '486100400530170', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2264, NULL, NULL, NULL, 'SEVIRA ARMALIA NINGRUM', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7455', NULL, NULL, NULL, '857461049', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1311, 0, 1, 0, '486104400530005', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2265, NULL, NULL, NULL, 'RIANSYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7456', NULL, NULL, NULL, '857461050', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1312, 0, 1, 0, '486104400530021', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2266, NULL, NULL, NULL, 'RONI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7457', NULL, NULL, NULL, '857461051', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1313, 0, 1, 0, '486104400530010', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2267, NULL, NULL, NULL, 'ANDIKA JAYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7458', NULL, NULL, NULL, '857461052', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1314, 0, 1, 0, '486104400530004', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2268, NULL, NULL, NULL, 'M. ARIEF SETYAWAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7459', NULL, NULL, NULL, '857461053', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1315, 0, 1, 0, '486106400530008', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2269, NULL, NULL, NULL, 'MUHAMMAD ANANG SHAHIB', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7460', NULL, NULL, NULL, '857461054', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1316, 0, 1, 0, '486106400530007', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2270, NULL, NULL, NULL, 'SURIADI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7461', NULL, NULL, NULL, '857461055', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1317, 0, 1, 0, '486106400530002', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2271, NULL, NULL, NULL, 'M.WAHYUDI RAHMAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7462', NULL, NULL, NULL, '857461056', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1318, 0, 1, 0, '486106400530001', NULL, '2', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2272, NULL, NULL, NULL, 'M. RIZKY FITRAYA AZIS', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7463', NULL, NULL, NULL, '857461057', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1319, 0, 1, 0, '486100400530066', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2273, NULL, NULL, NULL, 'HAFSHAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7464', NULL, NULL, NULL, '857461058', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1320, 0, 1, 0, '486100400530070', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2274, NULL, NULL, NULL, 'ROSMA HELDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7465', NULL, NULL, NULL, '857461059', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1321, 0, 1, 0, '486100400530044', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2275, NULL, NULL, NULL, 'ULAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7466', NULL, NULL, NULL, '857461060', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1322, 0, 1, 0, '486100400530192', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2276, NULL, NULL, NULL, 'SYAIDATUN NAFISAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7467', NULL, NULL, NULL, '857461061', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1323, 0, 1, 0, '486100400530048', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2277, NULL, NULL, NULL, 'NOVA INAYATUL FIKRIYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7468', NULL, NULL, NULL, '857461062', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1324, 0, 1, 0, '486100400530231', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2278, NULL, NULL, NULL, 'YOLA PRATIWI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7469', NULL, NULL, NULL, '857461063', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1325, 0, 1, 0, '486100400530025', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2279, NULL, NULL, NULL, 'PUTRI RAMADANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7470', NULL, NULL, NULL, '857461064', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1326, 0, 1, 0, '486100400530082', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2280, NULL, NULL, NULL, 'M.SYA\'BAN NUR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7471', NULL, NULL, NULL, '857461065', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1327, 0, 1, 0, '486100400530220', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2281, NULL, NULL, NULL, 'NUR RABIATUL ASSIFA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7472', NULL, NULL, NULL, '857461066', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1328, 0, 1, 0, '486100400530191', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2282, NULL, NULL, NULL, 'DEWI ISYANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7473', NULL, NULL, NULL, '857461067', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1329, 0, 1, 0, '486100400530202', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2283, NULL, NULL, NULL, 'AIRYN DAKKE D.', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7474', NULL, NULL, NULL, '857461068', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1330, 0, 1, 0, '486100400530096', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2284, NULL, NULL, NULL, 'NOR RIZQA ASSYIFA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7475', NULL, NULL, NULL, '857461069', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1331, 0, 1, 0, '486100400530012', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2285, NULL, NULL, NULL, 'GAIRA LIANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7476', NULL, NULL, NULL, '857461070', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1332, 0, 1, 0, '486100400530056', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2286, NULL, NULL, NULL, 'FITRIYANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7477', NULL, NULL, NULL, '857461071', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1333, 0, 1, 0, '486100400530140', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2287, NULL, NULL, NULL, 'SEPTI AULIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7478', NULL, NULL, NULL, '857461072', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1334, 0, 1, 0, '486100400530166', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2288, NULL, NULL, NULL, 'HERNIDA FANISHA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7479', NULL, NULL, NULL, '857461073', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1335, 0, 1, 0, '486100400530104', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2289, NULL, NULL, NULL, 'MUHAMMAD FATHIR ALBADALI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7480', NULL, NULL, NULL, '857461074', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1336, 0, 1, 0, '486100400530155', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2290, NULL, NULL, NULL, 'RAHMAWATI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7481', NULL, NULL, NULL, '857461075', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1337, 0, 1, 0, '486100400530152', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2291, NULL, NULL, NULL, 'AULIA AZIZAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7482', NULL, NULL, NULL, '857461076', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1338, 0, 1, 0, '486100400530003', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2292, NULL, NULL, NULL, 'FITRIA INDRIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7483', NULL, NULL, NULL, '857461077', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1339, 0, 1, 0, '486100400530211', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2293, NULL, NULL, NULL, 'ZAJKIA NUR AFIFAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7484', NULL, NULL, NULL, '857461078', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1340, 0, 1, 0, '486100400530055', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2294, NULL, NULL, NULL, 'NAZWA MAULIA MAHFUD', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7485', NULL, NULL, NULL, '857461079', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1341, 0, 1, 0, '486100400530018', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2295, NULL, NULL, NULL, 'SITI NUR HAPSAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7486', NULL, NULL, NULL, '857461080', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1342, 0, 1, 0, '486100400530115', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2296, NULL, NULL, NULL, 'NAJWA DAIVA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7487', NULL, NULL, NULL, '857461081', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1343, 0, 1, 0, '486100400530149', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2297, NULL, NULL, NULL, 'RAHMA ALIYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7488', NULL, NULL, NULL, '857461082', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1344, 0, 1, 0, '486100400530174', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2298, NULL, NULL, NULL, 'EFA ALFIYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7489', NULL, NULL, NULL, '857461083', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1345, 0, 1, 0, '486100400530197', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2299, NULL, NULL, NULL, 'SOPIAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7490', NULL, NULL, NULL, '857461084', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1346, 0, 1, 0, '486100400530085', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2300, NULL, NULL, NULL, 'ALYA DWI RATNA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7491', NULL, NULL, NULL, '857461085', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1347, 0, 1, 0, '486100400530145', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2301, NULL, NULL, NULL, 'JAHRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7492', NULL, NULL, NULL, '857461086', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1348, 0, 1, 0, '486100400530260', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2302, NULL, NULL, NULL, 'MIRNA WULANDARI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7493', NULL, NULL, NULL, '857461087', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1349, 0, 1, 0, '486100400530160', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2303, NULL, NULL, NULL, 'NOVYLA HAQQINA FITRAHAINI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7494', NULL, NULL, NULL, '857461088', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1350, 0, 1, 0, '486100400530020', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2304, NULL, NULL, NULL, 'ASNIANDAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7495', NULL, NULL, NULL, '857461089', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1351, 0, 1, 0, '486100400530028', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2305, NULL, NULL, NULL, 'MUHAMMAD RAHMAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7496', NULL, NULL, NULL, '857461090', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1352, 0, 1, 0, '486100400530058', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2306, NULL, NULL, NULL, 'ADELIA HAYA SAHIRAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7497', NULL, NULL, NULL, '857461091', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1353, 0, 1, 0, '486100400530017', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2307, NULL, NULL, NULL, 'SINDI AULIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7498', NULL, NULL, NULL, '857461092', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1354, 0, 1, 0, '486100400530106', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2308, NULL, NULL, NULL, 'HAZIZA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7499', NULL, NULL, NULL, '857461093', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1355, 0, 1, 0, '486100400530142', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2309, NULL, NULL, NULL, 'SHEILA BINTANG MEYLANIE', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7500', NULL, NULL, NULL, '857461094', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1356, 0, 1, 0, '486100400530039', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2310, NULL, NULL, NULL, 'FERMELI EFIYONA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7501', NULL, NULL, NULL, '857461095', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1357, 0, 1, 0, '486100400530154', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2311, NULL, NULL, NULL, 'HIKMAH MAULIDA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7502', NULL, NULL, NULL, '857461096', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1358, 0, 1, 0, '486100400530249', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2312, NULL, NULL, NULL, 'NUR LATHIFAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7503', NULL, NULL, NULL, '857461097', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1359, 0, 1, 0, '486100400530163', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2313, NULL, NULL, NULL, 'MUHAMMAD FERRY ANDHIKA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7504', NULL, NULL, NULL, '857461098', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1360, 0, 1, 0, '486100400530198', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2314, NULL, NULL, NULL, 'MUHAMMAD NAJIB', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7505', NULL, NULL, NULL, '857461099', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1361, 0, 1, 0, '486100400530186', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2315, NULL, NULL, NULL, 'NAESYA MEIDINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7506', NULL, NULL, NULL, '857461100', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1362, 0, 1, 0, '486100400530291', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2316, NULL, NULL, NULL, 'NOR MAYADA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7507', NULL, NULL, NULL, '857461101', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1363, 0, 1, 0, '486100400530118', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2317, NULL, NULL, NULL, 'RAHMAD FAUZAN', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7508', NULL, NULL, NULL, '857461102', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1364, 0, 1, 0, '486100400530209', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2318, NULL, NULL, NULL, 'MUHAMMAD ANSAR', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7509', NULL, NULL, NULL, '857461103', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1365, 0, 1, 0, '486100400530084', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2319, NULL, NULL, NULL, 'RAHMAT DANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7510', NULL, NULL, NULL, '857461104', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1366, 0, 1, 0, '486100400530283', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2320, NULL, NULL, NULL, 'NADIA SALSABILA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7511', NULL, NULL, NULL, '857461105', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1367, 0, 1, 0, '486100400530033', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2321, NULL, NULL, NULL, 'ISMA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7512', NULL, NULL, NULL, '857461106', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1368, 0, 1, 0, '486100400530200', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2322, NULL, NULL, NULL, 'ASRIANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7513', NULL, NULL, NULL, '857461107', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1369, 0, 1, 0, '486100400530111', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2323, NULL, NULL, NULL, 'ANUGERAH OKVA RAMADANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7514', NULL, NULL, NULL, '857461108', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1370, 0, 1, 0, '486100400530268', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2324, NULL, NULL, NULL, 'WIKA PAULINA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7515', NULL, NULL, NULL, '857461109', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1371, 0, 1, 0, '486100400530133', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2325, NULL, NULL, NULL, 'ADELIANOR SOFA FADILA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7516', NULL, NULL, NULL, '857461110', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1372, 0, 1, 0, '486100400530075', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2326, NULL, NULL, NULL, 'MARIA ULFAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7517', NULL, NULL, NULL, '857461111', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1373, 0, 1, 0, '486100400530037', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2327, NULL, NULL, NULL, 'MUHAMMAD AFRIZA MAULANA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7518', NULL, NULL, NULL, '857461112', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1374, 0, 1, 0, '486100400530090', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2328, NULL, NULL, NULL, 'SITI NUR AISYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7519', NULL, NULL, NULL, '857461113', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1375, 0, 1, 0, '486104400530001', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2329, NULL, NULL, NULL, 'NUR ALYA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7520', NULL, NULL, NULL, '857461114', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1376, 0, 1, 0, '486104400530012', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2330, NULL, NULL, NULL, 'HASMIRA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7521', NULL, NULL, NULL, '857461115', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1377, 0, 1, 0, '486104400530019', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2331, NULL, NULL, NULL, 'MIFTAHUL JANAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7522', NULL, NULL, NULL, '857461116', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1378, 0, 1, 0, '486104400530002', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2332, NULL, NULL, NULL, 'ARBAYAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7523', NULL, NULL, NULL, '857461117', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1379, 0, 1, 0, '486104400530003', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2333, NULL, NULL, NULL, 'RENA NOVITA SARI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7524', NULL, NULL, NULL, '857461118', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1380, 0, 1, 0, '486104400530007', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2334, NULL, NULL, NULL, 'NURENI LATIFAH', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7525', NULL, NULL, NULL, '857461119', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1381, 0, 1, 0, '486106400530005', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2335, NULL, NULL, NULL, 'MELINDA DWI CAHYANI', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7526', NULL, NULL, NULL, '857461120', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');
INSERT INTO `students` (`id`, `major_id`, `first_choice_id`, `second_choice_id`, `registration_number`, `admission_exam_number`, `selection_result`, `admission_phase_id`, `admission_type_id`, `photo`, `achievement`, `is_student`, `is_prospective_student`, `is_alumni`, `is_transfer`, `re_registration`, `start_date`, `identity_number`, `nisn`, `nik`, `nkk`, `no_akta`, `prev_exam_number`, `prev_diploma_number`, `paud`, `tk`, `skhun`, `prev_school_name`, `tahun_lulus`, `prev_school_address`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion_id`, `special_need_id`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence_id`, `transportation_id`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `nik_father`, `father_birth_year`, `father_education_id`, `father_employment_id`, `father_monthly_income_id`, `father_special_need_id`, `phone_father`, `mother_name`, `nik_mother`, `mother_birth_year`, `mother_education_id`, `mother_employment_id`, `mother_monthly_income_id`, `mother_special_need_id`, `phone_mother`, `guardian_name`, `nik_guardian`, `guardian_birth_year`, `guardian_education_id`, `guardian_employment_id`, `guardian_monthly_income_id`, `phone_guardian`, `address_parent`, `mileage`, `traveling_time`, `height`, `weight`, `lingkar_kpl`, `bhs_indo`, `bhs_inggris`, `mtk`, `ipa`, `photo1`, `bhs_indo2`, `bhs_inggris2`, `mtk2`, `ipa2`, `photo2`, `bhs_indo3`, `bhs_inggris3`, `mtk3`, `ipa3`, `photo3`, `photo_kk`, `photo_akta`, `sibling_number`, `anak_ke`, `student_status_id`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1382, 0, 1, 0, '486106400530004', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2336, NULL, NULL, NULL, 'NABILA NUR A\'SYIFA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7527', NULL, NULL, NULL, '857461121', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false'),
(1383, 0, 1, 0, '486100400530265', NULL, '9', 0, 170, '6cba9770252b98ae99f415a759155d37.jpg', NULL, 'false', 'true', 'false', '', 'true', NULL, NULL, '2222', '2222', '2222', '2222', NULL, NULL, NULL, NULL, NULL, 'SMPN 1 Kotabaru', 2337, NULL, NULL, NULL, 'CHELSEA DILA DERIA', 'M', 'Kotabaru', '0000-00-00', 89, 0, 'Jl. Tambak 2 Blok G RT:19 RW: 03, Rumah Paling Ujung Sebelum Masuk Gang Tembusan Nusa Indah', NULL, NULL, NULL, NULL, NULL, 'Kotabaru', '7528', NULL, NULL, NULL, '857461122', NULL, NULL, NULL, NULL, NULL, NULL, 'WNI', NULL, 'HENDRI ARIFIN', '2222', 1990, 0, 0, 0, 0, '85746080544', 'DWI LALA SANTI', '2222', 1988, 0, 0, 0, 0, '85746080544', NULL, NULL, NULL, 0, 0, 0, NULL, 'Kotabaru', 1, 1, 1, 1, 1, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, '1', '1', '1', '1', NULL, NULL, NULL, 3, 1, 0, NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2019-04-01 21:44:36', '2019-04-01 14:44:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2019-04-01 21:44:36', '2019-04-01 14:44:36', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2019-04-01 21:44:36', '2019-04-01 14:44:36', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', 'Hendri Arifin', 'true', '2019-04-01 21:44:36', '2022-06-11 15:30:19', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', 'Hendri Arifin', 'false', '2019-04-01 21:44:36', '2022-06-11 15:30:19', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', 'Hendri Arifin', 'false', '2019-04-01 21:44:36', '2022-06-11 15:29:11', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT '0',
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'administrator', '$2y$10$Hl/1NdST2su5X.I3EoBklu7/ptF67YMoRUB1Gze.kv7dHABzCLQD.', 'Administrator', 'admin@admin.com', 'sekolahku.web.id', 0, 'super_user', NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2019-04-01 21:44:35', '2019-04-01 14:44:35', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) DEFAULT '0',
  `module_id` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('eqdvl6obuhvbhcebbku44i63shrvuntq', '::1', 1656600860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635363630303832303b746f6b656e7c733a33323a223838373434353166323936343734326261363337633137306363383563373032223b637372665f746f6b656e7c733a33323a223838373434353166323936343734326261363337633137306363383563373032223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31343a22417369612f53696e6761706f7265223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a33323a2268747470733a2f2f66622e6d652f68656e6472692e61726966696e2e736b6f6d223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a34303a2268747470733a2f2f696e7374616772616d2e636f6d2f68656e6472692e61726966696e2e736b6f6d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a32313a22534d4b204e65676572692031204b6f746162617275223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2234223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a333a22313036223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031392d30342d3031223b7461676c696e657c733a36303a22496c6d7520616b616e206d656e6a6164696b616e206b697461206d656d696c696b6920646572616a61742079616e67206c656269682074696e676769223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a32363a224a616c616e2052617961204b61647567656465204e6f2e203131223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a33363a2233326638636334663263653434353833356438613034363539643930613461362e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303231223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032322d30362d3037223b61646d697373696f6e5f656e645f646174657c733a31303a22323032322d30362d3231223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032322d30362d3239223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032322d30372d3033223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a31363a2250726f6772616d204b6561686c69616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a313b757365725f69647c733a313a2231223b757365725f6e616d657c733a31333a2261646d696e6973747261746f72223b757365725f66756c6c5f6e616d657c733a31333a2241646d696e6973747261746f72223b757365725f747970657c733a31303a2273757065725f75736572223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a353a227573657273223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2261636164656d6963223b693a31333b733a373a2270726f66696c65223b7d726567697374726174696f6e5f6e756d6265727c733a31303a2232303230303030303032223b),
('gc907lq4hq1kmnapqfb1euhpo44k9v41', '::1', 1656600872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635363630303836383b746f6b656e7c733a33323a226336383536306165656233623465396139353366393637353863646635343432223b637372665f746f6b656e7c733a33323a226336383536306165656233623465396139353366393637353863646635343432223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31343a22417369612f53696e6761706f7265223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a33323a2268747470733a2f2f66622e6d652f68656e6472692e61726966696e2e736b6f6d223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a34303a2268747470733a2f2f696e7374616772616d2e636f6d2f68656e6472692e61726966696e2e736b6f6d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a32313a22534d4b204e65676572692031204b6f746162617275223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2234223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a333a22313036223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031392d30342d3031223b7461676c696e657c733a36303a22496c6d7520616b616e206d656e6a6164696b616e206b697461206d656d696c696b6920646572616a61742079616e67206c656269682074696e676769223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a32363a224a616c616e2052617961204b61647567656465204e6f2e203131223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a33363a2233326638636334663263653434353833356438613034363539643930613461362e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303231223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032322d30362d3037223b61646d697373696f6e5f656e645f646174657c733a31303a22323032322d30362d3231223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032322d30362d3239223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032322d30372d3033223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a31363a2250726f6772616d204b6561686c69616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a313b),
('rcdl5a1ul7a1o8ccnaus5djok2rkksp0', '::1', 1656645106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635363634353130343b746f6b656e7c733a33323a226264653933333962363734373463633138633237363463326164376135393962223b637372665f746f6b656e7c733a33323a226264653933333962363734373463633138633237363463326164376135393962223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31343a22417369612f53696e6761706f7265223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a33323a2268747470733a2f2f66622e6d652f68656e6472692e61726966696e2e736b6f6d223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a34303a2268747470733a2f2f696e7374616772616d2e636f6d2f68656e6472692e61726966696e2e736b6f6d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a32313a22534d4b204e65676572692031204b6f746162617275223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2234223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a333a22313036223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031392d30342d3031223b7461676c696e657c733a36303a22496c6d7520616b616e206d656e6a6164696b616e206b697461206d656d696c696b6920646572616a61742079616e67206c656269682074696e676769223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a32363a224a616c616e2052617961204b61647567656465204e6f2e203131223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a33363a2233326638636334663263653434353833356438613034363539643930613461362e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303231223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032322d30362d3037223b61646d697373696f6e5f656e645f646174657c733a31303a22323032322d30362d3231223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032322d30362d3239223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032322d30372d3033223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a31363a2250726f6772616d204b6561686c69616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a313b),
('0qbeut6cki0ljio9r8qicq6v4ql2n4h2', '::1', 1656719841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313635363731393833393b746f6b656e7c733a33323a223138346531333965376533336335343964366638656532623461386135303962223b637372665f746f6b656e7c733a33323a223138346531333965376533336335343964366638656532623461386135303962223b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a615379446d69796346787a595a3337464f774134777153624c337a325976495949417277223b6c617469747564657c733a31303a222d362e32343037333131223b6c6f6e6769747564657c733a31313a223130362e39393732383932223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31343a22417369612f53696e6761706f7265223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a33323a2268747470733a2f2f66622e6d652f68656e6472692e61726966696e2e736b6f6d223b747769747465727c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a34303a2268747470733a2f2f696e7374616772616d2e636f6d2f68656e6472692e61726966696e2e736b6f6d223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a36393a2253472e7337614c476977725464695a6c4146724a4f425939512e6370676d765a5833625250377649786f71775553764d6c38733132394d41467a43794458694c77616e7373223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a32313a22534d4b204e65676572692031204b6f746162617275223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2234223b7363686f6f6c5f7374617475737c733a313a2231223b6f776e6572736869705f7374617475737c733a333a22313036223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031392d30342d3031223b7461676c696e657c733a36303a22496c6d7520616b616e206d656e6a6164696b616e206b697461206d656d696c696b6920646572616a61742079616e67206c656269682074696e676769223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a32363a224a616c616e2052617961204b61647567656465204e6f2e203131223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a33363a2233326638636334663263653434353833356438613034363539643930613461362e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303231223b61646d697373696f6e5f73746172745f646174657c733a31303a22323032322d30362d3037223b61646d697373696f6e5f656e645f646174657c733a31303a22323032322d30362d3231223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323032322d30362d3239223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323032322d30372d3033223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a31363a2250726f6772616d204b6561686c69616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a393a22736b795f6c69676874223b61646d697373696f6e5f73656d65737465725f69647c733a313a2231223b61646d697373696f6e5f73656d65737465727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f796561725f69647c733a313a2231223b63757272656e745f61636164656d69635f796561727c733a393a22323032312d32303232223b63757272656e745f61636164656d69635f73656d65737465727c733a333a226f6464223b6d616a6f725f636f756e747c623a313b);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `admission_phases`
--
ALTER TABLE `admission_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`),
  ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indexes for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`),
  ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indexes for table `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indexes for table `class_group_students`
--
ALTER TABLE `class_group_students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`),
  ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE,
  ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_nik__idx` (`nik`) USING BTREE,
  ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `employees_email__idx` (`email`) USING BTREE,
  ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE,
  ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE,
  ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE,
  ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE,
  ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE,
  ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE,
  ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE,
  ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE,
  ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE,
  ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indexes for table `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawabantes`
--
ALTER TABLE `jawabantes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelulusan`
--
ALTER TABLE `kelulusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`),
  ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE,
  ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE,
  ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE,
  ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admission_phases`
--
ALTER TABLE `admission_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_group_students`
--
ALTER TABLE `class_group_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jawabantes`
--
ALTER TABLE `jawabantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelulusan`
--
ALTER TABLE `kelulusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1384;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
