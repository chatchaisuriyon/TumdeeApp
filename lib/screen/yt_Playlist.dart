import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:labroute/widget/BackHome.dart';

class Playlist extends StatefulWidget {
  // const Playlist({ Key? key }) : super(key: key);
  Playlist({this.url, this.title});
  final String title, url;
  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(Uri.parse(widget.url));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ฟังธรรม",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
        ),
        leading: BackHome(),
        centerTitle: true, // this is all you need
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFFFAFA33),
                  const Color(0xFFFFFFFF),
                ],
                begin: const FractionalOffset(0.3, 0.0),
                end: const FractionalOffset(1.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ),
      // drawer: BackHome(),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {},
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                new GestureDetector(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new VideoPlay(
                          url:
                              "https://youtube.com/embed/${list[i]['contentDetails']['videoId']}"))),
                  child: new Container(
                    height: 210,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(list[i]['snippet']['thumbnails']
                                ['high']['url']),
                            fit: BoxFit.cover)),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class VideoPlay extends StatelessWidget {
  final String url;
  VideoPlay({this.url});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new WebviewScaffold(url: url),
    );
  }
}
