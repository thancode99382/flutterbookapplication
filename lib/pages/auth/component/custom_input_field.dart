import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomInputField extends StatelessWidget {

  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? icon;
  final VoidCallback? onTapPassword;

  const CustomInputField({Key? key, required this.label, required this.hintText, this.controller, this.obscureText = false, this.icon,  this.onTapPassword}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 12.0, // Đặt kích thước chữ nhỏ
            ),
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              suffixIcon: GestureDetector( onTap: onTapPassword, child: Icon(icon,size: 16,color: Colors.grey,)),
              hintText: hintText,
              hintStyle: GoogleFonts.openSans(
                textStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey, // Giữ nguyên màu viền khi focus
                ),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
