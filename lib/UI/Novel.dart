import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Novel extends StatefulWidget {
  var novel;
  Novel(this.novel);

  @override
  State<Novel> createState() => _NovelState(novel);
}

class _NovelState extends State<Novel> {
  var novel;
  _NovelState(this.novel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: []));
  }
}
