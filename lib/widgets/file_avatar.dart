import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileAvatar extends StatelessWidget {
  const FileAvatar({required this.file, required this.size, Key? key})
      : super(key: key);

  final XFile file;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Image.file(
        File(file.path),
        height: size,
        width: size,
        fit: BoxFit.fill,
      ),
    );
  }
}
