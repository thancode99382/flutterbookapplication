import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggest extends StatelessWidget {
  const Suggest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Gợi ý"),
      ),
    );
  }
}
