import 'package:doanflutterfahasa/pages/auth/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatelessWidget
{
    const Account({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.red,
                title: Center(
                    child: Text("Tài khoản",style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold

                            )
                        )
                    )
                )

            ),
            body: GestureDetector(onTap: () async
                {
                    await FirebaseAuth.instance.signOut();
                },child: const Icon(Icons.logout))

        );

    }
}
