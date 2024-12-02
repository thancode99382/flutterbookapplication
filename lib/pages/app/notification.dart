import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Noti extends StatelessWidget {
  const Noti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Thông báo"),
      ),
    );
  }
}
