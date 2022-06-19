import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListPage extends GetView<UserListController> {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Obx(
          () => Column(
            children: [
              SizedBox(height: size.height * 0.1),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                  H2Text(text: controller.jenisPasien.value, bold: true),
                ],
              ),
              controller.userList.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: H1Text(text: "Belum Ada Pasien", bold: true),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      itemCount: controller.userList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: H3Text(
                            text: "${controller.userList[index]["nama_lengkap"]}",
                            bold: true,
                          ),
                          subtitle: H4Text(text: "${controller.userList[index]["email"]}", bold: false),
                          shape: const Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                          onTap: () {
                            controller.jenisPasien.value == "Pasien Umum"
                                ? Get.toNamed(
                                    Routes.UPDATE_PASIEN_UMUM,
                                    arguments: {
                                      "id_pasien": controller.userList[index]["id_pasien"],
                                    },
                                  )
                                : Get.toNamed(
                                    Routes.UPDATE_PASIEN_BPJS,
                                    arguments: {
                                      "id_pasien": controller.userList[index]["id_pasien"],
                                    },
                                  );
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
