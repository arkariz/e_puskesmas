import 'package:e_puskesmas/core/routes/app_pages.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/home_controller.dart';
import 'package:e_puskesmas/features/poli/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: kTopPadding * 2,
          left: kHorizontalPadding,
          right: kHorizontalPadding,
        ),
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(
                controller: controller,
              ),
              const SizedBox(height: kTopPadding),
              const H1Text(text: "Selamat Data", bold: true),
              const H4Text(text: "Semoga sehat selalu", bold: false),
              const SizedBox(height: kTopPadding),
              GestureDetector(
                child: Image.asset("assets/images/banner-poli.png"),
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    child: Image.asset("assets/images/poli-umum.png"),
                    onTap: () {
                      Get.toNamed(Routes.POLI_FORM, arguments: {
                        "nama": controller.namaPasien.value,
                        "jenis_pasien": controller.statusPasien.value,
                        "poli": "Poli Umum",
                      });
                    },
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/poli-kb.png"),
                    onTap: () {
                      Get.toNamed(Routes.POLI_FORM, arguments: {
                        "nama": controller.namaPasien.value,
                        "jenis_pasien": controller.statusPasien.value,
                        "poli": "Poli KB",
                      });
                    },
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/poli-kia.png"),
                    onTap: () {
                      Get.toNamed(Routes.POLI_FORM, arguments: {
                        "nama": controller.namaPasien.value,
                        "jenis_pasien": controller.statusPasien.value,
                        "poli": "Poli KIA",
                      });
                    },
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/poli-kia.png"),
                    onTap: () {
                      Get.toNamed(Routes.POLI_FORM, arguments: {
                        "nama": controller.namaPasien.value,
                        "jenis_pasien": controller.statusPasien.value,
                        "poli": "Poli KIA",
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
