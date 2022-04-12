import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  var email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(height: 50,width: MediaQuery.of(context).size.width),
        const Text("تسجيل الدخول",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, letterSpacing: 4.0,),),
        SizedBox(height: 50),
       ],)
    );
  }
}
