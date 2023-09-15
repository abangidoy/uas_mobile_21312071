import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_21312071/app/modules/add_product/controllers/add_product_controller.dart';

class AddMahasiswaView extends GetView<AddMahasiswaController> {
  const AddMahasiswaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 155, 2,
            2), // Mengubah warna latar belakang AppBar menjadi merah
        title: Row(
          children: [
            Image.asset(
              'images/logo.png', // Ganti dengan path gambar ikon Anda
              width: 40, // Sesuaikan ukuran gambar sesuai kebutuhan
              height: 40, // Sesuaikan ukuran gambar sesuai kebutuhan
            ),
            SizedBox(width: 8), // Spasi antara ikon dan teks
            Text(
              'Tambah Mahasiswa',
              style: TextStyle(
                color: Colors.white, // Mengubah warna teks menjadi putih
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Nama Mahasiswa",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller:
                  controller.cAlamat, // Sesuaikan dengan field yang benar
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Npm Mahasiswa", // Sesuaikan dengan field alamat
              ),
            ),
            TextField(
              controller: controller.cNPM, // Sesuaikan dengan field yang benar
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Alamat Mahasiswa", // Sesuaikan dengan field npm
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addMahasiswa(
                controller.cNama.text,
                controller.cAlamat.text,
                controller.cNPM.text,
              ),
              child: Text(
                "Simpan",
                style: TextStyle(
                    color: Colors
                        .white), // Mengubah warna teks button menjadi putih
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 155, 2,
                    2), // Mengubah warna background button menjadi merah
              ),
            ),
          ],
        ),
      ),
    );
  }
}
