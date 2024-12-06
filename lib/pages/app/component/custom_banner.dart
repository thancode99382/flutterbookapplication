import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CustomBanner extends StatelessWidget
{

    final String assetImage;

    const CustomBanner({super.key, required this.assetImage});

    @override
    Widget build(BuildContext context)
    {
        return  Stack(
                children: [
                    Column(
                        children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(assetImage),
                                        fit: BoxFit.cover // Đảm bảo hình ảnh bao phủ toàn bộ container
                                    )
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10 , sigmaY: 10) ,child: const Text(""))
                            // Đảm bảo bo góc cho ảnh
                            ),
                          

                        ]
                    ),

                    Positioned(
                        left: 30, top: 100,
                        child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(20)),child: Image.asset(assetImage, width: 350 ,)))

                ]
            );


    }
}
