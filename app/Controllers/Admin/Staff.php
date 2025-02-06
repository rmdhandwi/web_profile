<?php

namespace App\Controllers\Admin;

use App\Models\Kategori_staff_model;
use App\Models\Staff_model;

class Staff extends BaseController
{
    // Mainpage
    public function index()
    {
        checklogin();
        $m_staff = new Staff_model();
        $m_kategori_staff = new Kategori_staff_model();
        $staff = $m_staff->listing();
        $total = $m_staff->total();
        $kategori_staff = $m_kategori_staff->listing();

        if ($this->request->getMethod() === 'post' && $this->validate(
            [
                'nama' => 'required',
                'gambar' => [
                    'mime_in[gambar,image/jpg,image/jpeg,image/gif,image/png]',
                    'max_size[gambar,4096]',
                ],
            ]
        )) {
            $namabaru = null;

            if (!empty($_FILES['gambar']['name'])) {
                // Handle file upload
                $avatar = $this->request->getFile('gambar');
                if ($avatar && $avatar->isValid() && !$avatar->hasMoved()) {
                    $namastaff = strtolower(url_title($this->request->getPost('nama')));
                    $directory = FCPATH . 'assets/upload/staff/';
                    $extension = $avatar->getExtension();

                    // Generate unique file name
                    $namabaru = 'staff_' . $namastaff . '.' . $extension;
                    $path = $directory . $namabaru;

                    $i = 1;
                    while (file_exists($path)) {
                        $namabaru = 'staff_' . $namastaff . '_' . $i . '.' . $extension;
                        $path = $directory . $namabaru;
                        $i++;
                    }

                    $avatar->move($directory, $namabaru);
                }
            }

            $data = [
                'id_user' => $this->session->get('id_user'),
                'id_kategori_staff' => $this->request->getPost('id_kategori_staff'),
                'urutan' => $this->request->getPost('urutan'),
                'nama' => $this->request->getPost('nama'),
                'jabatan' => $this->request->getPost('jabatan'),
                'alamat' => $this->request->getPost('alamat'),
                'telepon' => $this->request->getPost('telepon'),
                'website' => $this->request->getPost('website'),
                'email' => $this->request->getPost('email'),
                'keahlian' => $this->request->getPost('keahlian'),
                'gambar' => $namabaru,
                'status_staff' => $this->request->getPost('status_staff'),
                'tempat_lahir' => $this->request->getPost('tempat_lahir'),
                'tanggal_lahir' => date('Y-m-d', strtotime($this->request->getPost('tanggal_lahir'))),
                'tanggal' => date('Y-m-d H:i:s'),
            ];
            $m_staff->tambah($data);

            $this->session->setFlashdata('sukses', 'Data telah ditambah');
            return redirect()->to(base_url('admin/staff'));
        }

        $data = [
            'title' => 'Data Staff: ' . $total['total'],
            'staff' => $staff,
            'kategori_staff' => $kategori_staff,
            'content' => 'admin/staff/index',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Edit
    public function edit($id_staff)
    {
        checklogin();
        $m_kategori_staff = new Kategori_staff_model();
        $m_staff = new Staff_model();
        $staff = $m_staff->detail($id_staff);
        $kategori_staff = $m_kategori_staff->listing();

        if ($this->request->getMethod() === 'post' && $this->validate(
            [
                'nama' => 'required',
                'gambar' => [
                    'mime_in[gambar,image/jpg,image/jpeg,image/gif,image/png]',
                    'max_size[gambar,4096]',
                ],
            ]
        )) {
            $namabaru = $staff['gambar']; // Default gunakan gambar lama

            if (!empty($_FILES['gambar']['name'])) {
                // Hapus gambar lama jika ada
                if ($staff['gambar'] && file_exists(FCPATH . 'assets/upload/staff/' . $staff['gambar'])) {
                    unlink(FCPATH . 'assets/upload/staff/' . $staff['gambar']);
                }

                // Handle file upload
                $avatar = $this->request->getFile('gambar');
                if ($avatar && $avatar->isValid() && !$avatar->hasMoved()) {
                    $namastaff = strtolower(url_title($this->request->getPost('nama')));
                    $directory = FCPATH . 'assets/upload/staff/';
                    $extension = $avatar->getExtension();

                    // Generate unique file name
                    $namabaru = 'staff_' . $namastaff . '.' . $extension;
                    $path = $directory . $namabaru;

                    $i = 1;
                    while (file_exists($path)) {
                        $namabaru = 'staff_' . $namastaff . '_' . $i . '.' . $extension;
                        $path = $directory . $namabaru;
                        $i++;
                    }

                    $avatar->move($directory, $namabaru);
                }
            }

            $data = [
                'id_staff' => $id_staff,
                'id_user' => $this->session->get('id_user'),
                'id_kategori_staff' => $this->request->getPost('id_kategori_staff'),
                'urutan' => $this->request->getPost('urutan'),
                'nama' => $this->request->getPost('nama'),
                'jabatan' => $this->request->getPost('jabatan'),
                'alamat' => $this->request->getPost('alamat'),
                'telepon' => $this->request->getPost('telepon'),
                'website' => $this->request->getPost('website'),
                'email' => $this->request->getPost('email'),
                'keahlian' => $this->request->getPost('keahlian'),
                'gambar' => $namabaru,
                'status_staff' => $this->request->getPost('status_staff'),
                'tempat_lahir' => $this->request->getPost('tempat_lahir'),
                'tanggal_lahir' => date('Y-m-d', strtotime($this->request->getPost('tanggal_lahir'))),
            ];
            $m_staff->edit($data);

            $this->session->setFlashdata('sukses', 'Data telah disimpan');
            return redirect()->to(base_url('admin/staff'));
        }

        $data = [
            'title' => 'Edit Data Staff: ' . $staff['nama'],
            'staff' => $staff,
            'kategori_staff' => $kategori_staff,
            'content' => 'admin/staff/edit',
        ];
        echo view('admin/layout/wrapper', $data);
    }

    // Delete
    public function delete($id_staff)
    {
        checklogin();
        $m_staff = new Staff_model();
        $staff = $m_staff->detail($id_staff);

        // Hapus gambar jika ada
        if ($staff['gambar'] && file_exists(FCPATH . 'assets/upload/staff/' . $staff['gambar'])) {
            unlink(FCPATH . 'assets/upload/staff/' . $staff['gambar']);
        }

        $data = ['id_staff' => $id_staff];
        $m_staff->delete($data);

        $this->session->setFlashdata('sukses', 'Data telah dihapus');
        return redirect()->to(base_url('admin/staff'));
    }
}
