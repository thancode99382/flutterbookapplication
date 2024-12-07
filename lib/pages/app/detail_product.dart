import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../models/product.dart';
import '../../viewmodels/products_view_model.dart';
import '../app/cart.dart';

class DetailProduct extends StatefulWidget
{
    final Product product;
    const DetailProduct({super.key, required this.product});

    @override
    State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct>
{



// Gọi hàm để thêm tất cả sản phẩm


    @override
    Widget build(BuildContext context)
    {
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
                    border: Border.all(
                        color: Colors.black12
                    )
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
                                    Navigator.push(context, MaterialPageRoute(builder: (context)
                                            {
                                                return const Cart();
                                            }
                                        )
                                    );
                                },
                                child: Container(

                                    height: 50,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        border: Border.symmetric(vertical: BorderSide(color: Colors.black12))
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
