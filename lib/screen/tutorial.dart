import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labroute/widget/BackHome.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoList2 extends StatefulWidget {
  @override
  _VideoList2State createState() => _VideoList2State();
}

class _VideoList2State extends State<VideoList2> {
  final List<YoutubePlayerController> _controllers = [
    'nML6Q3pTlb8',
    // 'ydOMSPKujC0',
    // '9NSjaZp4DVU',
    // 'E9pR-FTOoic',
    // 'tLP8RrIQGPU',
    // 'WAgBMxZ5JF0',
    // '9IT669AAgdk',
    // 'B5O5wcRVFOY',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(
            "วิธีการใช้งานแอปพลิเคชัน",
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
        body: getBody());
  }

  Widget getBody() {
    return ListView.separated(
      // padding: const EdgeInsets.all(0.0),
      itemBuilder: (context, index) {
        return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'วิดีโอสาธิต วิธีการใช้งานแอปพลิเคชัน',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Mitr',
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      YoutubePlayer(
                        aspectRatio: 9 / 16,
                        key: ObjectKey(_controllers),
                        controller: _controllers[index],
                        actionsPadding:
                            const EdgeInsets.only(left: 16.0, right: 16),
                        bottomActions: [
                          CurrentPosition(),
                          const SizedBox(width: 10.0),
                          ProgressBar(isExpanded: true),
                          const SizedBox(width: 10.0),
                          RemainingDuration(),
                          FullScreenButton(),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Credit Youtube : ทำดี ธรรมดี',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Mitr',
                          color: Colors.grey,
                        ),
                      ),
                    ])));
      },
      itemCount: _controllers.length,
      separatorBuilder: (context, _) => const SizedBox(height: 10.0),
    );
  }

  Widget bottompage() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(children: <Widget>[
        Text(
          'ทำดี ธรรมดี. © 2021\nSakonnakhon Rajabhat University. ',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
        Container(
          // padding: const EdgeInsets.only(top: 16),
          margin: EdgeInsets.only(left: 140, right: 140, top: 8, bottom: 16),
          // width: 100,
          height: 40,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300].withOpacity(1),
                  spreadRadius: 1.5,
                  blurRadius: 2,
                  offset: Offset(2, 4), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                // fit: BoxFit.fill,
                image: NetworkImage(
                    'https://eus-www.sway-cdn.com/s/1lXluYDa4tRr3PzF/images/BSJ5eF_kwT9opN?quality=640&allowAnimation=true'),
                // fit: BoxFit.cover,
              )),
          // Column(children: <Widget>[
        ),
      ]),
    );
  }
}
