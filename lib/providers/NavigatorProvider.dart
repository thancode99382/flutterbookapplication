

import 'package:flutter/cupertino.dart';

class NavigationProvider with ChangeNotifier{


  int _selectedIndex = 0;

  int get selectIndex => _selectedIndex;

  void updateIndex(int index){
    _selectedIndex = index;
    notifyListeners();

  }
}