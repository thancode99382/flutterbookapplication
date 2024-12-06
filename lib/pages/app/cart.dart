import 'package:doanflutterfahasa/pages/auth/component/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget
{
    const Cart({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.red,
                title: Center(
                    child: Text("Giỏ hàng",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                )
            )

        );
    }
}
