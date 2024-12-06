import 'package:doanflutterfahasa/pages/auth/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Suggest extends StatelessWidget {
  const Suggest({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Gợi ý cho bạn',style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )
              )
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Image.asset(
  "assets/images/roa.png",
  width: 200, // Chiều rộng mong muốn
  height: 200, // Chiều cao mong muốn
  fit: BoxFit.contain, // Tùy chỉnh cách hình ảnh phù hợp (optional)
),

            const SizedBox(height: 20),
            Text(
              'Để xem được gợi ý dành riêng cho bạn,vui lòng xem ít'
              , style: GoogleFonts.openSans(
              )
            ),
            Text(
              ' nhất ba sản phẩm.', style: GoogleFonts.openSans(
              )
            ),
          ],
        ),
      ),
    );
  }
}