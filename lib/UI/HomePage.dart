import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:novels/UI/Novel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var list = [
    "",
    "",
  ];
  var novala = [];
  @override
  void initState() {
    super.initState();

    get_data();
    print(novala);
  }

  Future get_data() async {
    final response = await http.get(
      Uri.parse("http://192.168.194.203:1600/reader/noval/get"),
    );
    var jsondata = jsonDecode(response.body);
    setState(() {
      print(response.body);
      novala = jsondata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
              items: list
                  .map<Widget>(
                    (item) => Container(
                  height: 120,
                  width: 200,
                  margin: const EdgeInsets.all(7),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/welcom.png",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      )),
                ),
              )
                  .toList(),
              options: CarouselOptions(
                autoPlay: true,
                disableCenter: false,
              )),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(children: list.map<Widget>(
          //                     (item) => GridView(gridDelegate: )
          //                   )
          //                   .toList(),),
          // )
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Text(
              "محتوى رائج:",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (novala.length > 0)
                    for (int i = 0; i < 3; i++) noval(novala[i])
                  else
                    const CircularProgressIndicator()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (novala.length > 0)
                    for (int i = 3; i < 6; i++)  noval(novala[i])
                  else
                    const CircularProgressIndicator()
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class noval extends StatelessWidget {
  var novala;

  noval(this.novala);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 160,
          width: 110,
          child: Stack(
            children: [
              Image.network(
                  "http://192.168.194.203:1600/photo/get/Noval?photo=" +
                      (novala["noval_image"]).toString(),
                  fit: BoxFit.contain),
              Positioned(
                bottom: 2,
                right: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width/9,
                  height: MediaQuery.of(context).size.height/29,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 110, 161, 0.7),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.only(bottom: 7),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        'فصل:',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width/29, color: Colors.white),
                      ),
                       Text(
                        '8',
                        style: TextStyle(fontSize: MediaQuery.of(context).size.width/29, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
      onTap: () {
        Get.to(Novel(novala));
      },
    );
  }
}
