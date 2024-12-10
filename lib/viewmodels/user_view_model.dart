import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart';

class UserViewModel
{

    Future<void> updateUserData({
        required String uid,
        String? username,
        String? address,
        String? phone
    })async
    {

        try
        {
            await FirebaseFirestore.instance.collection('user').doc(uid).update(
            {
                'username': username,
                'address' : address,
                'phone' : phone

            }
            );

            print("update information successfully");
        }
        catch(e)
        {
            print("occur error: $e ");
        }

    }



    Future<User?> getUserData(String uid) async{
        try{
            DocumentSnapshot documentSnapshot = await FirebaseFirestore
                .instance.collection('user')
                .doc(uid)
                .get();

            if(documentSnapshot.exists){
                return User.fromMap(documentSnapshot.data() as Map<String ,dynamic>);
            }else{
                print('Người dùng không tồn tại.');
                return null;
            }

        }catch(e){
            print('Đã xảy ra lỗi khi lấy thông tin người dùng: $e');
            return null;
        }
    }
}
