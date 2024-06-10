import 'package:flutter/material.dart';
import 'package:auth_nodejs_backend/utils/colors.dart';

class TextFieldInput extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final TextInputType textInputType;
  final String hintText;
  const TextFieldInput(
      {super.key,
      required this.textEditingController,
      this.isPassword = false,
      required this.textInputType,
      required this.hintText});

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.deepPurpleAccent, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: const TextStyle(color: primaryColor),
          border: inputBorder,
          focusedBorder: inputBorder,
          // enabledBorder: inputBorder,
          fillColor: mobileBackgroundColor,
          filled: true,
          contentPadding: const EdgeInsets.all(10),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off),
                )
              : null),
      obscureText: widget.isPassword && !isPasswordVisible,
      keyboardType: widget.textInputType,
    );
  }
}
