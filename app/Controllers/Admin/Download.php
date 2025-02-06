<?php

namespace App\Controllers\Admin;

use App\Models\Download_model;
use App\Models\Kategori_download_model;

class Download extends BaseController
{
    // index
    public function index()
    {
        checklogin();
        $m_download          = new Download_model();
        $m_kategori_download = new Kategori_download_model();
        $download            = $m_download->listing();
        $total               = $m_download->total();

        $data = [
            'title' => 'Data File Download (' . $total . ')',
            'download'   => $download,
            'content'    => 'admin/download/index',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Tambah
    public function tambah()
    {
        checklogin();
        $m_download          = new Download_model();
        $m_kategori_download = new Kategori_download_model();
        $kategori_download   = $m_kategori_download->listing();

        if ($this->request->getMethod() === 'post' && $this->validate([
            'judul_download' => 'required',
            'gambar' => [
                'uploaded[gambar]',
                'mime_in[gambar,image/jpg,image/jpeg,image/png,application/pdf,application/msword,application/vnd.ms-excel,application/vnd.ms-powerpoint]',
                'max_size[gambar,4096]',
            ],
        ])) {
            $avatar   = $this->request->getFile('gambar');
            $judul    = strtolower(url_title($this->request->getVar('judul_download')));
            $namabaru = 'download_' . $judul . '.' . $avatar->getExtension();
            $path     = FCPATH . 'assets/upload/file/';

            $counter = 1;
            while (file_exists($path . $namabaru)) {
                $namabaru = 'download_' . $judul . "-" . $counter . '.' . $avatar->getExtension();
                $counter++;
            }

            $avatar->move($path, $namabaru);

            $data = [
                'id_user'              => $this->session->get('id_user'),
                'id_kategori_download' => $this->request->getVar('id_kategori_download'),
                'judul_download'       => $this->request->getVar('judul_download'),
                'jenis_download'       => $this->request->getVar('jenis_download'),
                'isi'                  => $this->request->getVar('isi'),
                'gambar'               => $namabaru,
                'website'              => $this->request->getVar('website'),
                'tanggal_post'         => date('Y-m-d H:i:s'),
            ];
            $m_download->tambah($data);

            return redirect()->to(base_url('admin/download'))->with('sukses', 'Data Berhasil di Simpan');
        }

        $data = [
            'title' => 'Tambah Download',
            'kategori_download' => $kategori_download,
            'content' => 'admin/download/tambah',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Edit
    public function edit($id_download)
    {
        checklogin();
        $m_kategori_download = new Kategori_download_model();
        $m_download          = new Download_model();
        $kategori_download   = $m_kategori_download->listing();
        $download            = $m_download->detail($id_download);

        if ($this->request->getMethod() === 'post' && $this->validate([
            'judul_download' => 'required',
            'gambar' => [
                'mime_in[gambar,image/jpg,image/jpeg,image/png,application/pdf,application/msword,application/vnd.ms-excel,application/vnd.ms-powerpoint]',
                'max_size[gambar,4096]',
            ],
        ])) {
            $avatar   = $this->request->getFile('gambar');

            if ($avatar && $avatar->isValid()) {
                $judul    = strtolower(url_title($this->request->getVar('judul_download')));
                $namabaru = 'download_' . $judul . '.' . $avatar->getExtension();
                $path     = FCPATH . 'assets/upload/file/';

                $counter = 1;
                while (file_exists($path . $namabaru)) {
                    $namabaru = 'download_' . $judul . "-" . $counter . '.' . $avatar->getExtension();
                    $counter++;
                }

                // Hapus file lama
                if (file_exists($path . $download['gambar'])) {
                    unlink($path . $download['gambar']);
                }

                $avatar->move($path, $namabaru);

                $data = [
                    'id_download'          => $id_download,
                    'id_user'              => $this->session->get('id_user'),
                    'id_kategori_download' => $this->request->getVar('id_kategori_download'),
                    'judul_download'       => $this->request->getVar('judul_download'),
                    'jenis_download'       => $this->request->getVar('jenis_download'),
                    'isi'                  => $this->request->getVar('isi'),
                    'gambar'               => $namabaru,
                    'website'              => $this->request->getVar('website'),
                ];
                $m_download->edit($data);

                return redirect()->to(base_url('admin/download'))->with('sukses', 'Data Berhasil di Simpan');
            }
        }

        $data = [
            'title' => 'Edit Download: ' . $download['judul_download'],
            'kategori_download' => $kategori_download,
            'download' => $download,
            'content' => 'admin/download/edit',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Unduh
    public function unduh($id_download)
    {
        checklogin();
        $m_download = new Download_model();
        $download   = $m_download->detail($id_download);

        return $this->response->download('assets/upload/file/' . $download['gambar'], null);
    }

    // Delete
    public function delete($id_download)
    {
        checklogin();
        $m_download = new Download_model();
        $download   = $m_download->detail($id_download);
        $path       = FCPATH . 'assets/upload/file/';

        if (file_exists($path . $download['gambar'])) {
            unlink($path . $download['gambar']);
        }

        $m_download->delete(['id_download' => $id_download]);
        $this->session->setFlashdata('sukses', 'Data telah dihapus');

        return redirect()->to(base_url('admin/download'));
    }
}
