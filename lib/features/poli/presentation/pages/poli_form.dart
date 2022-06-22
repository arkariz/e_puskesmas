import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_dropdown.dart';
import 'package:e_puskesmas/core/widgets/date_field.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliForm extends GetView<PoliController> {
  const PoliForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2 * kTopPadding),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kHorizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        H1Text(text: controller.jenisPoli.value, bold: true),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: kHorizontalPadding,
                  right: kHorizontalPadding,
                  bottom: kTopPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.jenisPoli.value == "Poli KB" || controller.jenisPoli.value == "Poli KIA")
                      CustomDropdown(
                        label: "Pilih Bidan",
                        hint: "Pilih Bidan",
                        size: size,
                        menuItems: controller.dokterList,
                        onChangeValue: controller.onSelectedDokter,
                      )
                    else
                      CustomDropdown(
                        label: "Pilih Dokter",
                        hint: "Pilih Dokter",
                        size: size,
                        menuItems: controller.dokterList,
                        onChangeValue: controller.onSelectedDokter,
                      ),
                    CustomDropdown(
                      label: "Pilih Jadwal",
                      hint: "Pilih Jadwal",
                      size: size,
                      menuItems: controller.jadwalList,
                      onChangeValue: controller.onSelectedJadwal,
                    ),
                    CustomButton(
                      size: size,
                      buttonWidth: 0.90,
                      label: "Daftar",
                      onPressed: () {
                        controller.createPoli(Get.arguments["id_pasien"]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
