import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.color,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    required this.validator,
    required this.obsecureText,
    required this.suffixIcon,
    required this.prefixIcon,
  });
  final Color color;
  final String hintText;
  final String labelText;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  final bool obsecureText;
  final IconButton suffixIcon;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        labelText: labelText,
        labelStyle: TextStyle(color: color),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: color)),
      ),
    );
  }
}
