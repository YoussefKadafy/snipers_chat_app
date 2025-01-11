import 'package:flutter/material.dart';

class CustomBottum extends StatelessWidget {
  CustomBottum({required this.tittle, required this.onTap});
  final String tittle;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xffFFCB45),
        ),
        child: Center(
          child: Text(
            tittle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
