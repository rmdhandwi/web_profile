<?php

namespace App\Controllers\Admin;

use App\Models\Galeri_model;
use App\Models\Kategori_galeri_model;

class Galeri extends BaseController
{
    // index
    public function index()
    {
        checklogin();
        $m_galeri          = new Galeri_model();
        $m_kategori_galeri = new Kategori_galeri_model();
        $galeri            = $m_galeri->listing();
        $total             = $m_galeri->total();

        $data = [
            'title' => 'Galeri dan Banner (' . $total . ')',
            'galeri'     => $galeri,
            'content'    => 'admin/galeri/index',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Tambah
    public function tambah()
    {
        checklogin();
        $m_galeri          = new Galeri_model();
        $m_kategori_galeri = new Kategori_galeri_model();
        $kategori_galeri   = $m_kategori_galeri->listing();

        // Start validasi
        if ($this->request->getMethod() === 'post' && $this->validate([
            'judul_galeri' => 'required',
            'gambar' => [
                'uploaded[gambar]',
                'mime_in[gambar,image/jpg,image/jpeg,image/gif,image/png]',
                'max_size[gambar,4096]',
            ],
        ])) {
            $judul_galeri = strtolower(url_title($this->request->getVar('judul_galeri')));
            $namabaru = null;

            // Handle file upload
            $avatar = $this->request->getFile('gambar');
            if ($avatar && $avatar->isValid() && !$avatar->hasMoved()) {
                $namabaru = 'galeri_' . $judul_galeri . '.' . $avatar->getExtension();
                $path = FCPATH . 'assets/upload/image/galeri/' . $namabaru;

                // Tambahkan nomor otomatis jika nama file sudah ada
                $i = 1;
                while (file_exists($path)) {
                    $namabaru = 'galeri_' . $judul_galeri . '-' . $i . '.' . $avatar->getExtension();
                    $path = FCPATH . 'assets/upload/image/galeri/' . $namabaru;
                    $i++;
                }

                $avatar->move(FCPATH . 'assets/upload/image/galeri/', $namabaru);
            }

            // Masukkan ke database
            $data = [
                'id_user'            => $this->session->get('id_user'),
                'id_kategori_galeri' => $this->request->getVar('id_kategori_galeri'),
                'judul_galeri'       => $this->request->getVar('judul_galeri'),
                'jenis_galeri'       => $this->request->getVar('jenis_galeri'),
                'isi'                => $this->request->getVar('isi'),
                'gambar'             => $namabaru,
                'website'            => $this->request->getVar('website'),
                'status_text'        => $this->request->getVar('status_text'),
                'tanggal_post'       => date('Y-m-d H:i:s'),
            ];
            $m_galeri->tambah($data);

            return redirect()->to(base_url('admin/galeri'))->with('sukses', 'Data Berhasil di Simpan');
        }

        $data = [
            'title'           => 'Tambah Galeri',
            'kategori_galeri' => $kategori_galeri,
            'content'         => 'admin/galeri/tambah',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Edit
    public function edit($id_galeri)
    {
        checklogin();
        $m_kategori_galeri = new Kategori_galeri_model();
        $m_galeri          = new Galeri_model();
        $kategori_galeri   = $m_kategori_galeri->listing();
        $galeri            = $m_galeri->detail($id_galeri);

        // Start validasi
        if ($this->request->getMethod() === 'post' && $this->validate([
            'judul_galeri' => 'required',
            'gambar' => [
                'mime_in[gambar,image/jpg,image/jpeg,image/gif,image/png]',
                'max_size[gambar,4096]',
            ],
        ])) {
            $judul_galeri = strtolower(url_title($this->request->getVar('judul_galeri')));
            $namabaru = $galeri['gambar']; // Default ke gambar lama

            // Handle file upload
            $avatar = $this->request->getFile('gambar');
            if ($avatar && $avatar->isValid() && !$avatar->hasMoved()) {
                // Hapus gambar lama
                if (!empty($galeri['gambar'])) {
                    @unlink(FCPATH . 'assets/upload/image/galeri/' . $galeri['gambar']);
                }

                $namabaru = 'galeri_' . $judul_galeri . '.' . $avatar->getExtension();
                $path = FCPATH . 'assets/upload/image/galeri/' . $namabaru;

                // Tambahkan nomor otomatis jika nama file sudah ada
                $i = 1;
                while (file_exists($path)) {
                    $namabaru = 'galeri_' . $judul_galeri . '-' . $i . '.' . $avatar->getExtension();
                    $path = FCPATH . 'assets/upload/image/galeri/' . $namabaru;
                    $i++;
                }

                $avatar->move(FCPATH . 'assets/upload/image/galeri/', $namabaru);
            }

            $data = [
                'id_galeri'          => $id_galeri,
                'id_user'            => $this->session->get('id_user'),
                'id_kategori_galeri' => $this->request->getVar('id_kategori_galeri'),
                'judul_galeri'       => $this->request->getVar('judul_galeri'),
                'jenis_galeri'       => $this->request->getVar('jenis_galeri'),
                'isi'                => $this->request->getVar('isi'),
                'gambar'             => $namabaru,
                'website'            => $this->request->getVar('website'),
                'status_text'        => $this->request->getVar('status_text'),
            ];
            $m_galeri->edit($data);

            return redirect()->to(base_url('admin/galeri'))->with('sukses', 'Data Berhasil di Simpan');
        }

        $data = [
            'title'           => 'Edit Galeri: ' . $galeri['judul_galeri'],
            'kategori_galeri' => $kategori_galeri,
            'galeri'          => $galeri,
            'content'         => 'admin/galeri/edit',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Delete
    public function delete($id_galeri)
    {
        checklogin();
        $m_galeri = new Galeri_model();
        $galeri = $m_galeri->detail($id_galeri);

        // Hapus gambar jika ada
        if (!empty($galeri['gambar'])) {
            @unlink(FCPATH . 'assets/upload/image/galeri/' . $galeri['gambar']);
        }

        // Hapus data dari database
        $data = ['id_galeri' => $id_galeri];
        $m_galeri->delete($data);

        return redirect()->to(base_url('admin/galeri'))->with('sukses', 'Data telah dihapus');
    }
}
