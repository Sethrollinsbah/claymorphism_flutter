
import 'dart:math';

import 'package:flutter/material.dart';

import '../painters.dart';

class ClayCard extends StatefulWidget {
  final double height, width,x;
  final List<Color> shadColor;
  
  final Widget child;
  
  final double z, shadowSize;

  const ClayCard({super.key, this.z=5, this.child=const SizedBox(), this.shadowSize=5, required this.height,required this.width, this.shadColor=const [Color.fromARGB(99, 8, 47, 113),Colors.white24, Color.fromARGB(30, 0, 0, 0),Colors.white10], this.x = 180});

  @override
  State<ClayCard> createState() => _ClayCardState();
}

class _ClayCardState extends State<ClayCard> {
  // Offset _position = const Offset(-1100, 0);
  
  bool showImprintPainter = false;
  

double getQ1(double x) {
  if (x > 270 && x <= 360) {
    return x / 90 - 3;
  } else if (x >= 0 && x <= 90) {
    return 1 - x / 90;
  } else {
    return 0;
  }
}

double getQ2(double x) {
  if (x > 0 && x <= 90) {
    return x / 90;
  } else if (x > 90 && x <= 180) {
    return 2 - x / 90;
  } else {
    return 0;
  }
}

double getQ4(double x) {
  if (x > 180 && x <= 270) {
    return x / 90 - 2;
  } else if (x > 270 && x <= 360) {
    return 4 - x / 90 ;
  } else {
    return 0;
  }
}

double getQ3(double x) {
  if (x > 90 && x <= 180) {
    return x / 90 - 1;
  } else if (x > 180 && x <= 270) {
    return 3 - x / 90;
  } else {
    return 0;
  }
}


double normalizedVal(int min, int max, double x){
 return log(x - min + 1) / log(max - min + 1);
}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 01,
        child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: CustomPaint(
          painter: BazaarMainPainter(widget.shadColor),
        ),
      ),
      ),


      Opacity(
          opacity:normalizedVal(1,100,widget.z),
        child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: CustomPaint(
          painter: BazaarCenterPainter(widget.shadColor),
        ),
      ),
      ),

      //  Left lightsource
        Opacity(
          opacity: normalizedVal(0,6,getQ3(widget.x)*widget.shadowSize),
          child: SizedBox(
    width: widget.width,
    height: widget.height,
    child: CustomPaint(
    painter: BazaarLeftPainter(widget.shadColor),
    ),
    ),
        ),

        // Right lightsource
        Opacity(
          opacity: normalizedVal(0,6,getQ1(widget.x)*widget.shadowSize),
          child: SizedBox(
    width: widget.width,
    height: widget.height,
    child: CustomPaint(
    painter: BazaarRightPainter(widget.shadColor),
    ),
    ),
        ),

        // Top lightsource
        Opacity(
          opacity: normalizedVal(0,6,getQ2(widget.x)*widget.shadowSize),
          child: SizedBox(
    width: widget.width,
    height: widget.height,
    child: CustomPaint(
    painter: BazaarTopPainter(widget.shadColor),
    ),
    ),
    
        ),

        // Bottom lightsource
        Opacity(
          opacity: normalizedVal(0,6,getQ4(widget.x)*widget.shadowSize),
          child: SizedBox(
    width: widget.width,
    height: widget.height,
    child: CustomPaint(
    painter: BazaarBottomPainter(widget.shadColor),
    ),
    ),
    
        ),
        widget.child,
      ],
    );
  }
}
