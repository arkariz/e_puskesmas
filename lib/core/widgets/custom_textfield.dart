import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h3_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.node,
    required this.size,
    this.icon,
    required this.label,
    required this.type,
    this.maxLines,
    this.suffixIcon,
    this.onPressed,
    required this.hint,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode node;
  final Size size;
  final Icon? icon;
  final Icon? suffixIcon;
  final String label;
  final String hint;
  final TextInputType type;
  final int? maxLines;
  final VoidCallback? onPressed;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H3Text(text: widget.label, bold: false),
        Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding, top: kLabelPadding),
          child: SizedBox(
            width: widget.size.width * 0.85,
            child: TextFormField(
              maxLines: widget.maxLines,
              keyboardType: widget.type,
              focusNode: widget.node,
              controller: widget.controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kolom Tidak Boleh Kosong';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: widget.hint,
                alignLabelWithHint: true,
                prefixIcon: widget.icon,
                labelStyle: const TextStyle(color: Colors.black38),
                labelText: widget.label,
                suffixIcon: widget.suffixIcon == null ? widget.suffixIcon : IconButton(onPressed: widget.onPressed ?? () {}, icon: widget.suffixIcon!),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.black26)),
              ),
              textInputAction: TextInputAction.done,
            ),
          ),
        ),
      ],
    );
  }
}
