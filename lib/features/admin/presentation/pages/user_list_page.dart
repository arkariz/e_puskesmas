import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/user_list_controller.dart';
import 'package:e_puskesmas/features/admin/presentation/widgets/pasien_dialog.dart';
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
          () => SingleChildScrollView(
            child: Column(
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
                //[x] Add search bar for user
                CustomTextField(
                  controller: controller.namaPasien.value,
                  node: controller.namaPasienNode.value,
                  size: size,
                  label: "Cari nama pasien",
                  hint: "Cari nama pasien",
                  noLabel: true,
                  suffixIcon: const Icon(Icons.search),
                  onPressed: () {
                    controller.getPasienByName(controller.namaPasien.value.text, controller.jenisPasien.value);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person,
                      color: Colors.black87,
                    ),
                    title: const H3Text(text: "Nama", bold: true),
                    shape: const Border(bottom: BorderSide(color: Colors.grey)),
                    trailing: GestureDetector(
                      onTap: () {
                        // [x] Get to register user action trigger
                        if (controller.jenisPasien.value == "Pasien Umum") {
                          Get.toNamed(Routes.REG_PASIEN_UMUM, arguments: {"isAdmin": true, "jenis_pasien": controller.jenisPasien.value});
                        } else {
                          Get.toNamed(Routes.REG_PASIEN_BPJS, arguments: {"isAdmin": true, "jenis_pasien": controller.jenisPasien.value});
                        }
                      },
                      child: const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
                controller.userList.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: H1Text(text: "Belum Ada Pasien", bold: true),
                      )
                    : SingleChildScrollView(
                        child: SizedBox(
                          width: size.width,
                          height: size.height * 0.65,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                              left: kDefaultPadding,
                              right: kDefaultPadding,
                            ),
                            itemCount: controller.userList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: H3Text(
                                      text: "${controller.userList[index]["nama_lengkap"]}",
                                      bold: true,
                                    ),
                                    subtitle: H4Text(text: "${controller.userList[index]["email"]}", bold: false),
                                    // shape: const Border(bottom: BorderSide(color: Colors.grey)),
                                    // [x] Get to user's Poli Ticket List Action Trigger
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.LIST_POLI,
                                        arguments: {
                                          "id_pasien": controller.userList[index]["id_pasien"],
                                        },
                                      );
                                    },
                                    trailing: GestureDetector(
                                      child: const Icon(Icons.more_horiz_outlined),
                                      onTap: () {
                                        Get.dialog(pasienDialog(context, controller, index));
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    width: size.width * 0.8,
                                    color: Colors.black26,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
