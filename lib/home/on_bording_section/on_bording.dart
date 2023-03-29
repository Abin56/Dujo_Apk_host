// ignore_for_file: deprecated_member_use
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../signing/appLoginInterface.dart';
import '../../signing/select_school.dart';
import '../../widget/button_container.dart';
import '../home.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        showBackButton: false,
        showNextButton: true,
        pages: [
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/dujoo.png')),
            title: 'WELCOME TO ',
            body: 'DuJo',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/dujoo.png')),
            title: 'Feed your mind\n',
            body: 'DuJo',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            image: const Image(image: AssetImage('assets/images/dujoo.png')),
            title: 'Change the world \n',
            body: 'DuJo',
            decoration: getPageDecoration(),
          ),
          PageViewModel(
              image: const Image(image: AssetImage('assets/images/dujoo.png')),
              title: 'Thank you for your patience\n Please Wait.... ',
              body: 'DuJo',
              decoration: getPageDecoration(),
              footer: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAll(OpeningPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: containerColor[0].first.withOpacity(0.4),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(4, 4),
                          ),
                        ],
                        gradient: LinearGradient(
                            colors: containerColor[0],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      height: 60,
                      width: 200,
                      child: const Center(child: Text("Lauch app",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                    ),
                  ),
                ],
              )),
        ],
        done: const Text(
          'Read',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        onDone: () => goToOnboard(context),
        showSkipButton: true,
        skip: const Text('Skip', style: TextStyle(color: Colors.black)),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        onChange: (index) => log('page $index selected'),
        dotsDecorator: getDotsDecorator(),
        animationDuration: 1000,
      ),
    );
  }

  // void goToHome(context) => Navigator.of(context)
  //     .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));

  void goToOnboard(context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const Onboardingpage()));

  // Widget buildimages(String path) {
  PageDecoration getPageDecoration() => const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, color: Colors.black),
        bodyTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        imagePadding: EdgeInsets.all(2),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
      color: Colors.amber,
      activeColor: Colors.red,
      size: const Size(12, 12),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ButtonContainerWidget(
        curving: 30,
        colorindex: 1,
        height: 60,
        width: 200,
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      );
}
//  RaisedButton(
//         onPressed: onClicked,
//         color: Colors.orange,
//         shape: const StadiumBorder(),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.black, fontSize: 16),