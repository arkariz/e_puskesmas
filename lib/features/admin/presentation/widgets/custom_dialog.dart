import 'package:e_puskesmas/core/widgets/h2_text.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/poli_list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, required this.controller}) : super(key: key);

  final PoliListController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          H2Text(text: "Pilih Hari", bold: true),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.cancel_outlined),
            color: Colors.grey,
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Terbaru",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.getAllPoli(controller.jenisPoli.value);
            controller.dayTitle("Pasien Terbaru");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Senin",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Sen");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Selasa",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Sel");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Rabu",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Rab");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Kamis",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Kam");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Jumat",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Jum");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Sabtu",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Sab");
            Get.back();
          },
        ),
        CupertinoDialogAction(
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            width: size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: const Text(
              "Minggu",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
              ),
            ),
          ),
          onPressed: () {
            controller.filterByDay("Min");
            Get.back();
          },
        )
      ],
    );
  }
}
