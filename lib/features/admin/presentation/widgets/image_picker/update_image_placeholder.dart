import 'dart:io';

import 'package:e_puskesmas/features/admin/presentation/controller/update_controller.dart';
import 'package:e_puskesmas/features/userAuth/presentation/controller/register_controller.dart';
import 'package:flutter/material.dart';

class UpdateImagePlaceholder extends StatelessWidget {
  const UpdateImagePlaceholder({
    Key? key,
    required this.controller,
    required this.imagePath,
    required this.size,
    required this.jenisDokumen,
  }) : super(key: key);

  final UpdateController controller;
  final String imagePath;
  final Size size;
  final String jenisDokumen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.file(
            File(imagePath),
            height: size.height * 0.2,
            width: size.width * 0.85,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
