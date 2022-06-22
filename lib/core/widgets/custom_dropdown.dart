import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h5_text.dart';
import 'package:e_puskesmas/features/poli/presentation/controller/poli_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends GetView {
  const CustomDropdown({
    Key? key,
    required this.size,
    required this.menuItems,
    required this.onChangeValue,
    required this.label,
    required this.hint,
    this.icon,
    this.value,
    this.controller,
  }) : super(key: key);

  final Size size;
  final String? value;
  final String label;
  final String hint;
  final IconData? icon;
  final List<String> menuItems;
  final PoliController? controller;
  final void Function(String) onChangeValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        H5Text(text: label, bold: false),
        Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding, top: kLabelPadding),
          child: SizedBox(
            width: size.width * 0.85,
            child: Obx(
              () => DropdownButtonFormField2(
                value: value,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                isExpanded: true,
                hint: Text(
                  hint,
                  style: const TextStyle(fontSize: 14),
                ),
                icon: Icon(
                  icon ?? Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                items: controller != null
                    ? controller!.jadwalList
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                        .toList()
                    : menuItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                validator: (value) {
                  if (value == null) {
                    return hint;
                  }
                },
                onChanged: (value) {
                  onChangeValue(value.toString());
                },
                onSaved: (value) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
