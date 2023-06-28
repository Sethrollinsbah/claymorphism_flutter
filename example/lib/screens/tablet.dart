import 'package:flutter/material.dart';

import '../background_image_page.dart';
import '../claymorphism_example.dart';

class Tablet extends StatefulWidget {
  const Tablet({super.key});

  @override
  State<Tablet> createState() => _TabletState();
}

class _TabletState extends State<Tablet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(children: [
        BgImage(width: size.width*.225, height: size.height, device:0),
        ClaymorphismExample(width: size.width*.775,)
      ]),
    );
  }
}