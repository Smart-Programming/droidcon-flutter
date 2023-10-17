import 'package:flutter/material.dart';
import 'package:droidcon_flutter/src/application/utils/constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  final title;
  final controller;
  final prefixIcon;
  final keyBoardType;
  const TextFormFieldWidget(
      {Key? key,
      required this.title,
      required this.controller,
      required this.prefixIcon,
      required this.keyBoardType})
      : super(key: key);

  @override
  State<TextFormFieldWidget> createState() =>
      _TextFormFieldWidgetState(title, controller, prefixIcon, keyBoardType);
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final title;
  final controller;
  final prefixIcon;
  final keyBoardType;
  _TextFormFieldWidgetState(
      this.title, this.controller, this.prefixIcon, this.keyBoardType);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        autocorrect: true,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: keyBoardType,
        decoration: UtilityClass.textFormDecoration(context, title, prefixIcon),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$title is required!';
          }
          return null;
        },
      ),
    );
  }
}