<?php

namespace App\Controllers\Admin;

use App\Models\Client_model;

class Client extends BaseController
{
    // Mainpage
    public function index()
    {
        checklogin();
        $m_client = new Client_model();
        $client = $m_client->listing();
        $total = $m_client->total();

        if ($this->request->getMethod() === 'post' && $this->validate(
            [
                'nama' => 'required',
                'gambar' => [
                    'mime_in[gambar,image/jpg,image/jpeg,image/gif,image/png]',
                    'max_size[gambar,4096]',
                ],
            ]
        )) {
            $nama = strtolower(url_title($this->request->getVar('nama')));
            $namabaru = null;
            // Handle file upload
            $gambar_client = $this->request->getFile('gambar');
            if ($gambar_client && $gambar_client->isValid() && !$gambar_client->hasMoved()) {
                $namabaru = 'client_' . $nama . '.' . $gambar_client->getExtension();
                $path = FCPATH . 'assets/upload/client/' . $namabaru;

                // Tambahkan nomor otomatis jika nama file sudah ada
                $i = 1;
                while (file_exists($path)) {
                    $namabaru = 'berita_' . $nama . '-' . $i . '.' . $gambar_client->getExtension();
                    $path = FCPATH . 'assets/upload/client/' . $namabaru;
                    $i++;
                }

                $gambar_client->move(FCPATH . 'assets/upload/client/', $namabaru);
            }

            $data = [
                'id_user' => $this->session->get('id_user'),
                'jenis_client' => $this->request->getPost('jenis_client'),
                'nama' => $this->request->getPost('nama'),
                'pimpinan' => $this->request->getPost('pimpinan'),
                'alamat' => $this->request->getPost('alamat'),
                'telepon' => $this->request->getPost('telepon'),
                'website' => $this->request->getPost('website'),
                'email' => $this->request->getPost('email'),
                'isi_testimoni' => $this->request->getPost('isi_testimoni'),
                'gambar' => $namabaru,
                'status_client' => $this->request->getPost('status_client'),
                'tempat_lahir' => $this->request->getPost('tempat_lahir'),
                'tanggal_lahir' => date('Y-m-d', strtotime($this->request->getPost('tanggal_lahir'))),
                'tanggal_post' => date('Y-m-d H:i:s'),
            ];
            $m_client->tambah($data);

            $this->session->setFlashdata('sukses', 'Data telah ditambah');
            return redirect()->to(base_url('admin/client'));
        }

        $data = [
            'title' => 'Data Client: ' . $total['total'],
            'client' => $client,
            'content' => 'admin/client/index',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Edit
    public function edit($id_client)
    {
        checklogin();
        $m_client = new Client_model();
        $client = $m_client->detail($id_client);

        if ($this->request->getMethod() === 'post' && $this->validate(
            [
                'nama' => 'required',
                'gambar' => [
                    'mime_in[gambar,image/jpg,image/jpeg,image/gif,image/png]',
                    'max_size[gambar,4096]',
                ],
            ]
        )) {
            $nama = strtolower(url_title($this->request->getVar('nama')));
            $namabaru = $client['gambar']; // Default ke gambar lama

            // Handle file upload
            $gambar_client = $this->request->getFile('gambar');
            if ($gambar_client && $gambar_client->isValid() && !$gambar_client->hasMoved()) {
                // Hapus gambar lama
                if (!empty($client['gambar'])) {
                    @unlink(FCPATH . 'assets/upload/client/' . $client['gambar']);
                }

                $namabaru = 'client_' . $nama . '.' . $gambar_client->getExtension();
                $path = FCPATH . 'assets/upload/client/' . $namabaru;

                // Tambahkan nomor otomatis jika nama file sudah ada
                $i = 1;
                while (file_exists($path)) {
                    $namabaru = 'client_' . $nama . '-' . $i . '.' . $gambar_client->getExtension();
                    $path = FCPATH . 'assets/upload/client/' . $namabaru;
                    $i++;
                }

                $gambar_client->move(FCPATH . 'assets/upload/client/', $namabaru);
            }

            $data = [
                'id_client' => $id_client,
                'id_user' => $this->session->get('id_user'),
                'jenis_client' => $this->request->getPost('jenis_client'),
                'nama' => $this->request->getPost('nama'),
                'pimpinan' => $this->request->getPost('pimpinan'),
                'alamat' => $this->request->getPost('alamat'),
                'telepon' => $this->request->getPost('telepon'),
                'website' => $this->request->getPost('website'),
                'email' => $this->request->getPost('email'),
                'isi_testimoni' => $this->request->getPost('isi_testimoni'),
                'gambar' => $namabaru,
                'status_client' => $this->request->getPost('status_client'),
                'tempat_lahir' => $this->request->getPost('tempat_lahir'),
                'tanggal_lahir' => date('Y-m-d', strtotime($this->request->getPost('tanggal_lahir'))),
            ];
            $m_client->edit($data);

            $this->session->setFlashdata('sukses', 'Data telah disimpan');
            return redirect()->to(base_url('admin/client'));
        }

        $data = [
            'title' => 'Edit Data Client: ' . $client['nama'],
            'client' => $client,
            'content' => 'admin/client/edit',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Delete
    public function delete($id_client)
    {
        checklogin();
        $m_client = new Client_model();
        $client = $m_client->detail($id_client);

        // Hapus gambar jika ada
        if ($client['gambar'] && file_exists(FCPATH . 'assets/upload/client/' . $client['gambar'])) {
            unlink(FCPATH . 'assets/upload/client/' . $client['gambar']);
        }

        $m_client->delete(['id_client' => $id_client]);

        $this->session->setFlashdata('sukses', 'Data telah dihapus');
        return redirect()->to(base_url('admin/client'));
    }
}
