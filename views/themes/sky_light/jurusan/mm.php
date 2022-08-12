<div class="jurusan-mm p-3 mt-2">
    <div class="p-3 border border-white rounded-3" style="color: #1770aa">
        <h3 class="fw-bold" style="padding-top: 150px">DKV</h3>
        <h3 class="fw-bold">Desain Komunikasi Visual</h3>
    </div>
</div>
<div class="p-3 my-2 bg-white">
    <p class="text-center">Sebenarnya ada banyak karya DKV yang kita nikmati dalam kehidupan sehari-hari. Did you even realize it, Sobat? Iklan di media elektronik maupun cetak merupakan salah satu contoh Desain Komunikasi Visual. Poster, katalog, animasi, brosur, hingga kemasan produk juga merupakan contoh Desain Komunikasi Visual yang dapat dengan mudah kita jumpai</p>
    <div class="card border-start border-dark border-5">
        <div class="card-body">
            <h4>Sekilas Program Keahlian DKV</h4>
            <p>Sebagai siswa DKV, Sobat  bakal menguasai banyak software, seperti Adobe Illustrator, Adobe Premier, Adobe Photoshop, Adobe InDesign, SketchUp, CorelDraw, dan lain-lain. Dan jika dunia desain memang menjadi minatmu, yakin deh, Sobat takkan kehilangan semangat untuk bekerja di bidang yang penuh tantangan ini.</p>
        </div>
    </div>
</div>
<div class="p-3 mb-2">
	<h5 class="border-start border-5 border-warning px-2 mb-3">Kegiatan Jurusan</h5>
    <div class="row g-1">
        <?php
            foreach (new DirectoryIterator('media_library/images/kegiatan/mm') as $file) {
                if($file->isDot()) continue;
                echo '<div class="col-4 mb-1">';
                echo '<a href="media_library/images/kegiatan/mm/'.$file->getFilename().'" target="_blank" class="text-decoration-none">';
                echo '<img src="media_library/images/kegiatan/mm/'.$file->getFilename().'" class="img-fluid">';
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
                Skill lulusan DKV
            </button>
            </h2>
            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
            <div class="accordion-body">
                Melalu jurusan dkv kamu akan mendapatkan skill seni dan desain, kamu juga akan mengerti tentang fotografi dan cinematografi, kamu juga akan bisa membuat animasi dan game.
            </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                Pekerjaan jika lulus
            </button>
            </h2>
            <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
            <div class="accordion-body">
                Setelah lulus kamu bisa menjadi ilustrator, fotografer, videografer, animator, art director, animator, Aparatur sipil negara, bahkan kamu bisa membuka wirausaha mandiri dengan skill kamu.
            </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    Lanjut kuliah dijurusan apa?
                </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                <div class="accordion-body">
                    Jika kamu ingit melanjut kuliah kamu bisa memilih semua jurusan karena lulusan DKV setara dengan jurusan IPA pada SMA
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    Sarana Lab dan Komputer
                </button>
            </h2>
            <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                <div class="accordion-body">
                    <ol type="1">
                        <li>PC editing dengan spesifikasi mumpuni</li>
                        <li>Kamera Foto dan Video</li>
                        <li>Ruang AC</li>
                        <li>WIFI</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>