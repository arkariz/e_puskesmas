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
                controller.activeMenu.value != "user"
                    ? const SizedBox()
                    : CustomTextField(
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
                  child: controller.activeMenu.value == "user"
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () => controller.changeActiveMenu("user"),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.person,
                                    color: Colors.teal,
                                  ),
                                  H3Text(
                                    text: "Nama",
                                    bold: false,
                                    textColor: Colors.teal,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () => controller.changeActiveMenu("poli"),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.apartment_outlined,
                                    color: Colors.black87,
                                  ),
                                  H3Text(text: "Poli", bold: false),
                                ],
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () => controller.changeActiveMenu("user"),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.person,
                                    color: Colors.black87,
                                  ),
                                  H3Text(text: "Nama", bold: false),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () => controller.changeActiveMenu("poli"),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.apartment_outlined,
                                    color: Colors.teal,
                                  ),
                                  H3Text(
                                    text: "Poli",
                                    bold: false,
                                    textColor: Colors.teal,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: size.width * 90 / 100,
                  height: 1,
                  color: Colors.grey,
                ),
                controller.activeMenu.value == "user"
                    ? controller.userList.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: H1Text(text: "Belum Ada Pasien", bold: true),
                          )
                        : UserList(size: size, controller: controller)
                    : SizedBox(
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.LIST_POLI_ADMIN, arguments: {"jenis_poli": "Poli Umum"}),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const H2Text(text: "Poli Umum", bold: false),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: size.width * 90 / 100,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.LIST_POLI_ADMIN, arguments: {"jenis_poli": "Poli KB"}),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const H2Text(text: "Poli KB", bold: false),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: size.width * 90 / 100,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.LIST_POLI_ADMIN, arguments: {"jenis_poli": "Poli Anak"}),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const H2Text(text: "Poli Anak", bold: false),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: size.width * 90 / 100,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () => Get.toNamed(Routes.LIST_POLI_ADMIN, arguments: {"jenis_poli": "Poli KIA"}),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const H2Text(text: "Poli KIA", bold: false),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: size.width * 90 / 100,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final UserListController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
