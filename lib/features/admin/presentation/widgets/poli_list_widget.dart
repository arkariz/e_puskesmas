import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/poli_list_controller.dart';
import 'package:e_puskesmas/features/admin/presentation/widgets/pasien_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliListWidget extends GetView<PoliListController> {
  const PoliListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
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
              H2Text(text: "TES", bold: true),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CustomTextField(
                  controller: controller.namaPasien,
                  node: controller.namaPasienNode,
                  size: size * 90 / 100,
                  label: "Cari nama pasien",
                  hint: "Cari nama pasien",
                  noLabel: true,
                  suffixIcon: const Icon(Icons.search),
                  onPressed: () {
                    //controller.getPasienByName(controller.namaPasien.value.text, controller.jenisPasien.value);
                  },
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  icon: Icon(Icons.sort),
                  padding: EdgeInsets.zero,
                )
              ],
            ),
          ),
          H3Text(text: "Pasien Terbaru", bold: true),
          PoliList(size: size, controller: controller)
        ],
      ),
    );
  }
}

class PoliList extends StatelessWidget {
  const PoliList({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final PoliListController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        height: size.height * 0.65,
        child: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            itemCount: controller.poliList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: H3Text(
                      text: "${controller.poliList[index]["nama_pasien"]}",
                      bold: true,
                    ),
                    subtitle: H4Text(text: "${controller.poliList[index]["jadwal"]}", bold: false),
                    // shape: const Border(bottom: BorderSide(color: Colors.grey)),
                    // [x] Get to user's Poli Ticket List Action Trigger
                    onTap: () {
                      Get.toNamed(
                        Routes.LIST_POLI,
                        arguments: {
                          "id_pasien": controller.poliList[index]["id_pasien"],
                        },
                      );
                    },
                    trailing: GestureDetector(
                      child: const Icon(Icons.more_horiz_outlined),
                      onTap: () {
                        // Get.dialog(pasienDialog(context, controller, index));
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
    );
  }
}
