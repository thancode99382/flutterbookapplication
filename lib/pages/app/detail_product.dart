import 'package:doanflutterfahasa/pages/main_layout_private.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/NavigatorProvider.dart';
import '../../viewmodels/products_view_model.dart';
import '../app/cart.dart';
import '../main_layout_public.dart';



class DetailProduct extends StatelessWidget
{
  final Product product;
  const DetailProduct({super.key, required this.product});


// Gọi hàm để thêm tất cả sản phẩm


    @override
    Widget build(BuildContext context)
    {

      final navigationProvider = Provider.of<NavigationProvider>(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: const IconThemeData(
                    color: Colors.white
                ),
                backgroundColor: Colors.red

            ),

            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 70),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                            Image.network(product.imageUrl),

                            Text("${NumberFormat('#,###','vi_VN').format(product.price)} đ",style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 24
                                )

                            ),
                            Text(product.title,style: GoogleFonts.openSans(


                                )
                            ),
                            Text("Còn ${product.stock} quyển",style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey
                                )
                            ),
                            const SizedBox(
                                height: 30
                            ),

                            Text("Thông tin sản phẩm",style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700

                                )
                            ),
                            const SizedBox(
                                height: 10
                            ),
                            Table(
                                border: const TableBorder(
                                    horizontalInside: BorderSide.none, // Ẩn các viền ngang giữa các hàng
                                    verticalInside: BorderSide.none // Ẩn các viền dọc giữa các cột
                                ),
                                children: [
                                    TableRow(
                                        children: [
                                            Container(

                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Text("Tác giả",style: GoogleFonts.openSans(
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.grey

                                                    )
                                                )
                                            ),
                                            Container(

                                                padding: const EdgeInsets.symmetric(vertical: 8),
                                                child: Text(product.author,style: GoogleFonts.openSans(
                                                        fontWeight: FontWeight.w700

                                                    )
                                                )
                                            )
                                        ]
                                    )

                                ]
                            ),

                            Text(product.title,style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold

                                )
                            ),
                            Text(product.description,style: GoogleFonts.openSans(

                                )
                            )

                        ]
                    )
                )
            ),

            bottomSheet: Container(
                height: 50,
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

                child: Row(
                    children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide(color: Colors.black12))
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        IconButton(onPressed: ()
                                            {
                                            }, icon: const FaIcon(FontAwesomeIcons.minus,size: 14,color: Colors.grey)),
                                        Text("1",style: GoogleFonts.openSans(

                                                fontSize: 19,
                                                fontWeight: FontWeight.bold

                                            )),
                                        IconButton(onPressed: ()
                                            {


                                            }, icon: const FaIcon(FontAwesomeIcons.plus,size: 14,color: Colors.grey))
                                    ]
                                )
                            )
                        ),
                        Expanded(
                            flex: 4,
                            child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide(color: Colors.black12))
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text("Thêm vào",style: GoogleFonts.openSans(
                                                color: Colors.red,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold
                                            )),
                                        Text("giỏ hàng",style: GoogleFonts.openSans(
                                                color: Colors.red,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold
                                            ))
                                    ]
                                )
                            )
                        ),
                        Expanded(
                            flex: 4,
                            child: GestureDetector(
                                onTap: ()
                                {
                                  User? user = FirebaseAuth.instance.currentUser;

                                  if(user == null){
                                    navigationProvider.updateIndex(1);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MainLayoutPublic()),
                                          (route) => false, // Xóa tất cả các route trước đó
                                    );
                                  }else{
                                    navigationProvider.updateIndex(4);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => const MainLayoutPrivate()),
                                          (route) => false, // Xóa tất cả các route trước đó
                                    );
                                  }



                                },
                                child: Container(

                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,

                                    ),
                                    child: Center(
                                        child: Text("Mua ngay",style: GoogleFonts.openSans(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold
                                            ))
                                    )
                                )
                            )
                        )
                    ]
                )
            )

        );
    }
}
