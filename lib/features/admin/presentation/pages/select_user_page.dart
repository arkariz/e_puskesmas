import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/custom_button.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectUserPage extends StatefulWidget {
  const SelectUserPage({Key? key}) : super(key: key);

  @override
  State<SelectUserPage> createState() => _SelectUserPageState();
}

class _SelectUserPageState extends State<SelectUserPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 2 * kTopPadding),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                H1Text(text: "Pilih Pasien", bold: true),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.LIST_USER, arguments: {"jenis_pasien": "Pasien Umum"});
                },
                iconSize: 150,
                icon: Image.asset("assets/icons/pasien-umum-button.png"),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.LIST_USER, arguments: {"jenis_pasien": "Pasien BPJS"});
                },
                iconSize: 150,
                icon: Image.asset("assets/icons/pasien-bpjs-button.png"),
              )
            ],
          ),
          const SizedBox(height: kDefaultPadding * 3),
          CustomButton(
            size: size,
            label: "Keluar",
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('isLogin', "logout");
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
    );
  }
}
