<div class="bg-white p-3 my-2">
    <h5 class="border-start border-5 border-warning px-2 mb-3">Kalendar Akademik</h5>
    <?php
        foreach (new DirectoryIterator('assets/img/kalendar') as $file) {
            if($file->isDot()) continue;
            // print $file->getFilename() . '<br>';
            echo '<img src="assets/img/kalendar/'.$file->getFilename().'" class="img-fluid mb-3">';
        }
    ?>
</div>