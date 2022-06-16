import 'dart:io';

import 'package:e_puskesmas/features/userAuth/presentation/controller/register_controller.dart';
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    Key? key,
    required this.controller,
    required this.imagePath,
    required this.size,
    required this.jenisDokumen,
  }) : super(key: key);

  final RegisterController controller;
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
        Padding(
          padding: const EdgeInsets.only(top: 7, right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                controller.deleteImage(jenisDokumen);
              },
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Icon(
                  Icons.close,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
