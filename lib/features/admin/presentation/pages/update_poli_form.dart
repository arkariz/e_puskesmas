import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_dropdown.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/date_field.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/update_controller.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/update_poli_controller.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/register_umum/header_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePoliForm extends GetView<UpdatePoliController> {
  UpdatePoliForm({Key? key}) : super(key: key);

  final formFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
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
                          H1Text(text: controller.poliValue.value, bold: true),
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
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Form(
                          key: formFieldKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: kDefaultPadding),
                              CustomTextField(
                                controller: controller.namaController.value,
                                node: controller.namaNode.value,
                                size: size,
                                label: "Nama",
                                hint: "Masukkan Nama",
                              ),
                              CustomDropdown(
                                label: "Status",
                                hint: "Pilih Status",
                                size: size,
                                menuItems: controller.statusItems,
                                onChangeValue: controller.onSelectStatus,
                                value: controller.initStatusValue(),
                              ),
                              DateField(
                                initialValue: controller.riwayat.value,
                                label: "Riwayat",
                                icon: Icons.date_range_outlined,
                                isDate: true,
                                onSelected: controller.onSelectedTanggal,
                              ),
                              CustomDropdown(
                                label: "Poliklinik",
                                hint: "Pilih Poliklinik",
                                size: size,
                                menuItems: controller.poliItems,
                                onChangeValue: controller.onSelectPoli,
                                value: controller.initPoliValue(),
                              ),
                              if (controller.poliValue.value == "Poli KB" || controller.poliValue.value == "Poli KIA")
                                CustomDropdown(
                                  label: "Pilih Bidan",
                                  hint: "Pilih Bidan",
                                  size: size,
                                  menuItems: controller.dokterList,
                                  onChangeValue: controller.onSelectedDokter,
                                  value: controller.initDokterValue(),
                                )
                              else
                                CustomDropdown(
                                  label: "Pilih Dokter",
                                  hint: "Pilih Dokter",
                                  size: size,
                                  menuItems: controller.dokterList,
                                  onChangeValue: controller.onSelectedDokter,
                                  value: controller.initDokterValue(),
                                ),
                              const SizedBox(height: kDefaultPadding * 2),
                              CustomButton(
                                size: size,
                                buttonWidth: 0.90,
                                label: "Ubah",
                                onPressed: () {
                                  if (formFieldKey.currentState!.validate()) {
                                    controller.updatePoli();
                                  }
                                },
                              ),
                            ],
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
