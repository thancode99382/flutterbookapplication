import 'package:doanflutterfahasa/pages/auth/component/custom_button.dart';
import 'package:doanflutterfahasa/pages/auth/component/custom_input_field.dart';
import 'package:doanflutterfahasa/viewmodels/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'component/showTopSnackBar.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({super.key});

  @override
  State<PersonalProfile> createState() {
    return _PersonalProfileState();
  }




}

class _PersonalProfileState extends State<PersonalProfile>{

  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isLoading = true;

  @override
  void initState(){
    super.initState();
    _loadUserData();

  }

  Future<void> _loadUserData() async{
    String uid = FirebaseAuth.instance.currentUser!.uid;

    try{

      var user = await UserViewModel().getUserData(uid);

      if(user != null){
        usernameController.text = user.username!;
        addressController.text = user.address!;
        phoneController.text = user.phone!;
      }

    }catch(e){
      // Xử lý lỗi
      print('Đã xảy ra lỗi khi cập nhật: $e');
      ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Thông tin chưa được cập nhật",context: context);
    }
  }



  void _updateUser(BuildContext context) async{

    try{
      String uid = FirebaseAuth.instance.currentUser!.uid;

      await UserViewModel().updateUserData(
          uid: uid,
          username: usernameController.text,
          address: addressController.text,
          phone: phoneController.text
      );
// Hiển thị thông báo thành công (tuỳ chọn)
      ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Bạn đã cập nhật thông tin thành công",context: context);




    }catch(e){
// Xử lý lỗi
      print('Đã xảy ra lỗi khi cập nhật: $e');
      ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Vui lòng cập nhật thông tin",context: context);
    }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       iconTheme: const IconThemeData(
         color: Colors.white
       ),
        backgroundColor: Colors.red,
        title: Text(
            'Cập nhật thông tin',style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )
        )
        ),
      ),

      body: Padding(
          padding: const EdgeInsets.all(20),

        child: Column(
          children: [
           CustomInputField(label: "Họ và tên", hintText: "" ,controller: usernameController,),
            CustomInputField(label: "Số điện thoại", hintText: "",controller: phoneController ,),
            CustomInputField(label: "Địa chỉ", hintText: "", controller:addressController,)
          ],
        ),

      ),


      bottomSheet: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10, // Độ mờ của bóng
              spreadRadius: 1, // Độ rộng của bóng
              offset: const Offset(0,-2) // Vị trí bóng (0 ngang , - 2 dọc lên trên)
            )
          ]
        ) ,
        child: ElevatedButton(onPressed: ()=> _updateUser(context),
            style: ElevatedButton.styleFrom(

                backgroundColor: Colors.red,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                )



            ),
            child: Center(

                child: Text("Lưu thay đổi",
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    )
                )
            )
        ),
      ),

    );
  }
}