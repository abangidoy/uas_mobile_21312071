import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat; // Tambahkan controller untuk alamat

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addMahasiswa(String nama, String npm, String alamat) async {
    CollectionReference mahasiswa = firestore.collection(
        "mahasiswa_21312071"); // Sesuaikan dengan nama koleksi yang sesuai di Firestore Anda

    try {
      await mahasiswa.add({
        "nama": nama,
        "npm": npm,
        "alamat": alamat,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        onConfirm: () {
          cNama.clear();
          cNPM.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cNPM = TextEditingController();
    cAlamat = TextEditingController(); // Inisialisasi controller untuk alamat
  }

  @override
  void onClose() {
    cNama.dispose();
    cNPM.dispose();
    cAlamat.dispose(); // Hapus controller untuk alamat
    super.onClose();
  }
}
