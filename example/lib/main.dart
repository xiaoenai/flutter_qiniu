import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qiniu/flutter_qiniu.dart';
import 'package:flutter_qiniu/flutter_qiniu_config.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  File _image;
  String _filePath;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      print('图片地址:${pickedFile.path}');
      _filePath = pickedFile.path;
      _image = File(pickedFile.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Running on: ${FlutterQiNiu.platformVersion}\n'),
              FlatButton(
                child: Text('选择图片'),
                onPressed: () {
                  getImage();
                },
              ),
              Container(
                height: 300,
                width: 300,
                child: _image == null ? Text('No image selected.') : Image.file(
                    _image),
              ),
              FlatButton(
                child: Text('上传图片'),
                onPressed: () async {
                  FlutterQiNiuConfig config = FlutterQiNiuConfig(
                      token: 'fG4R4vdljfy24rzGLro27S51VFLsCEO7WZay23fM:xehpsYruWjN-2v_HfoQQEh2pPTA=:eyJkZWFkbGluZSI6MTU5NTUwMzY4NCwibWltZUxpbWl0IjoiaW1hZ2UvKiIsInJldHVybkJvZHkiOiJ7XCJiYXNlX3VybFwiOlwiaHR0cDovL3h4cS5hdmF0YXIueGlhb2VuYWkuY29tL1wiLCBcImtleVwiOiAkKGtleSksIFwid2lkdGhcIjogJChpbWFnZUluZm8ud2lkdGgpLCBcImhlaWdodFwiOiAkKGltYWdlSW5mby5oZWlnaHQpfSIsInNhdmVLZXkiOiIkKGV0YWcpJChleHQpIiwic2NvcGUiOiJ4aWFveGlucWluZy1hdmF0YXIifQ==',
                      filePath: _filePath);


//                  FlutterQiNiu.upload

//                  print('flutter 结果:$result');
                },
              ),
              Text('ssss'),
            ],
          ),
        ),
      ),
    );
  }
}
