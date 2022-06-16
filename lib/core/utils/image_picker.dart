import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class PickImage {
  final ImagePicker _picker = ImagePicker();

  Future<XFile> getImage(ImageSource source) async {
    // try {
      final pickFile = await _picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      return Future.value(pickFile);
    // } catch (e) {
    //   return Future.error("erorr");
    // }
  }
}
