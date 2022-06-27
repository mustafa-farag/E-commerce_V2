import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String? Function(String? val)? validate;
  final TextEditingController controller;
  final TextInputType type;
  final bool isSecure;
  final FocusNode? focusNode;
  final VoidCallback? onEditingComplete;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;

  const DefaultTextFormField(
      {Key? key,
      required this.hintText,
      required this.validate,
      required this.controller,
      required this.type,
      required this.isSecure,
      required this.labelText,
      this.focusNode,
      this.onEditingComplete,
      this.textInputAction,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isSecure,
      validator: validate,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          label: Text(labelText),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintText: hintText,
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 1),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4.0),
          )),
    );
  }
}
