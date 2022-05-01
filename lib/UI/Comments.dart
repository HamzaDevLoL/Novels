import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Comments extends StatefulWidget {
  var id;
  Comments(this.id);
  @override
  State<Comments> createState() => _CommentsState(id);
}

class _CommentsState extends State<Comments> {
  var id;
  _CommentsState(this.id);
  final TextEditingController CommentController = TextEditingController();
  var Comments;

  Future get_data() async {
    final response = await http.get(
        Uri.parse("http://192.168.194.203:1600/reader/comments/get?id=" +
            id.toString()),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        });
    var jsondata = jsonDecode(response.body);
    setState(() {
      Comments = jsondata;
      print(Comments);
    });
  }

  Future AddComment(String content) async {
    if(content.length > 0){
      final response = await http.post(
        Uri.parse("http://192.168.194.203:1600/reader/comments/add"),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
        body: <String, String>{
          'email': "Hamza.dev097@gmail.com",
          'password': "Hamza",
          'chapter_id': id.toString(),
          'content': content.toString(),
        },
      );
      setState(() {
        CommentController.clear();
        Comments.insert(0, {
          "content": content.toString(),
          "name": "Hamza Nazhan",
          "photo": "logo.png"
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    get_data();
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        body: SafeArea(
      top: true,

      bottom: true,
      child: ListView(
        children: [
          if (Comments != null)
            Container(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) *
                    0.92,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      for (int i = 0; i < Comments.length; i++)
                        Comment(Comments[i]),
                    ])))
          else
            const CircularProgressIndicator(),
          Container(
              color: Colors.white,
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) *
                  0.08,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.78,
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.01),
                    child: TextField(
                      controller: CommentController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: textScaleFactor * 18),
                        hintText: "اكتب تعليق",
                        contentPadding: const EdgeInsets.all(12),
                        isDense: true,
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            AddComment(CommentController.text);
                          }))
                ],
              ))
        ],
      ),
    ));
  }
}
// Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height*0.1,
//             color: Colors.amber,

//           )
class Comment extends StatelessWidget {
  var _Comment;
  Comment(this._Comment);

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: MediaQuery.of(context).size.width - 12,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: const Color(0xddf3f3f3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://192.168.194.203:1600/photo/get/user/avatar?photo=" +
                      _Comment['photo'].toString()),
            ),
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            width: MediaQuery.of(context).size.height * 0.06,
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    _Comment['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.79,
                  child: Text(
                    _Comment['content'],
                    style: TextStyle(fontSize: textScaleFactor * 19),
                  ),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ],
      ),
    );
  }
}
