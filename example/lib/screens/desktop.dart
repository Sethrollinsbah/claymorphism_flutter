
import 'package:flutter/material.dart';

import '../background_image_page.dart';
import '../claymorphism_example.dart';

class Desktop extends StatefulWidget {
  const Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(children: [
        BgImage(width: size.width*.5, height: size.height, device: 3,),
        ClaymorphismExample(width: size.width*.5,)
      ]),
    );
  }
}