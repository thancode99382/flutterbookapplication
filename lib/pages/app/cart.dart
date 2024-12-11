import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doanflutterfahasa/pages/auth/component/custom_button.dart';
import 'package:doanflutterfahasa/viewmodels/cart_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../viewmodels/order_view_model.dart';
import 'component/showTopSnackBar.dart';
import 'info_completed_order.dart';

class Cart extends StatelessWidget
{
    const Cart({super.key});

    @override
    Widget build(BuildContext context)
    {
        return StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
            stream: CartViewModel().cartStream,
            builder: (context, snapshot)
            {

                if (snapshot.connectionState == ConnectionState.waiting)
                {
                    return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.data() == null)
                {
                    return const Center(
                        child: Text("Giỏ hàng trống")
                    );
                }

                final cartData = snapshot.data!.data()!;

                final products = List<Map<String,dynamic>>.from(cartData['products'] ?? []);

                double totalAMount = 0.0;

                for (var product in products)
                {
                    totalAMount += product['quantity'] * product['price'];
                }

                return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                        automaticallyImplyLeading: false,
                        iconTheme: const IconThemeData(color: Colors.white),
                        backgroundColor: Colors.red,
                        title: Text("Giỏ hàng",
                            style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                    ),

                    body: Padding(
                        padding: const EdgeInsets.only(top: 20 ,right: 20,left: 20,bottom: 60),
                        child: ListView.builder(
                            itemCount: products.length ,
                            itemBuilder: (BuildContext context, int index)
                            {
                                final product = products[index];
                                return Container(
                                    height: 120,
                                    padding: EdgeInsets.symmetric(vertical: 5),

                                    child: Row(
                                        children: [
                                            Image.network(product['imageUrl']),
                                            SizedBox(
                                                width: 250,
                                                child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [

                                                        Text(product['productName'],
                                                            maxLines: 2, // Giới hạn 2 dòng
                                                            overflow: TextOverflow.ellipsis,
                                                            style: GoogleFonts.openSans(
                                                                textStyle: const TextStyle(
                                                                )
                                                            )
                                                        ),
                                                        const SizedBox(
                                                            height: 5
                                                        ),
                                                        Text("${NumberFormat('#,###','vi_VN').format(product['price'])} đ",
                                                            style: GoogleFonts.openSans(
                                                                textStyle: const TextStyle(
                                                                    color: Colors.orange,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 12
                                                                )
                                                            )
                                                        ),
                                                        Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                                Container(
                                                                    height: 30,
                                                                    width: 100,

                                                                    decoration: const BoxDecoration(
                                                                        color: Colors.black12

                                                                    ),
                                                                    child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                            GestureDetector(
                                                                                onTap: ()
                                                                                {
                                                                                    CartViewModel().updateProductCart(product['productId'],'decrease');
                                                                                },
                                                                                child: Container(
                                                                                    color: Colors.transparent,
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    child: const Center(
                                                                                        child: FaIcon(
                                                                                            FontAwesomeIcons.minus,size: 14
                                                                                        )
                                                                                    )
                                                                                )
                                                                            ),

                                                                            Container(
                                                                                width: 30,
                                                                                margin: EdgeInsets.symmetric(vertical: 3),
                                                                                decoration: const BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    borderRadius: BorderRadius.all(Radius.circular(3))
                                                                                ),

                                                                                child: Center(
                                                                                    child: Text("${product['quantity']}",
                                                                                        style: GoogleFonts.openSans(
                                                                                            textStyle: const TextStyle(
                                                                                                fontWeight: FontWeight.bold
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                )
                                                                            ),

                                                                            GestureDetector(
                                                                                onTap: ()
                                                                                {
                                                                                    CartViewModel().updateProductCart(product['productId'],'increase');
                                                                                },
                                                                                child: Container(
                                                                                    color: Colors.transparent,
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    child: const Center(
                                                                                        child: FaIcon(
                                                                                            FontAwesomeIcons.plus,size: 14
                                                                                        )
                                                                                    )
                                                                                )
                                                                            )
                                                                        ]
                                                                    )

                                                                ),

                                                                IconButton(onPressed: ()
                                                                    {
                                                                        CartViewModel().updateProductCart(product['productId'],'delete');
                                                                        ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Bạn đã xóa sản phẩm",context: context);

                                                                    }, icon: const FaIcon(FontAwesomeIcons.trashCan,size: 19))

                                                            ]
                                                        )
                                                    ]
                                                )
                                            )
                                        ]
                                    )
                                );
                            }

                        )

                    ),
                    bottomSheet: Container(
                        height: 60,
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
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text("Thành tiền",
                                                style: GoogleFonts.openSans(
                                                    textStyle: const TextStyle(
                                                    )
                                                )
                                            ),
                                            Text("${NumberFormat('#,###','vi_VN').format(totalAMount)} đ",
                                                style: GoogleFonts.openSans(
                                                    textStyle: const TextStyle(
                                                        color: Colors.orange,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15
                                                    )
                                                )
                                            )
                                        ]
                                    ),
                                    SizedBox(height: 40,
                                        child: CustomButton(
                                            onTap: ()
                                            {

                                                try
                                                {

                                                    if (products.isEmpty)
                                                    {
                                                      ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Giỏ hàng trống",context: context);


                                                    }else{
                                                      OrderViewModel().createOrder();
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)
                                                      {
                                                        return const InforCompletedOder();
                                                      }
                                                      )
                                                      );
                                                    }

                                                }
                                                catch(e)
                                                {
                                                    print(e);
                                                }

                                            }, btnText: "Mua" , btnColor: Colors.orange,btnWidth: 150,fontWeight: FontWeight.bold))
                                ]
                            )
                        )
                    )
                );

            }
        );
    }
}

