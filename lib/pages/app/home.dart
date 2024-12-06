import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doanflutterfahasa/pages/app/component/category_view_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component/custom_banner.dart';

class Home extends StatelessWidget
{
    const Home({super.key});

    @override
    Widget build(BuildContext context)
    {

        final List<Map<String,dynamic>> itemSuggest = [
        {"image":"assets/images/xakho.png", "name":"Xả kho"},
        {"image":"assets/images/tanviet.png", "name":"Tân việt"},
        {"image":"assets/images/firstnew.png", "name":"First New"},
        {"image":"assets/images/magiamgia.png", "name":"Mã giảm"},
        {"image":"assets/images/sanphammoi.png", "name":"Sp mới"},
        {"image":"assets/images/trogia.png", "name":"Trợ giá"},
        {"image":"assets/images/chodocu.png", "name":"Ch đồ cũ"},
        {"image":"assets/images/bansi.png", "name":"Bán sĩ"},
        {"image":"assets/images/manga.png", "name":"Manga"},
        {"image":"assets/images/vanhoc.png", "name":"Ngoại văn"}

        ];

        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
                children: [
                    SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                // Carousel Slider
                                CarouselSlider(
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        viewportFraction: 1
                                    ),
                                    items: const [
                                        CustomBanner(assetImage: "assets/images/banner1.png"),
                                        CustomBanner(assetImage: "assets/images/banner2.png"),
                                        CustomBanner(assetImage: "assets/images/banner3.png")
                                    ]
                                ),

                                // GridView (Sử dụng ShrinkWrap)
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: GridView.builder(
                                        shrinkWrap: true, // Cho phép GridView hiển thị bên trong SingleChildScrollView
                                        physics: const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn trong GridView
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5, // Số cột
                                            mainAxisSpacing: 10.0,
                                            crossAxisSpacing: 10.0,
                                            childAspectRatio: 0.9
                                        ),
                                        itemCount: itemSuggest.length,
                                        itemBuilder: (context, index)
                                        {
                                            return Column(
                                                children: [
                                                    Image.asset(
                                                        itemSuggest[index]["image"],
                                                        height: 50,
                                                        width: 50
                                                    ),
                                                    const SizedBox(height: 2),
                                                    Text(
                                                        itemSuggest[index]["name"],
                                                        style: GoogleFonts.openSans(
                                                            textStyle: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w600
                                                            )
                                                        )
                                                    )
                                                ]
                                            );
                                        }
                                    )
                                ),

                                // ListView Horizontal
                                const CategoryViewList(
                                  imageUrlCategory: "assets/images/xakho.png",
                                  title:"Đám Trẻ Ở Đại Dương Đen" ,
                                  price: "100000 d",
                                  nameCategory: "Xu hướng mua sắm",
                                ),

                            ]
                        )
                    )
                ]
            )
        );

    }
}
