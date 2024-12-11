import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderViewModel
{

    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String? get userId => FirebaseAuth.instance.currentUser?.uid;

    Stream<List<Map<String, dynamic>>> productsByOrderStatusStream(String status) {
        return FirebaseFirestore.instance
            .collection('orders')
            .where('status', isEqualTo: status)  // Lọc theo trạng thái đơn hàng
            .snapshots()
            .map((snapshot) {
            // Lọc ra các sản phẩm trong đơn hàng
            return snapshot.docs.expand((doc) {
                var orderData = doc.data();
                // Giả sử trường 'products' là một mảng các sản phẩm trong đơn hàng
                var products = orderData['products'] as List<dynamic>? ?? [];
                return products.map((product) => product as Map<String, dynamic>);
            }).toList();
        });
    }

    Future<void> createOrder() async
    {

        final cartRef = _firestore.collection('carts').doc(userId);
        final orderRef = _firestore.collection('orders').doc();

        final snapshot = await cartRef.get();

        if (snapshot.exists)
        {

            final products = snapshot.data()?['products'] ?? '';

            await orderRef.set(
            {
                'userid':userId,
                'products':products,
                'status':'pending',
                'createAt':FieldValue.serverTimestamp()
            }
            );
            await cartRef.update({'products':[]});
        }
        else
        {
            throw Exception("Không tìm thấy giỏ hàng ");
        }
    }
}
