import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novels/UI/HomePage.dart';
import 'package:novels/UI/Novel.dart';

class Library extends StatefulWidget {
  const Library({ Key? key }) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {


  var list = [{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},{"id":18,"noval_name":"رواية عالم تحدي الدان","noval_dis":"قابل الشاب تشن شيانغ بشكل مع آلهة والشيطان وتلقى تراثهم المنقطع النظير، العروق الالهية، الفنون القتالية القصوى، وتقنيات الكيمياء الفائقة، والذي منحه رحلة سهلة في طريق تدريبه.\nعندما يحس بالجوع، يقوم بصقل بعض الحبوب الروحية لتناولها كوجبة خفيفة، وعندما يكون وحيدًا يغازل الالهة ، عندما يشعر بالملل يعبث مع الفنانين القتاليينن الذين جاءوا للتوسل للحصول على الحبوب الروحية،.","noval_image":"image-1649968784478.png","status":1,"user_id":1},];

  @override
  Widget build(BuildContext context) {
    print(list.length);
    return Scaffold(
    body: ListView(
      // height: 400,
      // width: 400,
      
      children:[ SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [
              if (list.length > 0)
                for (int i = 0; i < list.length; i+=2)
                  Container(
                    child: Row(children: [for (int j = i; j <= i+1 &&j < list.length; j++)Novale(list[j])]),
                  )
              else
                const CircularProgressIndicator()
            ]),
          )
      ],),
    );
  }
}





class Novale extends StatelessWidget {
  var novala;

  Novale(this.novala);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      child: Container(
          width: MediaQuery.of(context).size.width *0.4,
          height: MediaQuery.of(context).size.height *0.27,
          margin:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.05, vertical: MediaQuery.of(context).size.height *0.01),
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
          child: Stack(
            children: [
              ClipRRect(

                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                      "http://192.168.194.203:1600/photo/get/Noval?photo=" +
                          (novala["noval_image"]).toString(),
                      fit: BoxFit.fill)),
              Positioned(
                bottom: 4,
                right: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width / 9,
                  height: MediaQuery.of(context).size.height / 29,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 110, 161, 0.7),
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.only(bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'فصل:',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 29,
                            color: Colors.white),
                      ),
                      Text(
                        '8',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 29,
                            color: Colors.white),
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
