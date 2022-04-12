import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novels/user/Login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:novels/user/Login.dart';
class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  int page = 0;

  // this function to change Page index
  void changePage(page) {
    setState(() {
      this.page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 520,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (int page) {
                          changePage(page);
                        },
                        children: [
                          Column(children: [
                            Container(
                                height: 400,
                                width: 500,
                                child: Image.asset("assets/images/first.png")),
                            const Text(
                              "Share Your Favourite Books With Your Family And Friends",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  letterSpacing: 4.0,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                          Column(children: [
                            Container(
                                height: 400,
                                width: 500,
                                child: Image.asset("assets/images/second.png")),
                            const Text(
                              "Discovery more than 1K novels Online",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  letterSpacing: 4.0,
                                  fontWeight: FontWeight.w400),
                            )
                          ]),
                          Column(children: [
                            Container(
                                height: 400,
                                width: 500,
                                child: Image.asset("assets/images/3th.png")),
                            const Text(
                              "Buy And Sell Books With Us",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  letterSpacing: 4.0,
                                  fontWeight: FontWeight.w400),
                            )
                          ])
                        ],
                      )),

                  SmoothPageIndicator(
                    controller: pageController, // PageController
                    count:3,
                    effect: CustomizableEffect(
                      activeDotDecoration:
                      DotDecoration(
                        width: 32,
                        height: 12,
                        color: const Color(0xffFF6EA1),
                        rotationAngle: 180,
                        verticalOffset: 0,
                        borderRadius:
                        BorderRadius
                            .circular(24),
                      ),
                      dotDecoration:
                      DotDecoration(
                        width: 24,
                        height: 12,
                        color: Colors.grey,
                        borderRadius:
                        BorderRadius
                            .circular(16),
                        verticalOffset: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    child: Container(
                        height: 45,
                        width: 180,
                        decoration: BoxDecoration(
                            color: const Color(0xffFF6EA1),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "التالي",
                          style: TextStyle(fontSize: 19, color: Colors.white),
                        ))),
                    onTap: () {
                      pageController.nextPage(
                          duration: const Duration(microseconds: 1000),
                          curve: Curves.easeIn);
                      if(page==2){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => Login()));
                      }
                    },
                  )
                ])));
  }
}
