import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_21312071/app/controllers/auth_controller.dart';
import 'package:uas_21312071/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(
                Routes.UPDATE_PRODUCT,
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.deleteProducts(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(
            155, 2, 2, 1), // Mengubah warna latar belakang AppBar menjadi merah
        title: Row(
          children: [
            Image.asset(
              'images/logo.png', // Ganti dengan path gambar Anda
              width: 40, // Sesuaikan ukuran gambar sesuai kebutuhan
              height: 40, // Sesuaikan ukuran gambar sesuai kebutuhan
            ),
            SizedBox(width: 8), // Spasi antara gambar dan teks
            Text(
              'Daftar Mahasiswa',
              style: TextStyle(
                color: Colors.white, // Mengubah warna teks menjadi putih
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => cAuth.logout(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    listAllDocs[index].data() as Map<String, dynamic>;
                return Card(
                  elevation: 3, // Tambahkan bayangan ke item daftar
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    tileColor: Colors.white, // Warna latar belakang item
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      backgroundColor: const Color.fromARGB(
                          255, 155, 2, 2), // Warna latar belakang avatar
                    ),
                    title: Text(
                      "${data["nama"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${data["npm"]}",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 155, 2, 2),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => showOption(listAllDocs[index].id),
                      icon: Icon(Icons.more_vert),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 155, 2, 2),
      ),
    );
  }
}
