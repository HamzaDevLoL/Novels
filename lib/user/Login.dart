import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novels/UI/BottomNavigationBar.dart';
import 'package:novels/user/SingUp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = "";
  bool on = true;
  Future Login(String email, String password) async {
    final response = await http.post(
      Uri.parse("http://192.168.194.203:1600/user/a/login"),
        headers:<String, String> {
          'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: <String, String>{
          'email': "Hamza.dev097@gmail.com",
          'password': "Hamza",
        },
    );
    if (json.decode(response.body)["status"] == true) {
      Get.off(BottomNavigationBarClass());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.body.toString()),
      ));
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
        SizedBox(height: 20),
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
        Container(
          padding: const EdgeInsets.only(right: 8.0),
          height: 33,
          child: InkWell(
              child: Text(
            "نسيت كلمة المرور",
            style: TextStyle(color: Colors.grey),
          )),
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
                "تسجيل الدخول",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ))),
          onTap: () {
            Login(emailController.text, passwordController.text);
          },
        ),
        Center(
          child: Text("او", style: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Sing_Up()));
          },
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
