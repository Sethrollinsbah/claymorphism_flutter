
import 'dart:math';

import 'package:flutter/material.dart';

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

class BazaarImprintPainter extends CustomPainter {
  BazaarImprintPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;

    final gradient = RadialGradient(
      center: Alignment.center,
      radius: 0.5,
      colors: [Colors.black.withOpacity(.01), Colors.white.withOpacity(.1),Colors.white.withOpacity(.0)],
      stops: const [0.0, .9,01],
    );

    final paint = Paint()..shader = gradient.createShader(rect);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



class BazaarMainPainter extends CustomPainter {

  final List<Color> shadColor;
  BazaarMainPainter(this.shadColor);

  @override
  void paint(Canvas canvas, Size size, {double angle=.1,  }) {
     final rect = Offset.zero & size;
     final double roundedLine=(size.width+size.height)/20;
     LinearGradient gradient = const LinearGradient(stops: [0,1],end: Alignment.topLeft,begin: Alignment.bottomRight,colors: [Colors.white,Colors.white],);
    
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
          size.width * angle, -roundedLine, size.width * (1 - angle), -roundedLine, size.width, 0,)
      ..cubicTo(
          size.width + roundedLine, size.height * angle, size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(
          size.width * (1 - angle), size.height + roundedLine, size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(
          -roundedLine, size.height * (1 - angle), -roundedLine, size.height * angle, 0, 0,);

          canvas.drawShadow(
      path,
       Colors.black,
      10.0, // Spread radius
      false, // Whether to include the path interior
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BazaarCenterPainter extends CustomPainter {
  
  final List<Color> shadColor;

  BazaarCenterPainter(this.shadColor);
  @override
  void paint(Canvas canvas, Size size, {double angle=.1,  }) {
     final rect = Offset.zero & size;
     final double roundedLine=(size.width+size.height)/20;
     LinearGradient gradient = const LinearGradient(stops: [1],end: Alignment.topLeft,begin: Alignment.bottomRight,colors: [Color.fromARGB(16, 0, 0, 0)],);
    
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
          size.width * angle, -roundedLine, size.width * (1 - angle), -roundedLine, size.width, 0,)
      ..cubicTo(
          size.width + roundedLine, size.height * angle, size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(
          size.width * (1 - angle), size.height + roundedLine, size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(
          -roundedLine, size.height * (1 - angle), -roundedLine, size.height * angle, 0, 0,);
              // canvas.drawShadow(path, Colors.black, 4.0, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BazaarTopPainter extends CustomPainter {


  final List<Color> shadColor;
  BazaarTopPainter(this.shadColor);
  @override
  void paint(Canvas canvas, Size size, {double angle=.1,  }) {
     final rect = Offset.zero & size;
     final double roundedLine=(size.width+size.height)/20;
    LinearGradient gradient = LinearGradient(stops: const [0,.1,.9,1],end: Alignment.topCenter,begin: Alignment.bottomCenter,colors: shadColor,);
    
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
          size.width * angle, -roundedLine, size.width * (1 - angle), -roundedLine, size.width, 0,)
      ..cubicTo(
          size.width + roundedLine, size.height * angle, size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(
          size.width * (1 - angle), size.height + roundedLine, size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(
          -roundedLine, size.height * (1 - angle), -roundedLine, size.height * angle, 0, 0,);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class BazaarBottomPainter extends CustomPainter {


  final List<Color> shadColor;
  BazaarBottomPainter(this.shadColor);
  @override
  void paint(Canvas canvas, Size size, {double angle=.1,  }) {
     final rect = Offset.zero & size;
     final double roundedLine=(size.width+size.height)/20;
    LinearGradient gradient = LinearGradient(stops: const [0,.1,.9,1],begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: shadColor,);
    
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
          size.width * angle, -roundedLine, size.width * (1 - angle), -roundedLine, size.width, 0,)
      ..cubicTo(
          size.width + roundedLine, size.height * angle, size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(
          size.width * (1 - angle), size.height + roundedLine, size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(
          -roundedLine, size.height * (1 - angle), -roundedLine, size.height * angle, 0, 0,);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class BazaarLeftPainter extends CustomPainter {

  final List<Color> shadColor;
  BazaarLeftPainter(this.shadColor);
  @override
  void paint(Canvas canvas, Size size, {double angle=.1,  }) {
     final rect = Offset.zero & size;
     final double roundedLine=(size.width+size.height)/20;
    
     LinearGradient gradient = LinearGradient(stops: const [0,.1,.9,1],end: Alignment.centerLeft,begin: Alignment.centerRight,colors: shadColor,) ; 
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
          size.width * angle, -roundedLine, size.width * (1 - angle), -roundedLine, size.width, 0,)
      ..cubicTo(
          size.width + roundedLine, size.height * angle, size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(
          size.width * (1 - angle), size.height + roundedLine, size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(
          -roundedLine, size.height * (1 - angle), -roundedLine, size.height * angle, 0, 0,);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BazaarRightPainter extends CustomPainter {

  final List<Color> shadColor;
  BazaarRightPainter(this.shadColor);
  @override
  void paint(Canvas canvas, Size size, {double angle=.1,  }) {
     final rect = Offset.zero & size;
     final double roundedLine=(size.width+size.height)/20;
    
     LinearGradient gradient = LinearGradient(stops: const [0,.1,.9,1],begin: Alignment.centerLeft,end: Alignment.centerRight,colors: shadColor,) ; 
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(
          size.width * angle, -roundedLine, size.width * (1 - angle), -roundedLine, size.width, 0,)
      ..cubicTo(
          size.width + roundedLine, size.height * angle, size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(
          size.width * (1 - angle), size.height + roundedLine, size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(
          -roundedLine, size.height * (1 - angle), -roundedLine, size.height * angle, 0, 0,);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



class BazShadow extends CustomPainter {
  final List<Color> shadColor;

  BazShadow(this.shadColor);

  @override
  void paint(Canvas canvas, Size size, {double angle = 0.1}) {
    final rect = Offset.zero & size;
    final double roundedLine = (size.width + size.height) / 20;

    LinearGradient gradient = const LinearGradient(
      stops: [0],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.black12],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(size.width * angle, -roundedLine, size.width * (1 - angle),
          -roundedLine, size.width, 0,)
      ..cubicTo(size.width + roundedLine, size.height * angle,
          size.width + roundedLine, size.height * (1 - angle), size.width, size.height,)
      ..cubicTo(size.width * (1 - angle), size.height + roundedLine,
          size.width * angle, size.height + roundedLine, 0, size.height,)
      ..cubicTo(-roundedLine, size.height * (1 - angle),
          -roundedLine, size.height * angle, 0, 0,);

    // Create a blur mask filter
    const blurSigma = 5.0;
    const blurStyle = BlurStyle.normal;
    const maskFilter = MaskFilter.blur(blurStyle, blurSigma);

    // Apply the blur mask filter to the paint
    paint.maskFilter = maskFilter;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



