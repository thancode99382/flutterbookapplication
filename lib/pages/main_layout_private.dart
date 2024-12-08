import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/NavigatorProvider.dart';
import 'app/account.dart';
import 'app/cart.dart';
import 'app/home.dart';
import 'app/notification.dart';
import 'app/suggest.dart';

class MainLayoutPrivate extends StatelessWidget{


  const MainLayoutPrivate({super.key});


  // Danh sách các trang
  static const List<Widget> _pages = <Widget>[
    Home(),
    Account(),
    Suggest(),
    Noti(),
    Cart(),
  ];



  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: _pages[navigationProvider.selectIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 9,
                color: Colors.red,
                fontWeight: FontWeight.w700
            )
        ),
        selectedItemColor: Colors.red,
        unselectedLabelStyle:  GoogleFonts.openSans(
            textStyle: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700
            )
        ),
        currentIndex: navigationProvider.selectIndex,
        onTap: navigationProvider.updateIndex,

        items: const [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house, size: 17), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.user, size: 17), label: 'Tài khoản'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.star, size: 17), label: 'Gợi ý'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.bell, size: 17), label: 'Thông báo'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.opencart, size: 17), label: 'Giỏ hàng'),
        ],
      ),
    );
  }



}