import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2 * kTopPadding),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                H1Text(text: "Pilih Daftar", bold: true),
                H1Text(text: "Sebagai Pasien", bold: true),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.REG_PASIEN_UMUM, arguments: "Pasien Umum");
                },
                iconSize: 150,
                icon: Image.asset("assets/icons/pasien-umum-button.png"),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.REG_PASIEN_BPJS, arguments: "Pasien BPJS");
                },
                iconSize: 150,
                icon: Image.asset("assets/icons/pasien-bpjs-button.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}
