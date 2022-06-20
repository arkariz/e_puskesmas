import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// [x] Create Delete Alert dialog
Dialog deleterAlertDialog(BuildContext context, UserListController controller, int index) {
  Size size = MediaQuery.of(context).size;
  return Dialog(
    child: SizedBox(
      height: size.height * 0.3,
      width: size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.delete,
            color: Colors.red,
            size: 65,
          ),
          const H2Text(text: "Apakah anda yakin?", bold: true),
          const H5Text(text: "Anda tidak bisa memulikan jika dihapus", bold: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                size: size,
                buttonWidth: 0.25,
                label: "Batal",
                buttonColor: Colors.white12,
                textColor: Colors.black54,
                onPressed: () {
                  Get.back();
                },
              ),
              // [x] Delete Pasien Action Trigger
              CustomButton(
                size: size,
                buttonWidth: 0.25,
                label: "Hapus",
                buttonColor: Colors.red,
                onPressed: () {
                  final idPasien = controller.userList[index]['id_pasien'];
                  controller.deleteUser(idPasien);
                  Get.back();
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
