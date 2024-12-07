import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/product.dart';
import '../../viewmodels/products_view_model.dart';
import 'component/product_cart.dart';

class MoreProduct extends StatefulWidget
{

    final String categoryId;
    const MoreProduct({super.key, required this.categoryId});

    @override
    State<MoreProduct> createState() => _MoreProductState();
}

class _MoreProductState extends State<MoreProduct>
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(

            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: const IconThemeData(
                    color: Colors.white
                ),
                backgroundColor: Colors.red,
                title: Text("Xem thêm",style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        )
                    )
                )

            ),
          body: CustomScrollView(
            slivers: [
              FutureBuilder<List<Product>>(
                future: ProductsViewModel().getProductsByCategory(widget.categoryId),
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  if(snapshot.hasError){
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text("An error occurred!"),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text("No products found!"),
                      ),
                    );
                  }
                  final products = snapshot.data??[];

                  return SliverPadding(

                    padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 15),
                    sliver: SliverGrid(

                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.75
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: products.length,
                              (context, index) {
                               final product = products[index];
                            return  ProductCart(product: product);
                          },
                      )
                      ,),

                  );

                },

              )


            ],
          ),

        );
    }
}
