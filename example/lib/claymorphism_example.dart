import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens/clay_card_with_shadow.dart';

class ClaymorphismExample extends StatefulWidget {
  final double width;
  
  final num heightMultiplier;

  const ClaymorphismExample({super.key, required this.width, this.heightMultiplier=1});

  @override
  State<ClaymorphismExample> createState() => _ClaymorphismExampleState();
}

class _ClaymorphismExampleState extends State<ClaymorphismExample> {
  double x = 180;
  double z = 5;
  
     Color  endColor = CupertinoColors.systemGrey.withOpacity(.4);
     Color bgColor = CupertinoColors.systemGrey;

  double shadowSize = 2;
  
  String col='Grey';
  
  bool hover = false;
  bool bounce = true;

  double getAngleInDegrees(Offset point1, Offset point2) {
  double dx = point2.dx - point1.dx;
  double dy = point2.dy - point1.dy;
  
  double radians = atan2(dy, dx);
  
  return radians*(180/pi);
}

Widget _colorPalette(String string, Color endColorPicked, Color bgColorPicked, ){
  return Tooltip(
    message: string,
    child: GestureDetector(
      onTap: (){
        setState(() {
          col=string;
        });
          if(col=='Red'){
       endColor =const Color.fromARGB(98, 244, 67, 54);
       bgColor = Colors.red;
      return;
  } else if (col=='Orange'){
       endColor = const Color.fromARGB(99, 255, 152, 0);
       bgColor = Colors.orange;
      return;
  } else if(col=='Yellow'){
       endColor = const Color.fromARGB(99, 255, 193, 7);
       bgColor = Colors.amber;
      return;
  } else if (col=='Green'){
       endColor = const Color.fromARGB(98, 76, 175, 79);
       bgColor = Colors.green;
      return;
  } else if(col=='Blue'){
       endColor = const Color.fromARGB(99, 33, 149, 243);
      bgColor = Colors.blue;
      return;
  } else if (col=='Indigo'){
       endColor =  const Color.fromARGB(97, 63, 81, 181);
       bgColor = Colors.indigo;
      return;
  } else if (col=='Violet'){
       endColor = const Color.fromARGB(100, 155, 39, 176);
      bgColor = Colors.purple;
      return;
  }else if (col=='Grey'){
       endColor = CupertinoColors.systemGrey.withOpacity(.4);
      bgColor = CupertinoColors.systemGrey;
      return;
  }

       endColor =  const Color.fromARGB(100, 155, 39, 176);
       bgColor = Colors.purple;
      },
      child: Container(
        height: (MediaQuery.of(context).size.width<600)?MediaQuery.of(context).size.width*.08:50,
        width: (MediaQuery.of(context).size.width<600)?MediaQuery.of(context).size.width*.08:50,
        decoration: BoxDecoration(border: Border.all(color: endColorPicked, width: 10), boxShadow: const [BoxShadow()], shape: BoxShape.circle, color: bgColorPicked),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MouseRegion(
              child: Container(
                width: widget.width,
                color: bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(              
                      color: Colors.white,
                      width: widget.width,
                      height: (MediaQuery.of(context).size.height*.1)*widget.heightMultiplier,
                      child: const Center(child: Text('Claymorphism Example', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),))
                    ),
                    SizedBox(      
                      width: widget.width,
                      height: (MediaQuery.of(context).size.height*.25)*widget.heightMultiplier,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Color Scheme'),
                              Row(
                            children: [
                              _colorPalette('Grey', CupertinoColors.systemGrey.withOpacity(.4),CupertinoColors.systemGrey ),
                              _colorPalette('Red',const Color.fromARGB(98, 244, 67, 54),Colors.red ),
                              _colorPalette('Orange',const Color.fromARGB(99, 255, 152, 0),Colors.orange),
                              _colorPalette('Yellow', const Color.fromARGB(99, 255, 193, 7),Colors.amber),
                            ],
                          ),
                              Row(
                                children: [
                                  _colorPalette('Green',const Color.fromARGB(98, 76, 175, 79),Colors.green ),
                                  _colorPalette('Blue', const Color.fromARGB(99, 33, 149, 243),Colors.blue),
                                  _colorPalette('Indigo', const Color.fromARGB(97, 63, 81, 181), Colors.indigo),
                                  _colorPalette('Violet', const Color.fromARGB(100, 155, 39, 176),Colors.purple),
                                ],
                              ),
                            ],
                          ),
                          
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Orbit\nLightsource:'),
                                      Text('Lightsource\nDistance:'),
                                      Text('Rotation\nRadius:'),
                                        ],
                                      ),
                                      
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: (MediaQuery.of(context).size.width<600)?MediaQuery.of(context).size.width*.4:null,
                                            child: Slider(
                                              activeColor: Colors.white10,
                                              inactiveColor: Colors.white60,
                                              value: x,
                                              min: 0,
                                              max: 360,
                                              onChanged: (value) {
                                                setState(() {
                                            x = value;
                                                });
                                              },
                                            ),
                                          ),

                                          SizedBox(
                                    width: (MediaQuery.of(context).size.width<600)?MediaQuery.of(context).size.width*.4:null,
                                        child: Slider(
                                          activeColor: Colors.white10,
                                          inactiveColor: Colors.white60,
                                          value: shadowSize,
                                          min: 0,
                                          max: 6,
                                          onChanged: (value) {
                                            setState(() {
                                        shadowSize = value;
                                            });
                                          },
                                        ),
                                      ),
SizedBox(
                                    width: (MediaQuery.of(context).size.width<600)?MediaQuery.of(context).size.width*.4:null,
                                        child: Slider(
                                          activeColor: Colors.white10,
                                          inactiveColor: Colors.white60,
                                          value: z,
                                          min: 1,
                                          max: 100,
                                          onChanged: (value) {
                                            setState(() {
                                        z = value;
                                            });
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                    ],
                                  ),
                        ],
                      ),
                    ),
                     Stack(
                       children: [
                        SizedBox(
                          width:MediaQuery.of(context).size.width,
                          child: Center(child: CardWithShadow(height: (MediaQuery.of(context).size.height*.65)*widget.heightMultiplier,width: (MediaQuery.of(context).size.height*.65)*widget.heightMultiplier, x: x,z:z, shadowSize: shadowSize, shadColor: [endColor,Colors.white24, endColor,Colors.white10], endColor: endColor, ).animate( onPlay: (controller){controller.repeat(reverse: true);}).moveY(curve: Curves.decelerate, duration: 1200.milliseconds))),
                         Positioned(
                          bottom: 20,
                          left: 20,
                          child: GestureDetector(
                            onTap: (){
                                  launchUrl(Uri.parse('https://bauhausresearch.com'));
                            },
                            child: Tooltip(
                              message: 'Come back to us',
                              child: SizedBox(height: 50,child: Image.asset('assets/bauhaus_logo.png')))),
                        ),
                       ],
                     )
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}

// Color endColor = Color.fromARGB(99, 38, 98, 202);
