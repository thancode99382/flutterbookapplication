import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryViewList extends StatelessWidget {

  final String imageUrlCategory;
  final String title;
  final String price;
  final String nameCategory;


  const CategoryViewList({super.key, required this.imageUrlCategory, required this.title, required this.price, required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  children: [
                    SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
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
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      itemBuilder: (context, index)
                      {
                        return Container(
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

                                      child: Image.network("https://cdn0.fahasa.com/media/catalog/product/8/9/8935325011559.jpg")

                                  ),
                                  Text(
                                      title,style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600
                                  )
                                  ),
                                  Text(price,style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: 16
                                  )
                                  )

                                ]
                            )
                        );
                      }
                  )
              ),
              const SizedBox(height: 11),
              Padding(
                  padding: const EdgeInsets.only(left: 130),
                  child: SizedBox(
                      height: 35,
                      child: ElevatedButton(
                          onPressed: ()
                          {
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
                  )
              )

            ]
        )
    );
  }
}
