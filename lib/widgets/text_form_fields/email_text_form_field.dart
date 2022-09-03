import 'package:contact_manager/helpers/strings.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: 30,
      validator: _validator,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(fontSize: 14),
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Email',
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        counterText: '',
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return emailIsMandatory;
    }

    if (!value.contains('@')) {
      return emailIsNotValid;
    }

    return null;
  }
}
