import 'package:doanflutterfahasa/service/auth/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'component/custom_button.dart';
import 'component/custom_input_field.dart';


class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() {
    return _LoginState();
  }

}



class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool showPassword = true;



  void _submit()async{

    String email = _emailController.text;
    String password = _passwordController.text;

    if(email.isEmpty || password.isEmpty ){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin!')),

      );
    }

    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email không hợp lệ!')),
      );
      return;
    }


    User? user = await AuthService().signInWithFirebase(email, password);

    if(user != null){
      print("login successfully with: ${user.email}" );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng ký Thất bại!')),
      );
    }




  }


  @override
  Widget build(BuildContext context) 
  {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
             CustomInputField(label: "Email", hintText:"Bạn hãy nhập email vào ",controller: _emailController,),
             CustomInputField(label: "Mật khẩu", hintText:"Nhập mật khẩu",controller: _passwordController, onTapPassword: (){
               setState(() {
                 showPassword = !showPassword;
               });
             },obscureText: showPassword, icon: showPassword? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,),
            const SizedBox(
              height: 40,

            ),
            CustomButton(onTap: _submit, btnText: "Đăng nhập", btnHeight: 40,btnWidth: 250, btnColor: Colors.orange,fontWeight: FontWeight.w600,),
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
