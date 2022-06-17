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
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Obx(
          () => Column(
            children: [
              SizedBox(height: size.height * 0.1),
              const H2Text(text: "Riwayat Pemeriksaan Anda", bold: true),
              controller.listTicket.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: H1Text(text: "Belum Ada Pemeriksaan", bold: true),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        top: kDefaultPadding * 2,
                        left: kDefaultPadding,
                        right: kDefaultPadding,
                      ),
                      itemCount: controller.listTicket.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: H3Text(
                            text: "${controller.listTicket[index]["kode_antrian"]} (Dr. ${controller.listTicket[index]["dokter"]})",
                            bold: true,
                          ),
                          subtitle: H4Text(text: "Poliklinik : ${controller.listTicket[index]["jenis_poli"]}", bold: false),
                          shape: const Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                          onTap: () {
                            Get.toNamed(Routes.POLI_TICKET, arguments: {"id_poli": controller.listTicket[index]["id_poli"]});
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
