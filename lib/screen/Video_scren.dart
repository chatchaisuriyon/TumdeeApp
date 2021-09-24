import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  TextEditingController _addItemController = TextEditingController();
  DocumentReference linkRef;
  List<String> videoID = [];
  bool showItem = false;
  final utube =
      RegExp(r"^(https?\:\/\/)?((www\.)?youtube\.com|youtu\.?be)\/.+$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
          'ฟังธรรม',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Mitr'),
        ),
        centerTitle: true, // this is all you need
        // backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              controller: _addItemController,
              onEditingComplete: () {
                if (utube.hasMatch(_addItemController.text)) {
                  _addItemFuntion();
                } else {
                  FocusScope.of(this.context).unfocus();
                  _addItemController.clear();
                  Flushbar(
                    title: 'Invalid Link',
                    message: 'Please provide a valid link',
                    duration: Duration(seconds: 3),
                    icon: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                  )..show(context);
                }
              },
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Mitr',
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  labelText: 'Your Video URL',
                  labelStyle: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.add, size: 32),
                    onTap: () {
                      if (utube.hasMatch(_addItemController.text)) {
                        _addItemFuntion();
                      } else {
                        FocusScope.of(this.context).unfocus();
                        _addItemController.clear();
                        Flushbar(
                          title: 'Invalid Link',
                          message: 'Please provide a valid link',
                          duration: Duration(seconds: 3),
                          icon: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                        )..show(context);
                      }
                    },
                  )),
            ),
          ),
          Flexible(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                      itemCount: videoID.length,
                      itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.all(8),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                  initialVideoId: YoutubePlayer.convertUrlToId(
                                      videoID[index]),
                                  flags: YoutubePlayerFlags(
                                    autoPlay: false,
                                  )),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.blue,
                              progressColors: ProgressBarColors(
                                  playedColor: Colors.blue,
                                  handleColor: Colors.blueAccent),
                            ),
                          )))),
        ],
      ),
    );
  }

  @override
  void initState() {
    linkRef = FirebaseFirestore.instance.collection('links').doc('urls');
    super.initState();
    getData();
    print(videoID);
  }

  _addItemFuntion() async {
    await linkRef.set({
      _addItemController.text.toString(): _addItemController.text.toString()
    }, SetOptions(merge: true));
    Flushbar(
        title: 'Added',
        message: 'updating...',
        duration: Duration(seconds: 3),
        icon: Icon(Icons.info_outline))
      ..show(context);
    setState(() {
      videoID.add(_addItemController.text);
    });
    print('added');
    FocusScope.of(this.context).unfocus();
    _addItemController.clear();
  }

  getData() async {
    await linkRef
        .get()
        // .then((value) => value.data as List ?.forEach((key, value) {
        // if (!videoID.contains(value)) {
        // videoID.add(value);
        // }
        // }

        .then((value) {
          /// if the data is a list;
          (value?.data as List)?.forEach(value);
          {
            /// if the data is a map as it should be
            //  (value.data['myList'] as List).forEach();

            // ))
            //
            if (!videoID.contains(value)) {
              videoID.add(value);
            }
          }
        }(() => setState(() {
              // videoID.shuffle();
              showItem = true;
            })));
  }
}
