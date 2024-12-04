import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'component/custom_button.dart';
import 'component/custom_input_field.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            const CustomInputField(label: "Email", hintText:"Bạn hãy nhập email vào "),
            const CustomInputField(label: "Mật khẩu", hintText:"Nhập mật khẩu", obscureText: true, icon: FontAwesomeIcons.eyeSlash,),
            const SizedBox(
              height: 40,

            ),
            CustomButton(onTap: ()
            {}, btnText: "Đăng nhập", btnHeight: 40,btnWidth: 250, btnColor: Colors.grey,fontWeight: FontWeight.w600,),
            const SizedBox(
              height: 80
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                                
                                    const SizedBox(
                                        height: 20
                                    ),
                                  

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text("Bạn chưa có tài khoản?", style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12
                                                )),
                                            Text("Đăng kí tài khoản",style: GoogleFonts.openSans(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12
                                                ))

                                        ]
                                    )

                                ]
                            )

                        ]
                    )

                ]
            )
        );
    }
}
