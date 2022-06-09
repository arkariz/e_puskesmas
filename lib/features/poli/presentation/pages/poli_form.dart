import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/custom_dropdown.dart';
import 'package:e_puskesmas/core/widgets/custom_textfield.dart';
import 'package:e_puskesmas/core/widgets/date_field.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/userAuth/presentation/widgets/register_umum/header_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({Key? key}) : super(key: key);

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _sandiController = TextEditingController();
  final _kodeposController = TextEditingController();
  final _detailAlamatController = TextEditingController();

  final _namaNode = FocusNode();
  final _emailNode = FocusNode();
  final _sandiNode = FocusNode();
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
                      children: const [
                        H1Text(text: "Poli <jenis poli>", bold: true),
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
                    CustomDropdown(
                      label: "Pilih Dokter",
                      hint: "Pilih Dokter",
                      size: size,
                      menuItems: menuItems,
                      onChangeValue: _onSelectGender,
                    ),
                    const DateField(
                      label: "Atur Tanggal",
                      icon: Icons.date_range_outlined,
                      isDate: true,
                    ),
                    const DateField(
                      label: "Atur Waktu",
                      icon: Icons.access_time,
                      isDate: false,
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
