import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doanflutterfahasa/pages/app/component/category_view_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/category.dart';
import '../../viewmodels/products_view_model.dart';
import 'component/custom_banner.dart';
import 'component/showTopSnackBar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemSuggest = [
      {"image": "assets/images/xakho.png", "name": "Xả kho"},
      {"image": "assets/images/tanviet.png", "name": "Tân việt"},
      {"image": "assets/images/firstnew.png", "name": "First New"},
      {"image": "assets/images/magiamgia.png", "name": "Mã giảm"},
      {"image": "assets/images/sanphammoi.png", "name": "Sp mới"},
      {"image": "assets/images/trogia.png", "name": "Trợ giá"},
      {"image": "assets/images/chodocu.png", "name": "Ch đồ cũ"},
      {"image": "assets/images/bansi.png", "name": "Bán sĩ"},
      {"image": "assets/images/manga.png", "name": "Manga"},
      {"image": "assets/images/vanhoc.png", "name": "Ngoại văn"}
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Carousel Slider
          SliverToBoxAdapter(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
              ),
              items: const [
                CustomBanner(assetImage: "assets/images/banner1.png"),
                CustomBanner(assetImage: "assets/images/banner2.png"),
                CustomBanner(assetImage: "assets/images/banner3.png"),
              ],
            ),
          ),

          // GridView (Sử dụng SliverGrid)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,  // Số cột
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Chức năng này chưa có",context: context);
                      },
                      child: Column(
                      children: [
                        Image.asset(
                          itemSuggest[index]["image"],
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          itemSuggest[index]["name"],
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                                        ),
                    );
                },
                childCount: itemSuggest.length,
              ),
            ),
          ),

          // ListView Vertical (Sử dụng SliverList)
          FutureBuilder<List<Category>>(
            future: ProductsViewModel().getCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
              }
              if (snapshot.hasError) {
                return const SliverToBoxAdapter(child: Center(child: Text("Have error")));
              }
              final categories = snapshot.data ?? [];

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final category = categories[index];
                    return CategoryViewList(
                      imageUrlCategory: category.imageUrl,
                      nameCategory: category.name,
                      categoryId: category.id,
                    );
                  },
                  childCount: categories.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
