import 'package:e_puskesmas/core/widgets/image_picker/upload_placeholder.dart';
import 'package:e_puskesmas/features/admin/presentation/controller/update_controller.dart';
import 'package:e_puskesmas/features/admin/presentation/widgets/image_picker/update_image_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class UpdateImagePicker extends StatelessWidget {
  const UpdateImagePicker({
    Key? key,
    required this.controller,
    required this.jenisDokumen,
  }) : super(key: key);

  final UpdateController controller;
  final String jenisDokumen;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(
      () => Column(
        children: [
          GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (jenisDokumen == "kk")
                  if (controller.fotoKk.value == "") ...[
                    UploadPlaceholder(size: size, label: "Tambahkan Foto"),
                  ] else ...[
                    UpdateImagePlaceholder(
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
                    UpdateImagePlaceholder(
                      size: size,
                      controller: controller,
                      imagePath: controller.fotoBpjs.value,
                      jenisDokumen: jenisDokumen,
                    ),
                  ]
                else if (controller.fotoKtp.value == "") ...[
                  UploadPlaceholder(size: size, label: "Tambahkan Foto"),
                ] else ...[
                  UpdateImagePlaceholder(
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
