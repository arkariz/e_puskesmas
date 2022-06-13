import 'package:dotted_border/dotted_border.dart';
import 'package:e_puskesmas/core/widgets/h1_text.dart';
import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliTickerScreen extends GetView<PoliController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          dashPattern: const [8],
          strokeWidth: 1,
          color: Colors.grey,
          child: Container(
            child: Row(
              children: [
                const H1Text(text: "Kode Antrian", bold: true),
                const H1Text(text: "text", bold: true)
              ],
            ),
          )),
    );
  }
}
