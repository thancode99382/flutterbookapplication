import 'package:doanflutterfahasa/pages/main_layout_private.dart';
import 'package:doanflutterfahasa/service/auth/authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'component/custom_button.dart';
import 'component/custom_input_field.dart';



class Register extends StatefulWidget{
  const Register({super.key});
  @override
  State<Register> createState() =>_RegisterState();
}




class _RegisterState extends State<Register>
{
     final TextEditingController _emailController = TextEditingController();
     final TextEditingController _passwordController = TextEditingController();
     late bool showPassword = true;


     void _submit()async{

       String email = _emailController.text;
       String password = _passwordController.text;

       if (email.isEmpty || password.isEmpty) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Vui lòng nhập đầy đủ thông tin!')),
         );
         return;
       }

       if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Email không hợp lệ!')),
         );
         return;
       }

       User? user = await AuthService().signUpWithFirebase(email, password);


       if(user != null){
         print("register successfully with: ${user.email}" );

         Navigator.push(context, MaterialPageRoute(builder: (context) {
           return const MainLayoutPrivate();
         },)
         );
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Đăng ký thành công!')),
         );

       }else{
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Đăng ký Thất bại!')),
         );
       }
     }

     @override
     void dispose() {
       _emailController.dispose();
       _passwordController.dispose();
       super.dispose();
     }

    @override
    Widget build(BuildContext context)
    {


        return Container(
            padding: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Column(
                        children: [
                            CustomInputField(
                                label: "Email",
                                hintText: "Bạn hãy nhập email vào",
                              controller: _emailController,
                            ),
                             CustomInputField(
                                label: "Mật khẩu",
                                hintText: "Nhập mật khẩu",
                                obscureText: showPassword,
                              onTapPassword: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              controller: _passwordController,
                              icon: showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,

                            ),
                            const SizedBox(
                                height: 40

                            ),
                            CustomButton(onTap: _submit , btnText: "Đăng ký",btnHeight: 40, btnWidth: 250, btnColor: Colors.orange,fontWeight: FontWeight.w600,),
                            const SizedBox(
                                height: 53
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text("Bạn đã có tài khoản?", style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12
                                                )),
                                            Text("Đăng nhập ngay",style: GoogleFonts.openSans(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12
                                                ))

                                        ]
                                    ),
                                    const SizedBox(
                                        height: 20
                                    ),
                                    Text("Bằng viêch bạn ký, bạn đã đồng ý với Fahasa.com về", style: GoogleFonts.openSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600

                                        )
                                    ),

                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text("Điều khoản sử dụng ", style: GoogleFonts.openSans(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                              color: Colors.blueAccent

                                                )
                                            ),
                                          Text("& ", style: GoogleFonts.openSans(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600

                                          )
                                          ),
                                          Text("Chính sách bảo mật", style: GoogleFonts.openSans(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blueAccent

                                          )
                                          ),
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
