import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithFirebase(String email, String password) async{


    print("#### $email , $password");
      try{
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

        FirebaseFirestore.instance.collection('user').doc(userCredential.user!.uid).set(
          {
            'uid' : userCredential.user!.uid,
            'email':email,
            'createAt': FieldValue.serverTimestamp(),
          }
        );

        User? user = userCredential.user;

        return user;

      }catch(e){

        print('Error: $e');


      }
      return null;

  }

  Future<User?> signInWithFirebase(String email,String password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch(e){
      print("error ko bt $e");
      return null;
    }
  }


}