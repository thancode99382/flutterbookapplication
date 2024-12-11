import 'package:doanflutterfahasa/pages/app/personal_profile.dart';
import 'package:doanflutterfahasa/pages/auth/register.dart';
import 'package:doanflutterfahasa/pages/main_layout_public.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'component/showTopSnackBar.dart';
import 'my_order.dart';

class Account extends StatelessWidget
{
    Account({super.key});

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final List<Map<String,dynamic>> stateOrders = [
    {"icon": FontAwesomeIcons.creditCard, "name":"Chờ thanh toán"},
    {"icon": FontAwesomeIcons.box, "name":"Đang xử lý"},
    {"icon": FontAwesomeIcons.truck, "name":"Đang giao hàng"},
    {"icon": FontAwesomeIcons.check, "name":"Hoàn tất"}
    ];

    final List<Map<String,dynamic>> AccountMenuLists = [
    {"icon": Icons.airplane_ticket_outlined, "title":"Ví voucher" , "color":Colors.green},
    {"icon": Icons.currency_bitcoin, "title":"Tài khoản F-point", "color":Colors.orange},
    {"icon": Icons.gamepad, "title":"Hoạt động F-game", "color":Colors.deepPurple},
    {"icon": Icons.favorite_border, "title":"Sản phẩm yêu thích", "color":Colors.red},
    {"icon": Icons.book_outlined, "title":"Sách theo bộ", "color":Colors.blueAccent},
    {"icon": Icons.person_outline, "title":"Hồ sơ cá nhân", "color":Colors.red},
    {"icon": Icons.help_outline, "title":"Trung tâm trợ giúp", "color":Colors.green}

    ];

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.red,
                title: Text("Tài khoản",style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold

                        )
                    )
                )

                ,
                actions: [
                    IconButton(onPressed: ()
                        {
                            _scaffoldKey.currentState?.openDrawer();
                        }, icon: const FaIcon(FontAwesomeIcons.gear,size: 20,color: Colors.white))
                ]

            ),
            drawer: Drawer(
                backgroundColor: Colors.black.withOpacity(0.5),

                child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                        const DrawerHeader(decoration: BoxDecoration(


                            ),
                            child: Center(
                                child: FaIcon(FontAwesomeIcons.book,color: Colors.white , size: 50)
                            )
                        ),
                        Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                    GestureDetector(
                                        onTap: () async
                                        {
                                            await FirebaseAuth.instance.signOut();
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(builder: (context) => const MainLayoutPublic()),
                                                (route) => false // Xóa tất cả các route trước đó
                                            );
                                        },
                                        child: ListTile(
                                            leading: const Icon(Icons.logout,color: Colors.white,),
                                            title: Text('L O G O U T' ,style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w500,
                                              color: Colors.white
                                                ))
                                        )
                                    )
                                ]
                            )
                        )

                    ]
                )
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: [
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            padding: EdgeInsets.all(10),
                            height: 150, // Chiều cao của phần đầu tiên
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                                          return MyOrder();
                                        },
                                        )
                                        );
                                      },
                                      child: Text("Đơn hàng của tôi",style: GoogleFonts.openSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold

                                              )
                                          )
                                      ),
                                    ),
                                    Center(
                                        child: Container(
                                            height: 90,

                                            child: GridView.builder(
                                                physics: const NeverScrollableScrollPhysics(), // Tắt cuộn của GridView
                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 4
                                                ) ,
                                                itemCount: stateOrders.length,
                                                itemBuilder: (context, index)
                                                {
                                                    final stateOrder = stateOrders[index];
                                                    return Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                            Container(
                                                                height: 50,
                                                                width: 50,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                                                    color: Colors.black12
                                                                ),
                                                                child: Center(child: FaIcon(stateOrder['icon'],color: Colors.black,size: 16))
                                                            ),
                                                            Text(stateOrder["name"],style: GoogleFonts.openSans(
                                                                    color: Colors.grey,
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500

                                                                ))
                                                        ]
                                                    );
                                                }
                                            )
                                        )
                                    )

                                ]
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.all(10),
                            height: 500,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(), // Tắt cuộn của GridView
                                itemCount: AccountMenuLists.length,
                                itemBuilder: (context, index)
                                {
                                    return GestureDetector(
                                        onTap: ()
                                        {

                                            if (AccountMenuLists[index]['title'] == "Hồ sơ cá nhân")
                                            {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)
                                                        {
                                                            return PersonalProfile();
                                                        }
                                                    )
                                                );
                                            }
                                            else
                                            {
                                              ShowTopSnackBar().snackBar(icon: Icons.info_outline_rounded , title: "Thông báo",message: "Tính này sẽ sớm phát hành",context: context);                                            }

                                        },
                                        child: ListTile(
                                            leading: Icon(AccountMenuLists[index]["icon"],color: AccountMenuLists[index]["color"]),
                                            title: Text(AccountMenuLists[index]["title"],style: GoogleFonts.openSans(
                                                    fontSize: 14
                                                )
                                            )
                                        )
                                    );
                                } 
                            ) 
                        )

                    ]
                )
            )

        );

    }
}
