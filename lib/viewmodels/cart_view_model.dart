import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartViewModel{

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // lấy uid người từ firebaseAuth

    String? get userId => FirebaseAuth.instance.currentUser?.uid;

    Future<void> addToCart(String productId , imageUrl ,String productName, double price , int quantity)async{
      final cartRef  = _firestore.collection('carts').doc(userId);

      final snapshot = await cartRef.get();

      if(snapshot.exists){

        List<dynamic> products = snapshot.data()?['products'] ??[];
        final index = products.indexWhere((product)=>product['productId'] == productId );

        if(index != -1){
          products[index]['quantity'] += quantity;
        }else{
          products.add({
            'productId':productId,
            'productName': productName,
            'price':price,
            'quantity':quantity,
            'imageUrl':imageUrl
          });
        }

        await cartRef.update({'products': products });
      }

    }


    Stream<DocumentSnapshot<Map<String,dynamic>>> get cartStream{

      return FirebaseFirestore.instance.collection('carts').doc(userId).snapshots();
    }





    void updateProductCart(String productId ,String action) async {


      print(productId);
      print(action);

      try {
        final cartRef = _firestore.collection('carts').doc(userId);


        final snapshot = await cartRef.get();

        if (snapshot.exists) {
          List<dynamic> products = snapshot.data()?['products'] ?? [];
          final index = products.indexWhere((product) =>
          product['productId'] == productId);

          if (index != -1) {

            if (action == 'increase') {
              products[index]['quantity'] += 1;
            } else if (action == 'decrease') {
              if (products[index]['quantity'] > 1) {
                products[index]['quantity'] -= 1;
              }
            } else if (action == 'delete') {
              products.removeAt(index);
            }






            await cartRef.update({
              'products': products,  // Cập nhật lại mảng sản phẩm sau khi xóa
            });



          }
        }
      } catch (e) {
        print(e);
      }
    }





}