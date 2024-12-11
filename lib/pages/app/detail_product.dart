import 'package:doanflutterfahasa/pages/main_layout_private.dart';
import 'package:doanflutterfahasa/viewmodels/cart_view_model.dart';
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
import 'component/showTopSnackBar.dart';



class DetailProduct extends StatefulWidget{
  final Product product;
  const DetailProduct({super.key, required this.product});

  @override
  State<DetailProduct> createState() {
    return _DetailProductState();
  }

}




class _DetailProductState extends State<DetailProduct>
{


  int quantity = 1;

      void _addToCart(NavigationProvider navigationProvider )async{
        User? user = FirebaseAuth.instance.currentUser;

        if(user == null){
          navigationProvider.updateIndex(1);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainLayoutPublic()),
                (route) => false, // Xóa tất cả các route trước đó
          );
        }else{
          try{

            await CartViewModel().addToCart(widget.product.id,widget.product.imageUrl, widget.product.title, widget.product.price, quantity);



            ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Bạn đã thêm sản phẩm vào giỏ hàng",context: context);


          }catch(e){




            print("occur error${e}");
          }


        }



      }


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


                            Image.network(widget.product.imageUrl),

                            Text("${NumberFormat('#,###','vi_VN').format(widget.product.price)} đ",style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 24
                                )

                            ),
                            Text(widget.product.title,style: GoogleFonts.openSans(


                                )
                            ),
                            Text("Còn ${widget.product.stock} quyển",style: GoogleFonts.openSans(
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
                                                child: Text(widget.product.author,style: GoogleFonts.openSans(
                                                        fontWeight: FontWeight.w700

                                                    )
                                                )
                                            )
                                        ]
                                    )

                                ]
                            ),

                            Text(widget.product.title,style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.bold

                                )
                            ),
                            Text(widget.product.description,style: GoogleFonts.openSans(

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
                            flex: 4,
                            child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    border: Border.symmetric(vertical: BorderSide(color: Colors.black12))
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        IconButton(onPressed: () {

                                          setState(() {

                                            quantity>0?quantity-=1:quantity=0;
                                          });
                                        }, icon: const FaIcon(FontAwesomeIcons.minus,size: 14,color: Colors.grey)),
                                        Text("$quantity",style: GoogleFonts.openSans(

                                                fontSize: 16,
                                                fontWeight: FontWeight.bold

                                            )
                                        ),
                                        IconButton(onPressed: ()
                                            {

                                              setState(() {
                                                quantity+=1;
                                              });
                                            }, icon: const FaIcon(FontAwesomeIcons.plus,size: 14,color: Colors.grey))
                                    ]
                                )
                            )
                        ),
                        Expanded(
                            flex: 5,
                            child: GestureDetector(
                              onTap: ()=> _addToCart(navigationProvider),
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
                                              )
                                          )
                                      ]
                                  )
                              ),
                            )
                        ),
                        Expanded(
                            flex: 5,
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

                                    _addToCart(navigationProvider);

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
