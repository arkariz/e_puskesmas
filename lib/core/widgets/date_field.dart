import 'package:e_puskesmas/core/themes/theme_constant.dart';
import 'package:e_puskesmas/core/widgets/h4_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'h5_text.dart';

class DateField extends StatefulWidget {
  const DateField({
    Key? key,
    required this.label,
    required this.icon,
    required this.isDate,
    required this.onSelected,
    this.initialValue,
    this.isPoli,
  }) : super(key: key);

  final String? initialValue;
  final String label;
  final IconData icon;
  final bool isDate;
  final bool? isPoli;
  final void Function(String) onSelected;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late DateTime selectedDate;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    selectedDate = widget.initialValue != null ? DateTime.parse(widget.initialValue!.substring(5)) : DateTime.now();
    super.initState();
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: widget.isPoli != null ? selectedDate : DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        String formattedDate = DateFormat('EEE, yyyy-MM-dd', "id_ID").format(selectedDate);
        widget.onSelected(formattedDate);
      });
    }
  }

  // void _selectTime(BuildContext context) async {
  //   final TimeOfDay? timeOfDay = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //     initialEntryMode: TimePickerEntryMode.dial,
  //   );
  //   if (timeOfDay != null && timeOfDay != selectedTime) {
  //     setState(() {
  //       selectedTime = timeOfDay;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H5Text(text: widget.label, bold: false),
          const SizedBox(height: kLabelPadding),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            width: size.width * 0.85,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                H4Text(
                  text: widget.isDate ? DateFormat('EEE, yyyy-MM-dd', "id_ID").format(selectedDate) : selectedTime.format(context),
                  bold: false,
                  textColor: Colors.black54,
                ),
                Icon(
                  widget.icon,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          const SizedBox(height: kDefaultPadding)
        ],
      ),
    );
  }
}
