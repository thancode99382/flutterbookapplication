import 'package:doanflutterfahasa/pages/app/detail_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../models/product.dart';

class ProductCart extends StatelessWidget {

  final Product product;

  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailProduct( product: product);
        },
        )
        );
      },
      child: Container(
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.all(5),
          width: 170,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
      
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
      
                    child: Image.network(product.imageUrl)
      
                ),
                Text(
                    product.title,style: GoogleFonts.openSans(
      
                    fontWeight: FontWeight.w500
                ),
                  maxLines: 2, // Giới hạn 2 dòng
                  overflow: TextOverflow.ellipsis,
                ),
                Text("${NumberFormat('#,###','vi_VN').format(product.price)} đ",style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 14
                )
                )
      
              ]
          )
      ),
    );
  }
}
