<?php

use App\Models\Menu_model;

$menu    = new Menu_model();
$berita  = $menu->berita();
$profil  = $menu->profil();
$layanan = $menu->layanan();
?>

<!-- ======= Hero Section ======= -->
<section id="hero">
  <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

    <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

    <div class="carousel-inner" role="listbox">
      <?php $noslide = 1;

      foreach ($slider as $slider) {  ?>
        <!-- Slide 1 -->
        <div class="carousel-item<?php if ($noslide === 1) {
                                    echo ' active';
                                  } ?>" style="background-image: url(<?= base_url('assets/upload/image/' . $slider['gambar']) ?>)">
          <?php if ($slider['status_text'] === 'Ya') {  ?>
            <div class="container" style="max-width: 70%; text-align: left; padding-left: 2%; padding-right: 2%;">
              <h2><?= $slider['judul_galeri'] ?></h2>
              <p><?= $slider['isi'] ?></p>
              <a href="<?= $slider['website'] ?>" class="btn-get-started scrollto">Read More</a>
            </div>
          <?php } ?>
        </div>
      <?php $noslide++;
      } ?>

    </div>

    <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
      <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
    </a>

    <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
      <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
    </a>

  </div>
</section><!-- End Hero -->


<main id="main">

  <!-- ======= Featured Services Section ======= -->
  <section id="featured-services" class="featured-services">
    <div class="container" data-aos="fade-up">

      <div class="row">
        <?php $pr = 1;

        foreach ($profil as $profil) { ?>
          <div class="col-md-6 col-lg-4 text-center d-flex align-items-stretch mb-5 mb-lg-0">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="<?= $pr ?>00">
              <div class="icon"><i class="<?= $profil['icon'] ?>"></i></div>
              <h4 class="title"><a href="<?= base_url('berita/profil/' . $profil['slug_berita']) ?>"><?= $profil['judul_berita'] ?></a></h4>
              <p class="description"><?= $profil['ringkasan'] ?></p>
            </div>
          </div>
        <?php $pr++;
        } ?>
      </div>
    </div>
  </section><!-- End Featured Services Section -->

  <!-- ======= Cta Section ======= -->
  <section id="cta" class="cta">
    <div class="container" data-aos="zoom-in">

      <div class="text-center">
        <h3>Selamat datang di <?= $konfigurasi['namaweb'] ?></h3>
        <p><?= $konfigurasi['tagline'] ?></p>
      </div>

    </div>
  </section><!-- End Cta Section -->

  <!-- ======= About Us Section ======= -->
  <section id="about" class="about">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>About <?= $konfigurasi['namaweb'] ?></h2>
        <?= $konfigurasi['deskripsi'] ?>
      </div>

      <div class="row">
        <div class="col-lg-4" data-aos="fade-right">
          <img src="<?= icon() ?>" class="img-fluid" alt="">
        </div>
        <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
          <?= $konfigurasi['tentang'] ?>
        </div>
      </div>

    </div>
  </section><!-- End About Us Section -->



  <!-- ======= Services Section ======= -->
  <section id="services" class="services services">
    <div class="container" data-aos="fade-up">

      <div class="section-title">
        <h2>Layanan Kami</h2>
        <p> <?= namaweb() ?>. <?= tagline() ?></p>
      </div>

      <div class="row">
        <?php $ml = 1;

        foreach ($layanan as $layanan) : ?>
          <div class="col-lg-4 col-md-6 icon-box" data-aos="zoom-in" data-aos-delay="<?= $ml; ?>00">
            <div class="icon"><i class="<?= $layanan['icon'] ?>"></i></div>
            <h4 class="title"><a href="<?= base_url('berita/layanan/' . $layanan['slug_berita']) ?>"><?= $layanan['judul_berita'] ?></a></h4>
            <p class="description"><?= $layanan['ringkasan'] ?></p>
          </div>
        <?php $ml++;
        endforeach ?>
      </div>

    </div>
  </section><!-- End Services Section -->

  <?php include 'berita.php' ?>

  <!-- ======= Contact Section ======= -->
  <section id="contact" class="contact">
    <div>
      <style type="text/css" media="screen">
        iframe {
          min-height: 300px;
          width: 100%;
        }
      </style>
      <?= google_map() ?>
    </div>
  </section><!-- End Contact Section -->
</main><!-- End #main -->