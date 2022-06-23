import 'package:dotted_border/dotted_border.dart';
import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_tiket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliTickerScreen extends GetView<PoliTicketController> {
  const PoliTickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(
        () => SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.4,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    dashPattern: const [8],
                    strokeWidth: 1,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const H1Text(text: "Kode Antrian", bold: true),
                              H1Text(text: controller.kodeAntrian.value, bold: true),
                              const SizedBox(
                                height: kDefaultPadding,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          width: size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              H4Text(text: "nama : ${controller.namaPasien.value}", bold: false),
                              H4Text(text: "Status : ${controller.jenisPasien.value}", bold: false),
                              H4Text(text: "Jadwal : ${controller.jadwal.value}", bold: false),
                              H4Text(text: "Poliklinik : ${controller.jenisPoli.value}", bold: false),
                              if (controller.jenisPoli.value == "Poli KB" || controller.jenisPoli.value == "Poli KIA")
                                H4Text(
                                  text: "Bidan : ${controller.dokterValue.value}",
                                  bold: false,
                                )
                              else
                                H4Text(
                                  text: "Dokter : ${controller.dokterValue.value}",
                                  bold: false,
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: const [
                    Icon(Icons.print),
                    H4Text(
                      text: "Cetak Tiket Antrian",
                      bold: true,
                      textColor: Colors.teal,
                    )
                  ],
                ),
              ),
              CustomButton(
                size: size,
                label: "Kembali",
                onPressed: () {
                  controller.isLoginAs.value == "pasien login"
                      ? Get.offNamedUntil(
                          Routes.NAV_BOTTOM,
                          ModalRoute.withName(Routes.HOME),
                        )
                      : Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
