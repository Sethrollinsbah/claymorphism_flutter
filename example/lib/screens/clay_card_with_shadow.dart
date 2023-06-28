import 'dart:math';

import 'package:flutter/material.dart';

import '../painters.dart';
import 'clay_card.dart';

class CardWithShadow extends StatefulWidget {
  final double height, width,x;
  final List<Color> shadColor;
  
  final Widget child;
  
  final double z, shadowSize;
  
  final Color endColor;

  const CardWithShadow({super.key, this.child=const SizedBox(), required this.shadowSize, required this.height,required this.width, required this.shadColor, required this.x, required this.z, required this.endColor});
  @override
  State<CardWithShadow> createState() => _CardWithShadowState();
}

class _CardWithShadowState extends State<CardWithShadow> {
  double calculateVHeight(double radius, double degree) {
  return radius * sin(degree*pi/180);
}
  double calculateHWidth(double radius, double degree) {
  return radius * -cos(degree*pi/180);
}

// Place contraints - cant go lower than 2 - this centers the page
// Changes the center offset of the page.
double xShadow=4;
double yShadow=4;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration.zero,
            top: calculateVHeight(widget.height/widget.z,widget.x)+(widget.height/yShadow),
            left: calculateHWidth(widget.width/widget.z,widget.x)+(widget.width/xShadow),
            child: Opacity(opacity: 1,
            child: SizedBox(
                width: widget.width/widget.shadowSize,
                height: widget.height/widget.shadowSize,child: CustomPaint(painter: BazShadow(widget.shadColor))),),
          ),
             Center(
                child: ClayCard(height: widget.height/3,width: widget.width/3, x: widget.x, z: widget.z, shadowSize: widget.shadowSize, shadColor: [widget.endColor,Colors.white24, const Color.fromARGB(30, 0, 0, 0),Colors.white10,],),
              ),
    
        ],
      ),
    );
  }
}
