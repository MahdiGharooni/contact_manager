import 'package:flutter/material.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    required this.controller,
    required this.labelText,
    this.obscure = false,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 30,
      obscureText: obscure,
      validator: _validator,
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        counterText: '',
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return '$labelText Is Mandatory';
    }
    if (value.length < 4) {
      return '$labelText Should Be More Than 4 Characters';
    }

    return null;
  }
}
