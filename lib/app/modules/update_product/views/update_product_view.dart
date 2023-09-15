import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_21312071/app/modules/update_product/controllers/update_product_controller.dart';

class UpdateMahasiswaView extends GetView<UpdateMahasiswaController> {
  const UpdateMahasiswaView({Key? key}) : super(key: key);

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
              'Update Mahasiswa', // Mengubah judul AppBar
              style: TextStyle(
                color: Colors.white, // Mengubah warna teks judul menjadi putih
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['nama'];
            controller.cAlamat.text = data['alamat'];
            controller.cNPM.text = data['npm'].toString();
            return Padding(
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
                    controller: controller.cAlamat,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Alamat Mahasiswa",
                    ),
                  ),
                  TextField(
                    controller: controller.cNPM,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "NPM Mahasiswa",
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => controller.updateMahasiswa(
                      controller.cNama.text,
                      controller.cAlamat.text,
                      controller.cNPM.text,
                      Get.arguments,
                    ),
                    child: Text(
                      "Ubah",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 155, 2,
                          2), // Mengubah warna background button menjadi merah
                    ),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
