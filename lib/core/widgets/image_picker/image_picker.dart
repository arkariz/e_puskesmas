import 'package:e_puskesmas/core/widgets/image_picker/image_placeholder.dart';
import 'package:e_puskesmas/core/widgets/image_picker/upload_placeholder.dart';
import 'package:e_puskesmas/features/userAuth/presentation/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ImagePickerForm extends StatelessWidget {
  const ImagePickerForm({
    Key? key,
    required this.controller,
    required this.jenisDokumen,
  }) : super(key: key);

  final RegisterController controller;
  final String jenisDokumen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: () {
              controller.openBottomModal(context, jenisDokumen);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (jenisDokumen == "kk")
                  if (controller.fotoKk.value == "") ...[
                    UploadPlaceholder(size: size, label: "Tambahkan Foto"),
                  ] else ...[
                    ImagePlaceholder(
                      size: size,
                      controller: controller,
                      imagePath: controller.fotoKk.value,
                      jenisDokumen: jenisDokumen,
                    ),
                  ]
                else if (jenisDokumen == "bpjs")
                  if (controller.fotoBpjs.value == "") ...[
                    UploadPlaceholder(size: size, label: "Tambahkan Foto"),
                  ] else ...[
                    ImagePlaceholder(
                      size: size,
                      controller: controller,
                      imagePath: controller.fotoBpjs.value,
                      jenisDokumen: jenisDokumen,
                    ),
                  ]
                else if (controller.fotoKtp.value == "") ...[
                  UploadPlaceholder(size: size, label: "Tambahkan Foto"),
                ] else ...[
                  ImagePlaceholder(
                    size: size,
                    controller: controller,
                    imagePath: controller.fotoKtp.value,
                    jenisDokumen: jenisDokumen,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
