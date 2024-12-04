import 'package:doanflutterfahasa/pages/auth/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text("Đăng nhập",style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,

            )
          )),
        )
      ),
      body: DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: const TabBar(
          labelColor: Colors.orange,
          indicatorColor: Colors.orange,
          tabs:[

            Tab(
                text : "Đăng nhập"
            ),
            Tab(
                text: "Đăng kí"
            ),


          ]
        ),
      ),
        body: TabBarView(children: [

          Login(),
          Register(),
        ]),
      )
      )
    );
  }
}
