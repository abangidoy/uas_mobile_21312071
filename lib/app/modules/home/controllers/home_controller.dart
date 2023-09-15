import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference products = firestore.collection('mahasiswa_21312071');

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection('mahasiswa_21312071');

    return products.snapshots();
  }

  void deleteProducts(String id) {
    DocumentReference docRef =
        firestore.collection("mahasiswa_21312071").doc(id);

    try {
      Get.defaultDialog(
        title: "info",
        middleText: " apakah anda yakin menghapus data ini ? ",
        onConfirm: () {
          docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "tidak berhasil menghapus data",
      );
    }
  }
}
