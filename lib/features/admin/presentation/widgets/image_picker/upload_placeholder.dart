import 'package:dotted_border/dotted_border.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:flutter/material.dart';

class UploadPlaceholder extends StatelessWidget {
  const UploadPlaceholder({
    Key? key,
    required this.label,
    required this.size,
  }) : super(key: key);

  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(15),
      dashPattern: const [8],
      strokeWidth: 1,
      color: Colors.grey,
      child: SizedBox(
        height: size.height * 0.2,
        width: size.width * 0.85,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey,
                size: 30,
              ),
              H4Text(text: label, bold: false, textColor: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }
}
