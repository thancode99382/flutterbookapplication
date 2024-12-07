import 'package:doanflutterfahasa/pages/app/component/product_cart.dart';
import 'package:doanflutterfahasa/pages/app/more_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../viewmodels/products_view_model.dart';

class CategoryViewList extends StatelessWidget {

  final String imageUrlCategory;
  final String nameCategory;
  final String categoryId;


  const CategoryViewList({super.key, required this.imageUrlCategory, required this.nameCategory, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.network(
                            imageUrlCategory,
                            width: 50,
                            height: 50
                        )
                    ),
                    const SizedBox(width: 10),
                    Text(
                        nameCategory,
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                  ]
              ),
              const SizedBox(height: 15),
              SizedBox(
                  height: 250,
                  child: FutureBuilder(
                    future: ProductsViewModel().getProductsByCategory(categoryId),
                     builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {

                          return const Center(
                            child: Text("Error:"),
                          );
                        }

                        // Xử lý khi không có dữ liệu hoặc danh sách rỗng
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text("No products available in this category."),
                          );
                        }

                        final products = snapshot.data!;

                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: products.length,
                            itemBuilder: (context, index)
                            {
                              final product = products[index];
                              return ProductCart(product: product,);
                            }
                        );
                  },
                  )




              ),
              const SizedBox(height: 11),


                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(
                          height: 35,
                          child: ElevatedButton(
                              onPressed: ()
                              {

                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return MoreProduct(categoryId: categoryId);
                                },));
                              },
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.red
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(3))
                                  )

                              ),

                              child: Text("Xem thêm", style: GoogleFonts.openSans(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              )

                          )
                      )
                                   ),
                   ],
                 )

            ]
        )
    );
  }
}
