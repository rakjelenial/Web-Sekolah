<html>
    <title></title>
    <style>
        .kembali{
            background-color: red;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 20px;
            cursor: pointer;
            text-decoration: none;
        }
        .kembali:hover {
            background-color: #CA0707;
        }
        .cetak {
            background-color: green;
            color: #fff;
            border: none;
            padding: 10px 30px;
            margin-bottom: 20px;
            font-size: 20px;
            cursor: pointer;
        }
        .cetak:hover {
            background-color: #19c81f;
        }
        @media print {
        #tombol {
            display: none;
            }
        }
    </style>
    <body>
<?php
    $CI = &get_instance();
?>
<div id="tombol">
    <a href="<?=base_url('admission/registrants/')?>" class="kembali">Kembali</a>
    <input type="button" value="Print" class="cetak" onclick="printContent('cetak');">
</div>
<div id="cetak">
    <table width="100%" border="0" cellpadding="3" cellspacing="0" style="border-bottom:1px solid #000000;">
        <tbody>
            <tr>
                <td width="20%" align="center" valign="top">
                    <img src="<?=base_url('media_library/images/'.$CI->session->logo)?>" width="90px">
                </td>
                <td width="80%" valign="top" align="left" valign="center">
                    <h1 style="margin:0;padding:0;"><?=$CI->session->school_name?></h1>
                    <p><?=$CI->session->street_address?><br>
                    Telp : <?=$CI->session->phone?> &sdot; Fax : <?=$CI->session->fax?> &sdot; Kode Pos : <?=$CI->session->postal_code?><br>
                    Email : <?=$CI->session->email?> &sdot; Website : <?=str_replace(['http://', 'https://', 'www.'], '', $CI->session->website)?></p>
                </td>
            </tr>
        </tbody>
    </table>
    <h3><?=$CI->session->_student.' Baru Tahun '.$CI->session->admission_year?></h3>
    <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <tbody>
        <tr>
            <td colspan="3" align="left"><h3>Registrasi <?=$CI->session->school_level >= 5 ? 'Calon Mahasiswa' : 'Calon Peserta Didik'?></h3></td>
        </tr>
        <tr>
            <td width="35%" align="right">Nomor Pendaftaran</td>
            <td width="5%"  align="center">:</td>
            <td width="60%" align="left"><?=$data['registration_number']?></td>
        </tr>
        <tr>
            <td align="right">Tanggal Pendaftaran</td>
            <td align="center">:</td>
            <td align="left"><?=$data['created_at']?></td>
        </tr>
        <tr><td align="right">Pilihan Jurusan</td><td align="center">:</td><td align="left"><?=$data['first_choice']?></td></tr>
        <tr>
            <td align="right">Nama Lengkap</td>
            <td align="center">:</td>
            <td align="left"><?=$data['full_name']?></td>
        </tr>
        <tr>
            <td align="right">Tempat Tanggal Lahir</td>
            <td align="center">:</td>
            <td align="left"><?=$data['birth_place']?>, <?=indo_date($data['birth_date'])?></td>
        </tr>
        <tr><td align="right">NISN</td><td align="center">:</td><td align="left"><?=$data['nisn']?></td></tr>
        <tr>
            <td align="right">Nama Sekolah Asal</td>
            <td align="center">:</td>
            <td align="left"><?=$data['prev_school_name']?></td>
        </tr>
        <tr style="font-weight:bold;">
            <td width="35%" align="right">Username</td>
            <td width="5%"  align="center">:</td>
            <td width="60%" align="left"><?=$data['username']?></td>
        </tr>
        <tr style="font-weight:bold;">
            <td width="35%" align="right">Password</td>
            <td width="5%"  align="center">:</td>
            <td width="60%" align="left"><?=$data['password']?></td>
        </tr>
        <tr>
            <td colspan="3"></td>
        </tr>
        </tbody>
    </table>
    <table width="100%" cellpadding="3" cellspacing="0" border="0" style="border-bottom:1px dashed #a5a5a5; padding-bottom: 30px; margin-bottom: 20px">
        <tbody>
        <!-- <tr>
            <td align="left">Saya yang bertandatangan dibawah ini menyatakan bahwa data yang tertera diatas adalah yang sebenarnya.</td>
        </tr> -->
        <tr><td></td></tr>
        <tr align="left">
            <td align="right">
                <p><?=/*$data['district'].*/'Kotabaru, '. indo_date(substr($data['created_at'], 0, 10))?></p>
                <br><br><br><br>
                <p><?=$CI->session->user_name?></p>
        </td>
        </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellpadding="3" cellspacing="0" style="border-bottom:1px dashed #a5a5a5; padding-bottom:30px; margin-bottom: 20px;">
        <tbody>
        <tr>
            <td colspan="3" align="left"><h3>Registrasi <?=$CI->session->school_level >= 5 ? 'Calon Mahasiswa' : 'Calon Peserta Didik'?></h3></td>
        </tr>
        <tr>
            <td width="35%" align="right">Nomor Pendaftaran</td>
            <td width="5%"  align="center">:</td>
            <td width="60%" align="left"><?=$data['registration_number']?></td>
        </tr>
        <tr>
            <td align="right">Tanggal Pendaftaran</td>
            <td align="center">:</td>
            <td align="left"><?=$data['created_at']?></td>
        </tr>
        <tr><td align="right">Pilihan Jurusan</td><td align="center">:</td><td align="left"><?=$data['first_choice']?></td></tr>
        <tr>
            <td align="right">Nama Lengkap</td>
            <td align="center">:</td>
            <td align="left"><?=$data['full_name']?></td>
        </tr>
        <tr>
            <td align="right">Tempat Tanggal Lahir</td>
            <td align="center">:</td>
            <td align="left"><?=$data['birth_place']?>, <?=indo_date($data['birth_date'])?></td>
        </tr>
        <tr><td align="right">NISN</td><td align="center">:</td><td align="left"><?=$data['nisn']?></td></tr>
        <tr>
            <td align="right">Nama Sekolah Asal</td>
            <td align="center">:</td>
            <td align="left"><?=$data['prev_school_name']?></td>
        </tr>
        <tr>
            <td colspan="3"></td>
        </tr>
        </tbody>
    </table>
</div>
<script>
var restorepage = document.body.innerHTML;
var printcontent = document.getElementById('cetak').innerHTML;
document.body.innerHTML = printcontent;
// window.print();
document.body.innerHTML = restorepage;

function printContent(el){
    var restorepage = document.body.innerHTML;
    var printcontent = document.getElementById(el).innerHTML;
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorepage;
}
</script>

</body>
</html>