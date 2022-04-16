import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Novel extends StatefulWidget {
  var novel;
  Novel(this.novel);

  @override
  State<Novel> createState() => _NovelState(novel);
}

class _NovelState extends State<Novel> {
  _NovelState(this.novel);
  var novel;
  var stutus = '';
  @override
  void initState() {
    super.initState();
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
    }});
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      const SizedBox(height: 15),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 208,
              width: 143,
              margin: const EdgeInsets.only(right: 10),
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
          const SizedBox(width: 10),
          Column(
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
                    width: (MediaQuery.of(context).size.width / 7) + 8,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 110, 161, 0.7),
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
                    width: (MediaQuery.of(context).size.width / 7) + 14,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 110, 161, 0.7),
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
              const SizedBox(height: 10),
              // Container(
              //   width: MediaQuery.of(context).size.width / 1.9,

              //   child: Text(
              //     novel["noval_dis"],
              //     style: const TextStyle(
              //       fontSize: 15,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              // Text(novel["noval_dis"]),
            ],
          )
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          
        ],
      )

    ]));
  }
}





/**
Size _textSize(String text) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      maxLines: 1,
      textDirection: TextDirection.rtl)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}
**/


