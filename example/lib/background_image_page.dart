
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BgImage extends StatefulWidget {
  final double width, height, device;
  const BgImage({super.key, required this.width, required this.height, required this.device});

  @override
  State<BgImage> createState() => _BgImageState();
}

class _BgImageState extends State<BgImage> {

  bool hover = false;
  bool bounce = true;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
              onEnter: (event) => setState(() {
                hover=true;
              }),
              onExit: (event) => setState(() {
                hover=false;
              }),
              child: SizedBox(
                      width: widget.width,
                      height: widget.height,
                child: Stack(
                  children: [
                    SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: Image.asset('assets/bauhaus_research_claymorphism_image.PNG', fit: BoxFit.cover,).animate(target: hover?1:0).blur().tint(color: Colors.black45),
                    ),
                    (widget.device==0)
                    // tablet
                    ?
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: GestureDetector(
                              onTap: (){
                                launchUrl(Uri.parse('https://bauhausresearch.com'));
                              },
                                child: Container(
                                  color: Colors.black,
                                  child: const Text('BACK TO BAUHAUS RESEARCH', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),).animate(target: hover?1:0).then(delay: 400.milliseconds).fadeIn().shimmer()
                                ).animate(target: hover?1:0).fadeIn(),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                              launchUrl(Uri.parse('https://pub.dev/documentation/claymorphism/latest/'));
                              },
                              child: Container(
                                color: Colors.black,
                                child: const Text('BACK TO THE DOCS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),).animate(target: hover?1:0).then(delay: 400.milliseconds).fadeIn().shimmer()
                              ).animate(target: hover?1:0).fadeIn(),
                            ),
                                                          
                                                          Row(
                                                            children: [
                                                              CupertinoButton(child: const Icon(CupertinoIcons.mail_solid,  color: Colors.white54,), onPressed: ()async{
                        String email = Uri.encodeComponent("ryan@bauhausresearch.com");
                        String subject = Uri.encodeComponent("Hello Ryan!");
                        String body = Uri.encodeComponent("Hi! I'd just like to reach out...");
                        //output: Hello%20Flutter
                        Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                        if (await launchUrl(mail)) {
                            launchUrl(Uri.parse('https://bauhausresearch.com'));
                        }else{
                            launchUrl(Uri.parse('https://bauhausresearch.com/letstalk'));
                        }
                                  },),
                              CupertinoButton(child: const Icon(FontAwesomeIcons.twitter, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://twitter.com/bauhausresearch')); }),
                          CupertinoButton(child: const Icon(FontAwesomeIcons.youtube, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://www.youtube.com/channel/UCa2sfi23szBjhLqjlQz88LQ')); }),
                          CupertinoButton(child: const Icon(FontAwesomeIcons.instagram, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://www.instagram.com/bauhausresearch/')); }),
                                                            ],
                                                          ),
                          ],
                        ),
                      ),
                    )
                    :
                    // mobile
                    (widget.device==1)
                    ?
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: GestureDetector(
                              onTap: (){
                                launchUrl(Uri.parse('https://bauhausresearch.com'));
                              },
                                      child: Container(
                                        color: Colors.black,
                                        child: const Text('BACK TO BAUHAUS RESEARCH', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                                      )
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                              launchUrl(Uri.parse('https://pub.dev/documentation/claymorphism/latest/'));
                                    },
                                    child: Container(
                                      color: Colors.black,
                                      child: const Text('BACK TO THE DOCS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                                    )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              CupertinoButton(child: const Icon(CupertinoIcons.mail_solid, color: Colors.white54,), onPressed: ()async{
                                              String email = Uri.encodeComponent("ryan@bauhausresearch.com");
                                              String subject = Uri.encodeComponent("Hello Ryan!");
                                              String body = Uri.encodeComponent("Hi! I'd just like to reach out...");
                                              //output: Hello%20Flutter
                                              Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                                              if (await launchUrl(mail)) {
                            launchUrl(Uri.parse('https://bauhausresearch.com'));
                                              }else{
                            launchUrl(Uri.parse('https://bauhausresearch.com/letstalk'));
                                              }
                                  },).animate(onPlay: (controller) => controller.repeat(reverse: true),).moveY(curve: Curves.decelerate, duration: 1000.milliseconds),
                              CupertinoButton(child: const Icon(FontAwesomeIcons.twitter, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://twitter.com/bauhausresearch')); }).animate(onPlay: (controller) => controller.repeat(reverse: true),).moveY(curve: Curves.decelerate, duration: 1250.milliseconds),
                          CupertinoButton(child: const Icon(FontAwesomeIcons.youtube, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://www.youtube.com/channel/UCa2sfi23szBjhLqjlQz88LQ')); }).animate(onPlay: (controller) => controller.repeat(reverse: true),).moveY(curve: Curves.decelerate, duration: 1500.milliseconds),
                          CupertinoButton(child: const Icon(FontAwesomeIcons.instagram, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://www.instagram.com/bauhausresearch/')); }).animate(onPlay: (controller) => controller.repeat(reverse: true),).moveY(curve: Curves.decelerate, duration: 1750.milliseconds),
                                                            ],
                                                          ),
                        ),
                      ],
                    )
                    :
                    // desktop
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0),
                            child: GestureDetector(
                              onTap: (){
                                launchUrl(Uri.parse('https://bauhausresearch.com'));
                              },
                              child: Container(
                                color: Colors.black,
                                child: const Text('BACK TO BAUHAUS RESEARCH', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),).animate(target: hover?1:0).then(delay: 400.milliseconds).fadeIn().shimmer()
                              ).animate(target: hover?1:0).fadeIn(),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              launchUrl(Uri.parse('https://pub.dev/documentation/claymorphism/latest/'));
                            },
                            child: Container(
                              color: Colors.black,
                              child: const Text('API REFERENCE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),).animate(target: hover?1:0).then(delay: 400.milliseconds).fadeIn().shimmer()
                            ).animate(target: hover?1:0).fadeIn(),
                          ),
                                                        
                                                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            CupertinoButton(child: const  Icon(CupertinoIcons.mail_solid,  color: Colors.white54,), onPressed: ()async{
                      String email = Uri.encodeComponent("ryan@bauhausresearch.com");
                      String subject = Uri.encodeComponent("Hello Ryan!");
                      String body = Uri.encodeComponent("Hi! I'd just like to reach out...");
                      //output: Hello%20Flutter
                      Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                          launchUrl(Uri.parse('https://bauhausresearch.com'));
                      }else{
                          launchUrl(Uri.parse('https://bauhausresearch.com/letstalk'));
                      }
                                },),
                            CupertinoButton(child: const Icon(FontAwesomeIcons.twitter, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://twitter.com/bauhausresearch')); }),
                        CupertinoButton(child: const Icon(FontAwesomeIcons.youtube, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://www.youtube.com/channel/UCa2sfi23szBjhLqjlQz88LQ')); }),
                        CupertinoButton(child: const Icon(FontAwesomeIcons.instagram, color: Colors.white54,), onPressed: (){ launchUrl(Uri.parse('https://www.instagram.com/bauhausresearch/')); }),
                                                          ],
                                                        ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
  }
}