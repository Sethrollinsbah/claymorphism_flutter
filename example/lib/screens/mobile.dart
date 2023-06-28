import 'package:flutter/material.dart';

import '../background_image_page.dart';
import '../claymorphism_example.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  bool backgroundShow = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                backgroundShow=!backgroundShow;
              });
            },
            child: BgImage(height: size.height, width: size.width, device: 1,)
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      backgroundShow=false;
                    });
                  },
                  child: AnimatedContainer(
                    curve: Curves.decelerate,
                    decoration: const BoxDecoration(
                    color: Colors.black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                    ),
                            width: size.width,
                            height: backgroundShow?size.height*.1:size.height*.9,
                    duration: const Duration(milliseconds: 300),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12)),
                      child:ClaymorphismExample(width: size.width, heightMultiplier: .9,)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}