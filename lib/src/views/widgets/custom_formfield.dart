import 'package:flutter/material.dart';

import '../../utils/name_validator.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.errMsg,
  }) : super(key: key);
  final String hintText;
  final TextEditingController? controller;
  final String? errMsg;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty) {
              return errMsg;
            } else if (Validation().isValidName(value) == false) {
              return "Invalid Name";
            }

            return null;
          },
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(20)),
        ));
  }
}
