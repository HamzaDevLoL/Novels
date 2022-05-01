import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Chaptera extends StatefulWidget {
  var Chapter;
  var i;
  Chaptera(this.Chapter, this.i);
  @override
  State<Chaptera> createState() => _ChapteraState(Chapter, i);
}

class _ChapteraState extends State<Chaptera> {
  var Chapter;
  var text;
  var i;
  _ChapteraState(this.Chapter, this.i);
  void initState() {
    super.initState();
    get_data();
  }

  Future get_data() async {
    final response = await http.get(
        Uri.parse(
            "http://192.168.194.203:1600/reader/chapter/get/Chapters/text?textname=" +
                Chapter[i]["content"].toString()),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });
    var jsondata = response.body.toString();
    setState(() {
      text = jsondata;
    });
  }

  List<bool> isSelected1 = [false];
  List<bool> isSelected2 = [false];
  List<bool> isSelected3 = [false];
  List<bool> isSelected4 = [false];

  String dropdownValue = '100%';
  String dropdownValue1 = '100%';
  var defult = [20, 1];
  var sizes = [20.0, 1.0, 0.0];

  int defulthight = 1;
  double hight = 1.0;

  int defultsize = 20;
  double size = 20.0;
  Color color1 = Colors.white;
  Color color = Colors.black;


  Future<List?> ShowDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
                child: Column(
              children: [
                const Text(
                  "اضافة تقيم",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("حجم الخط"),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 180.0,
                      height: 48.0,
                      child: Column(
                        children: [
                          DropdownButton<String>(
                            // Step 3.,
                            isExpanded: true,
                            value: dropdownValue,
                            // Step 4.
                            items: <String>['100%', '120%', '140%', '160%']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                if (dropdownValue == '100%') {
                                  sizes[0] = defult[0] * 1.0;
                                } else if (dropdownValue == '120%') {
                                  sizes[0] = defult[0] * 1.2;
                                  print(sizes);
                                } else if (dropdownValue == '140%') {
                                  sizes[0] = defult[0] * 1.4;
                                } else if (dropdownValue == '160%') {
                                  sizes[0] = defult[0] * 1.6;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("ارتفاع الخط"),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 180.0,
                      height: 48.0,
                      child: Column(
                        children: [
                          DropdownButton<String>(
                            // Step 3.,
                            isExpanded: true,
                            value: dropdownValue1,
                            // Step 4.
                            items: <String>['100%', '120%', '140%', '160%']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value, child: Text(value));
                            }).toList(),
                            // Step 5.
                            onChanged: (String? newValue1) {
                              setState(() {
                                dropdownValue1 = newValue1!;
                                if (dropdownValue1 == '100%') {
                                  sizes[1] = defult[1] * 1.0;
                                } else if (dropdownValue1 == '120%') {
                                  sizes[1] = defult[1] * 1.2;
                                  print(sizes);
                                } else if (dropdownValue1 == '140%') {
                                  sizes[1] = defult[1] * 1.4;
                                } else if (dropdownValue1 == '160%') {
                                  sizes[1] = defult[1] * 1.6;
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("لون الخلفية"),
                    ToggleButtons(
                      selectedColor: Colors.black,
                      fillColor: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      isSelected: isSelected1,
                      onPressed: (int index) {
                        setState(() {
                          if (isSelected2[index] == true) {
                            isSelected2[index] = !isSelected2[index];
                          } else if (isSelected3[index] == true) {
                            isSelected3[index] = !isSelected3[index];
                          } else if (isSelected4[index] == true) {
                            isSelected4[index] = !isSelected4[index];
                          }
                          sizes[2] = 1.0;

                          isSelected1[index] = !isSelected1[index];
                        });
                      },
                      children: [
                        Text(
                          "ابيض",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    ToggleButtons(
                      selectedColor: Colors.black,
                      fillColor: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      isSelected: isSelected2,
                      onPressed: (int index) {
                        setState(() {
                          if (isSelected1[index] == true) {
                            isSelected1[index] = !isSelected1[index];
                          } else if (isSelected3[index] == true) {
                            isSelected3[index] = !isSelected3[index];
                          } else if (isSelected4[index] == true) {
                            isSelected4[index] = !isSelected4[index];
                          }
                          sizes[2] = 2.0;

                          isSelected2[index] = !isSelected2[index];
                        });
                      },
                      children: [
                        Text(
                          "بني",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    ToggleButtons(
                      selectedColor: Colors.black,
                      fillColor: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      isSelected: isSelected3,
                      onPressed: (int index) {
                        setState(() {
                          if (isSelected1[index] == true) {
                            isSelected1[index] = !isSelected1[index];
                          } else if (isSelected2[index] == true) {
                            isSelected2[index] = !isSelected2[index];
                          } else if (isSelected4[index] == true) {
                            isSelected4[index] = !isSelected4[index];
                          }
                          sizes[2] = 3.0;

                          isSelected3[index] = !isSelected3[index];
                        });
                      },
                      children: [
                        Text(
                          "ازرق",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    ToggleButtons(
                      selectedColor: Colors.black,
                      fillColor: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      isSelected: isSelected4,
                      onPressed: (int index) {
                        setState(() {
                          if (isSelected1[index] == true) {
                            isSelected1[index] = !isSelected1[index];
                          } else if (isSelected2[index] == true) {
                            isSelected2[index] = !isSelected2[index];
                          } else if (isSelected3[index] == true) {
                            isSelected3[index] = !isSelected3[index];
                          }

                          sizes[2] = 4.0;

                          isSelected4[index] = !isSelected4[index];
                        });
                      },
                      children: [
                        Text(
                          "اسود",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(sizes); // passing true
                  },
                  child: const Text('حفظ'),
                ),
              ],
            ));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                onTap: () {
                  ShowDialog(context).then((value) => {
                        print(value),
                        setState(() {
                          for (int i = 0; i < sizes.length; i++) {
                            sizes[i] = value![i];
                            print(sizes[i]);
                          }
                          if (sizes[2] == 1.0) {
                            color1 = Colors.white;
                            color = Colors.black;
                          } else if (sizes[2] == 2.0) {
                            color1 = Colors.brown.withOpacity(0.7);
                            color = Colors.black;
                          } else if (sizes[2] == 3.0) {
                            color1 = Colors.lightBlueAccent.withOpacity(0.5);
                            color = Colors.blue;
                          } else if (sizes[2] == 4.0) {
                            color1 = Colors.black;
                            color = Colors.white;
                          }
                        }),
                      });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        )
                      ]),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("اعدادات القاري"),
                        Icon(Icons.settings)
                      ]),
                ),
              ),
              Container(
                color: color1,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  text.toString(),
                  style: TextStyle(
                      fontSize: sizes[0], height: sizes[1], color: color),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      width: 110,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.arrow_circle_right,
                            size: 30,
                          ),
                          Text("التالي",
                              style: TextStyle(fontSize: 19 * textScaleFactor))
                        ],
                      ),
                    ),
                    onTap: () {
                      print(Chapter.length);
                      if (i == Chapter.length) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("err"),
                        ));
                      } else {
                        i += 1;
                        get_data();
                      }
                    },
                  ),
                  Container(
                    width: 110,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.star_border,
                          size: 30,
                        ),
                        Text(
                          i.toString() + "/" + Chapter.length.toString(),
                          style: TextStyle(fontSize: 19 * textScaleFactor),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (i == 1) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("err"),
                        ));
                      } else {
                        i -= 1;
                        get_data();
                      }
                    },
                    child: Container(
                      width: 110,
                      child: Column(
                        children: [
                          const Icon(
                            Icons.arrow_circle_left,
                            size: 30,
                          ),
                          Text(
                            "السابق",
                            style: TextStyle(fontSize: 19 * textScaleFactor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }



  
}