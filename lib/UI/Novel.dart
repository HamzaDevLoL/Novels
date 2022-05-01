import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:novels/UI/Chapter.dart';
import 'dart:convert';

import 'package:novels/UI/Comments.dart';

class Novel extends StatefulWidget {
  var novel;
  Novel(this.novel);

  @override
  State<Novel> createState() => _NovelState(novel);
}

class _NovelState extends State<Novel> {
  var novel;
  _NovelState(this.novel);
  var stutus = '';
  @override
  void initState() {
    super.initState();
    get_data();
    setState(() {
      switch (novel["status"]) {
        case 1:
          stutus = 'مستمرة';
          break;
        case 2:
          stutus = 'مكتملة';
          break;
        case 3:
          stutus = 'متوقفة';
          break;
        default:
      }
    });
  }

  var Chapters = [];

  Future get_data() async {
    print(novel["id"]);
    final response = await http.get(
        Uri.parse(
            "http://192.168.194.203:1600/reader/chapter/get/by/id?naval_id=" +
                novel["id"].toString()),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });
    var jsondata = jsonDecode(response.body);
    setState(() {
      print(response.body);
      Chapters = jsondata;
    });
  }

  Future AddLibary() async {
    print(novel["id"]);
    final response = await http.post(
      Uri.parse("http://192.168.194.203:1600/reader/Libary/add"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: <String, String>{
        'email': "Hamza.dev097@gmail.com",
        'password': "Hamza",
        'Novel_id': novel["id"].toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            top: true,
            bottom: true,
            child: ListView(children: [
              // const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 208,
                      width: MediaQuery.of(context).size.width * 0.35,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 2),
                            )
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                              "http://192.168.194.203:1600/photo/get/Noval?photo=" +
                                  (novel["noval_image"]).toString(),
                              fit: BoxFit.contain))),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.59,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                novel["noval_name"],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 23,
                                width: MediaQuery.of(context).size.width *
                                    0.59 *
                                    0.29,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        255, 110, 161, 0.7),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                child: Text(
                                  stutus,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 23,
                                width: MediaQuery.of(context).size.width *
                                    0.59 *
                                    0.23,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        255, 110, 161, 0.7),
                                    borderRadius: BorderRadius.circular(5)),
                                margin: const EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                child: Text(
                                  "مؤلفة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    
                    child: Container(
                      width: 110,
                      child: Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                          ),
                          Text("قائمتي",
                              style: TextStyle(fontSize: 19 * textScaleFactor))
                        ],
                      ),
                    ),
                    onTap: () {
                      AddLibary();
                    },
                  ),
                  InkWell(
                    child: Container(
                      width: 110,
                      child: Column(
                        children: [
                          Icon(
                            Icons.star_border,
                            size: 30,
                          ),
                          Text(
                            "اضافة تقيم",
                            style: TextStyle(fontSize: 19 * textScaleFactor),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "اضافة تقيم",
                                style:
                                    TextStyle(fontSize: 20 * textScaleFactor),
                              ),
                              content: Column(
                                children: [
                                  // Slider(
                                  //   // value: _currentSliderValue,
                                  //   max: 100,
                                  //   divisions: 5,
                                  //   label: _currentSliderValue.round().toString(),
                                  //   onChanged: (double value) {
                                  //     setState(() {
                                  //       _currentSliderValue = value;
                                  //     });
                                  //   },
                                  // )
                                ],
                              ),
                            );
                          });
                    },
                  ),
                  Container(
                    width: 110,
                    child: Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30,
                        ),
                        Text(
                          "8.5/10",
                          style: TextStyle(fontSize: 19 * textScaleFactor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfff7f7f7),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 2),
                              )
                            ]),
                        child: Text(novel["noval_dis"],
                            style: TextStyle(fontSize: 20 * textScaleFactor))),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(children: [
                          for (int i = 0; i < Chapters.length; i++)
                            Chapter(i + 1, Chapters)
                        ]))
                  ],
                ),
              )
            ])));
  }
}

class Chapter extends StatelessWidget {
  int i;
  var Chapter_;
  Chapter(this.i, this.Chapter_);
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return InkWell(
      onTap: () {
        Get.to(Chaptera(Chapter_, i));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xddf3f3f3),
        ),
        width: MediaQuery.of(context).size.width - 12,
        height: MediaQuery.of(context).size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "الفصل : $i",
                  style: TextStyle(
                      fontSize: textScaleFactor * 19,
                      fontWeight: FontWeight.bold),
                )),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {},
                  iconSize: textScaleFactor * 19,
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                    Get.to(Comments(int.parse(Chapter_["id"])));
                  },
                  iconSize: textScaleFactor * 19,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
