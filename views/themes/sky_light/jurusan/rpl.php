<div class="jurusan-rpl p-3 mt-2">
    <div class="p-3 border border-white rounded-3 text-white">
        <h3 class="fw-bold">PPLG</h3>
        <h3 class="fw-bold" style="padding-bottom: 150px">Pengembangan Perangkat Lunak dan GIM</h3>
    </div>
</div>
<div class="p-3 my-2 bg-white">
    <p class="text-center">Orang kira aku hacker, duduk seharian di depan komputer, padahal aku sedang membuat game android, aplikasi website dan sistem permintaan pelanggan. Setelah banyak yang tahu, mereka bilang aku ahli IT / Programmer yang bisa menyelesaikan masalah dengan teknologi</p>
    <div class="card border-start border-dark border-5">
        <div class="card-body">
            <h4>Sekilas Program Keahlian PPLG</h4>
            <p>PPLG ( Pengembangan Perangkat Lunak dan GIM ) merupakan jurusan yang sebelumnya bernama RPL ( Rekayasa Perangkat Lunak ). Perubahan ini dikarenakan ditunjuknya SMKN 1 Kotabaru menjadi sekolah Pusat Keunggulan sehingga Kurikulum kelas X mengikuti peraturan yang ada. PPLG berfokus pada keahlian siswa/siswi dalam hal software/program WEB, komputer dan android, selain itu siswa/siswi juga diberikan ilmu umum tentang hardware, multimedia, kewirausahaan.</p>
        </div>
    </div>
</div>
<div class="p-3 mb-2">
	<h5 class="border-start border-5 border-warning px-2 mb-3">Kegiatan Jurusan</h5>
    <div class="row g-1">
        <?php
            foreach (new DirectoryIterator('media_library/images/kegiatan/rpl') as $file) {
                if($file->isDot()) continue;
                echo '<div class="col-4 mb-1">';
                echo '<a href="media_library/images/kegiatan/rpl/'.$file->getFilename().'" target="_blank" class="text-decoration-none">';
                echo '<img src="media_library/images/kegiatan/rpl/'.$file->getFilename().'" class="img-fluid">';
                echo '</a>';
                echo '</div>';
            }
        ?>
    </div>
</div>
<div class="bg-white pt-3">
	<h5 class="border-start border-5 border-warning px-2 mb-3 mx-3">Pertanyaan Seputar PPLG</h5>
    <div class="accordion accordion-flush" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                Kemampuan Apa yang akan dimiliki Lulusan PPLG
            </button>
            </h2>
            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
            <div class="accordion-body">
                Lulusan PPLG memiliki kemampuan di bidang Programer, baik Program Komputer ( JAVA, Bahasa C, Python ) Program Android ( Membuat aplikasi dan GAME android ) Programer WEB ( HTML, PHP )
            </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                Kalau lulus bisa kerja apa ?
            </button>
            </h2>
            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
            <div class="accordion-body">
                Lulusan PPLG bisa kerja disegala bidang. Bisa menjadi Programer di Perusahaan, kantor, membuka jasa freelance dibidang IT, membuat StartUp baru ( Aplikasi anrdroid ) , Berwirausaha dengan menerapkan IT dibidangnya. Peluang kedepan akan banyak dibutuhkan tenaga IT karena perkembangan IT tidak pernah berhenti.
            </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                Apa bisa dari SMK kuliah ?
            </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
            <div class="accordion-body">
                Sangat bisa, kemampuan siswa SMK dalam kuliah dipandang setara dengan Program IPA di SMA, sehingga bisa mendaftar kuliah di Universitas Negeri / Swasta , jika cross jurusan bisa mendaftar dengan metode IPC. Banyak lulusan dari program RPL melanjutkan kuliah di Jurusan Teknologi
            </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                Sarana Laboratorium Komputer PPLG
            </button>
            </h2>
            <div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
            <div class="accordion-body">
                <ol type="1">
                    <li>Setiap Siswa/Siswi 1 Komputer</li>
                    <li>Alat Praktik</li>
                    <li>Ruang AC</li>
                    <li>WIFI</li>
                </ol>
            </div>
            </div>
        </div>
    </div>
</div>