import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:e_puskesmas/features/poli/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              const HomeHeader(),
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
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/poli-kb.png"),
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/poli-kia.png"),
                  ),
                  GestureDetector(
                    child: Image.asset("assets/images/poli-kia.png"),
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
