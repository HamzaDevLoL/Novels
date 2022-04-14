import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:novels/UI/BottomNavigationBar.dart';

class Sing_Up extends StatefulWidget {
  const Sing_Up({Key? key}) : super(key: key);

  @override
  State<Sing_Up> createState() => _Sing_UpState();
}

class _Sing_UpState extends State<Sing_Up> {
  var email = "";
  bool on = true;
  Future Sing_Up(String email, String name, String password) async {
    final response = await http.post(
      Uri.parse("http://192.168.194.203:1600/user/b/new"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'email': email, 'password': password, 'name': name}),
    );
    if (json.decode(response.body)["status"] == true) {
      Get.off(BottomNavigationBarClass());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("err"),
      ));
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 50, width: MediaQuery.of(context).size.width),
        Container(
            alignment: Alignment.center,
            width: 550,
            height: 150,
            child: Image.asset("assets/images/welcom.png")),
        SizedBox(height: 50),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: nameController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffCECECE), width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  color: Color(0xffFF6EA1),
                  width: 2.5,
                ),
              ),
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xffFF6EA1),
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
              hintText: "اسم المستخدم",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: emailController,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffCECECE), width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  color: Color(0xffFF6EA1),
                  width: 2.5,
                ),
              ),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xffFF6EA1),
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
              hintText: "البريد الالكتروني",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: passwordController,
            obscureText: on,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Color(0xffCECECE), width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                borderSide: BorderSide(
                  color: Color(0xffFF6EA1),
                  width: 2.5,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffFF6EA1),
              ),
              suffixIcon: IconButton(
                  icon: Icon(on ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xffFF6EA1)),
                  onPressed: () {
                    setState(() {
                      on = !on;
                    });
                  }),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
              hintText: "كلمة المرور",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 40, right: 40),
              decoration: BoxDecoration(
                  color: const Color(0xffFF6EA1),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xffFF6EA1),
                      Color.fromARGB(255, 209, 103, 140),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: const Center(
                  child: Text(
                "انشاء الحساب",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ))),
          onTap: () {
            Sing_Up(emailController.text, nameController.text,
                passwordController.text);
          },
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text("او", style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
        SizedBox(
          height: 3,
        ),
        InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              "لا تملك حساب ؟ انشاء حساب",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        )
      ],
    ));
  }
}