import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_dropdown.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/date_field.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/profile/controller/user_update_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/pages/profile/image_picker/update_image_picker.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/register_umum/header_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserUpdateUmumForm extends GetView<UserUpdateController> {
  UserUpdateUmumForm({Key? key}) : super(key: key);

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
                const HeaderRegister(
                  jenisPasien: "Pasien Umum",
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
                              const H3Text(text: "Informasi akun", bold: true),
                              const SizedBox(height: kDefaultPadding),
                              CustomTextField(
                                controller: controller.emailController.value,
                                node: controller.emailNode.value,
                                size: size,
                                label: "Username",
                                hint: "Masukkan Username",
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
                                controller: controller.namaController.value,
                                node: controller.namaNode.value,
                                size: size,
                                label: "Nama Lengkap",
                                hint: "Masukkan Nama",
                              ),
                              DateField(
                                initialValue: controller.tanggalLahir.value,
                                label: "Tanggal Lahir",
                                icon: Icons.date_range_outlined,
                                isDate: true,
                                onSelected: controller.onSelectedTanggal,
                              ),
                              CustomTextField(
                                controller: controller.tempatLahirController.value,
                                node: controller.tempatLahirNode.value,
                                size: size,
                                label: "Tempat Lahir",
                                hint: "Masukkan Tempat Lahir",
                              ),
                              CustomTextField(
                                controller: controller.usiaController.value,
                                node: controller.usiaNode.value,
                                size: size,
                                label: "Usia",
                                hint: "Masukkan Usia",
                                type: TextInputType.number,
                              ),
                              CustomDropdown(
                                label: "Jenis Kelamin",
                                hint: "Pilih Jenis Kelamin",
                                size: size,
                                menuItems: controller.menuItems,
                                onChangeValue: controller.onSelectGender,
                                value: controller.initGenderValue(),
                              ),
                              const H3Text(text: "Alamat", bold: true),
                              const SizedBox(height: kDefaultPadding),
                              CustomTextField(
                                controller: controller.detailAlamatController.value,
                                node: controller.detailAlamatNode.value,
                                size: size,
                                label: "Detail alamat",
                                hint: "",
                                maxLines: 4,
                              ),
                              const H3Text(text: "Dokumen Pendukung", bold: true),
                              const SizedBox(height: kDefaultPadding),
                              const H5Text(text: "Upload Foto Kartu Keluarga", bold: false),
                              const SizedBox(height: kLabelPadding),
                              UpdateImagePicker(controller: controller, jenisDokumen: "kk"),
                              const SizedBox(height: kDefaultPadding * 2),
                              CustomButton(
                                size: size,
                                buttonWidth: 0.90,
                                label: "Ubah",
                                onPressed: () {
                                  if (formFieldKey.currentState!.validate()) {
                                    controller.updatePasien();
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
