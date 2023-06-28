
import 'package:flutter/material.dart';

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



