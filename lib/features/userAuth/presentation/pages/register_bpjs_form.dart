import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_dropdown.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/register_umum/header_register.dart';
import 'package:flutter/material.dart';

class RegisterBpjsForm extends StatefulWidget {
  const RegisterBpjsForm({Key? key}) : super(key: key);

  @override
  State<RegisterBpjsForm> createState() => _RegisterBpjsFormState();
}

class _RegisterBpjsFormState extends State<RegisterBpjsForm> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _sandiController = TextEditingController();

  final _namaKKController = TextEditingController();

  final _kodeposController = TextEditingController();
  final _detailAlamatController = TextEditingController();

  final _namaNode = FocusNode();
  final _emailNode = FocusNode();
  final _sandiNode = FocusNode();
  final _namaKKNode = FocusNode();
  final _kodeposNode = FocusNode();
  final _detailAlamatNode = FocusNode();

  final List<String> menuItems = [
    'Laki-Laki',
    'Perempuan',
  ];

  String? _genderValue;

  void _onSelectGender(String value) {
    setState(() {
      _genderValue = value;
    });
  }

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
              const HeaderRegister(jenisPasien: "Pasien BPJS"),
              Padding(
                padding: const EdgeInsets.only(
                  left: kHorizontalPadding,
                  right: kHorizontalPadding,
                  bottom: kTopPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const H3Text(text: "Informasi akun", bold: true),
                    const SizedBox(height: kDefaultPadding),
                    CustomTextField(
                      controller: _namaController,
                      node: _namaNode,
                      size: size,
                      label: "Nama Lengkap",
                      hint: "Masukkan Nama",
                    ),
                    CustomTextField(
                      controller: _emailController,
                      node: _emailNode,
                      size: size,
                      label: "Email",
                      hint: "Masukkan Emali",
                    ),
                    CustomTextField(
                      controller: _sandiController,
                      node: _sandiNode,
                      size: size,
                      label: "Kata Sandi",
                      hint: "Masukkan Kata Sandi",
                    ),
                    const H3Text(text: "Data diri", bold: true),
                    const SizedBox(height: kDefaultPadding),
                    CustomTextField(
                      controller: _namaKKController,
                      node: _namaKKNode,
                      size: size,
                      label: "Nama Kartu Keluarga",
                      hint: "Nama Kartu Keluarga",
                    ),
                    CustomDropdown(
                      label: "Jenis Kelamni",
                      hint: "Pilih Jenis Kelamin",
                      size: size,
                      menuItems: menuItems,
                      onChangeValue: _onSelectGender,
                    ),
                    const H3Text(text: "Alamat", bold: true),
                    const SizedBox(height: kDefaultPadding),
                    CustomDropdown(
                      label: "Provinsi",
                      hint: "Pilih Provinsi",
                      size: size,
                      menuItems: menuItems,
                      onChangeValue: _onSelectGender,
                    ),
                    CustomDropdown(
                      label: "Kabupaten/Kota",
                      hint: "Pilih Kabupaten/Kota",
                      size: size,
                      menuItems: menuItems,
                      onChangeValue: _onSelectGender,
                    ),
                    CustomTextField(
                      controller: _kodeposController,
                      node: _kodeposNode,
                      size: size,
                      label: "Kode Post",
                      hint: "Masukkan Kode Pos",
                    ),
                    CustomTextField(
                      controller: _detailAlamatController,
                      node: _detailAlamatNode,
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
                      onPressed: () {},
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
