import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_dropdown.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/userAuth/presentation/controller/register_controller.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/register_umum/header_register.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RegisterBpjsForm extends GetView<RegisterController> {
  RegisterBpjsForm({Key? key}) : super(key: key);

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
                const HeaderRegister(jenisPasien: "Pasien BPJS"),
                Padding(
                  padding: const EdgeInsets.only(
                    left: kHorizontalPadding,
                    right: kHorizontalPadding,
                    bottom: kTopPadding,
                  ),
                  child: Form(
                    key: formFieldKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const H3Text(text: "Informasi akun", bold: true),
                        const SizedBox(height: kDefaultPadding),
                        CustomTextField(
                          controller: controller.namaController.value,
                          node: controller.namaNode.value,
                          size: size,
                          label: "Nama Lengkap",
                          hint: "Masukkan Nama",
                        ),
                        CustomTextField(
                          controller: controller.emailController.value,
                          node: controller.emailNode.value,
                          size: size,
                          label: "Email",
                          hint: "Masukkan Emali",
                        ),
                        CustomTextField(
                          controller: controller.sandiController.value,
                          node: controller.sandiNode.value,
                          size: size,
                          label: "Kata Sandi",
                          hint: "Masukkan Kata Sandi",
                          isPassword: true,
                          maxLines: 1,
                        ),
                        const H3Text(text: "Data diri", bold: true),
                        const SizedBox(height: kDefaultPadding),
                        CustomTextField(
                          controller: controller.namaKKController.value,
                          node: controller.namaKKNode.value,
                          size: size,
                          label: "Nama Kartu Keluarga",
                          hint: "Nama Kartu Keluarga",
                        ),
                        CustomDropdown(
                          label: "Jenis Kelamni",
                          hint: "Pilih Jenis Kelamin",
                          size: size,
                          menuItems: controller.menuItems,
                          onChangeValue: controller.onSelectGender,
                        ),
                        const H3Text(text: "Alamat", bold: true),
                        const SizedBox(height: kDefaultPadding),
                        CustomDropdown(
                          label: "Provinsi",
                          hint: "Pilih Provinsi",
                          size: size,
                          menuItems: controller.provItems,
                          onChangeValue: controller.onSelectProv,
                        ),
                        CustomDropdown(
                          label: "Kabupaten/Kota",
                          hint: "Pilih Kabupaten/Kota",
                          size: size,
                          menuItems: controller.kabItems,
                          onChangeValue: controller.onSelectkab,
                        ),
                        CustomTextField(
                          controller: controller.kodeposController.value,
                          node: controller.kodeposNode.value,
                          size: size,
                          label: "Kode Pos",
                          hint: "Masukkan Kode Pos",
                        ),
                        CustomTextField(
                          controller: controller.detailAlamatController.value,
                          node: controller.detailAlamatNode.value,
                          size: size,
                          label: "Detail alamat lainnya",
                          hint: "",
                          maxLines: 4,
                        ),
                        const H3Text(text: "Dokumen Pendukung", bold: true),
                        const SizedBox(height: kDefaultPadding),
                        const H5Text(text: "Upload Foto Kartu Keluarga", bold: false),
                        Padding(
                          padding: const EdgeInsets.only(top: kLabelPadding, bottom: kDefaultPadding),
                          child: GestureDetector(
                            child: Image.asset("assets/icons/upload-icon.png"),
                          ),
                        ),
                        const H5Text(text: "Upload Foto KTP", bold: false),
                        Padding(
                          padding: const EdgeInsets.only(top: kLabelPadding, bottom: kDefaultPadding),
                          child: GestureDetector(
                            child: Image.asset("assets/icons/upload-icon.png"),
                          ),
                        ),
                        const H5Text(text: "Upload Foto BPJS", bold: false),
                        Padding(
                          padding: const EdgeInsets.only(top: kLabelPadding, bottom: kDefaultPadding),
                          child: GestureDetector(
                            child: Image.asset("assets/icons/upload-icon.png"),
                          ),
                        ),
                        CustomButton(
                          size: size,
                          buttonWidth: 0.90,
                          label: "Daftar",
                          onPressed: () {
                            if (formFieldKey.currentState!.validate()) {
                              controller.createPasien();
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
