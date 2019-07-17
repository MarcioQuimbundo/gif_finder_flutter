import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  Future _getGifs() async {
    http.Response response;
    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=nD4w4LqTmJuDi8mhmLqmC7NxzycEV8lZ&limit=20&rating=G");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=nD4w4LqTmJuDi8mhmLqmC7NxzycEV8lZ&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
