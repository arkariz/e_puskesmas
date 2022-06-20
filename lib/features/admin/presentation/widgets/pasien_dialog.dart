import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/user_list_controller.dart';
import 'package:e_puskesmas/features/admin/presentation/widgets/delete_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// [x] Create dialog for pasien list
Dialog pasienDialog(BuildContext context, UserListController controller, int index) {
  Size size = MediaQuery.of(context).size;
  return Dialog(
    child: SizedBox(
      height: size.height * 0.15,
      width: size.width * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //[x] Update Pasien Action Trigger
          GestureDetector(
            onTap: () {
              controller.jenisPasien.value == "Pasien Umum"
                  ? Get.offNamedUntil(
                      Routes.UPDATE_PASIEN_UMUM,
                      ModalRoute.withName(Routes.PILIH_PASIEN),
                      arguments: {
                        "id_pasien": controller.userList[index]["id_pasien"],
                      },
                    )
                  : Get.offNamedUntil(
                      Routes.UPDATE_PASIEN_BPJS,
                      ModalRoute.withName(Routes.PILIH_PASIEN),
                      arguments: {
                        "id_pasien": controller.userList[index]["id_pasien"],
                      },
                    );
            },
            child: Row(
              children: const [
                SizedBox(width: kDefaultPadding),
                Icon(
                  Icons.edit,
                  color: Colors.yellow,
                ),
                H3Text(text: "Sunting data", bold: false),
              ],
            ),
          ),
          // [x] Delete Alert Dialog Action Trigger
          GestureDetector(
            onTap: () {
              Get.dialog(deleterAlertDialog(context, controller, index));
            },
            child: Row(
              children: const [
                SizedBox(width: kDefaultPadding),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                H3Text(text: "Hapus data", bold: false),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
