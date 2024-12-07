import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanflutterfahasa/models/category.dart';
import 'package:doanflutterfahasa/models/product.dart';

class ProductsViewModel
{

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<List<Category>> getCategories() async
    {
        final snapshot = await _firestore.collection('categories').get();
        return snapshot.docs.map((doc)=>Category.fromMap(doc.id,doc.data())).toList();
    }

    Future<List<Product>> getProductsByCategory(String categoryId) async {


        final snapshot = await _firestore
            .collection('products')
            .where('categoryId', isEqualTo: categoryId)
            .get();


        return snapshot.docs
            .map((doc) => Product.fromMap(doc.id, doc.data()))
            .toList();
    }


    // Future<void> addMultipleProducts(List<Map<String, dynamic>> products) async {
    //     // Lấy tham chiếu tới Firestore
    //     FirebaseFirestore firestore = FirebaseFirestore.instance;
    //
    //     // Tạo một batch write
    //     WriteBatch batch = firestore.batch();
    //
    //     // Lặp qua danh sách sản phẩm và thêm từng sản phẩm vào batch
    //     for (var product in products) {
    //         // Tạo tham chiếu tới collection nơi lưu trữ sản phẩm
    //         DocumentReference productRef = firestore.collection('products').doc();
    //
    //         // Thêm yêu cầu ghi vào batch
    //         batch.set(productRef, product);
    //     }
    //
    //     // Thực hiện tất cả các thao tác trong batch
    //     try {
    //         await batch.commit();
    //         print("Đã thêm ${products.length} sản phẩm thành công");
    //     } catch (e) {
    //         print("Lỗi khi thêm sản phẩm: $e");
    //     }
    // }



}
