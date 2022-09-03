import 'package:contact_manager/helpers/strings.dart';
import 'package:flutter/material.dart';

class PhoneTextFormField extends StatelessWidget {
  const PhoneTextFormField({
    required this.controller,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      keyboardType: TextInputType.phone,
      textDirection: TextDirection.ltr,
      textInputAction: TextInputAction.next,
      maxLength: 12,
      validator: _validator,
      controller: controller,
      decoration: const InputDecoration(
        labelText: phoneNumber,
        hintText: phoneNumber,
        hintTextDirection: TextDirection.ltr,
        counterText: '',
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return phoneIsMandatory;
    }
    if ( value.length < 10) {
      return phoneIsNotValid;
    }

    return null;
  }
}
