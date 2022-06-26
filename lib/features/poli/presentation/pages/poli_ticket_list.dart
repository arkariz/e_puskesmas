import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_ticket_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliTicketListPage extends GetView<PoliTicketListController> {
  const PoliTicketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: controller.isLoading.value
              ? const CircularProgressIndicator()
              : SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.1),
                      controller.isLoginAs.value == "admin login"
                          ? Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(Icons.arrow_back_ios_rounded),
                                ),
                                const H2Text(text: "Riwayat Pemeriksaan Pasien", bold: true),
                              ],
                            )
                          : const H2Text(
                              text: "Riwayat Pemeriksaan Anda",
                              bold: true,
                            ),
                      controller.listTicket.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: H1Text(text: "Belum Ada Pemeriksaan", bold: true),
                            )
                          : SizedBox(
                              width: size.width,
                              height: size.height * 0.9,
                              child: ListView.builder(
                                padding: EdgeInsets.only(
                                  top: kDefaultPadding,
                                  left: kDefaultPadding,
                                  right: kDefaultPadding,
                                  bottom: size.height * 0.15,
                                ),
                                itemCount: controller.listTicket.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        title: H3Text(
                                          text: "${controller.listTicket[index]["kode_antrian"]} (Dr. ${controller.listTicket[index]["dokter"]})",
                                          bold: true,
                                        ),
                                        subtitle: H4Text(text: "Poliklinik : ${controller.listTicket[index]["jenis_poli"]}", bold: false),
                                        // shape: const Border(
                                        //   bottom: BorderSide(color: Colors.grey),
                                        // ),
                                        onTap: () {
                                          Get.toNamed(Routes.POLI_TICKET, arguments: {"id_poli": controller.listTicket[index]["id_poli"]});
                                        },
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
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
