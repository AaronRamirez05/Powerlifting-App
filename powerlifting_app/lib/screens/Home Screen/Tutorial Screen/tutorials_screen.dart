import 'package:flutter/material.dart';
import 'package:powerlifting_app/screens/Home Screen/home_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _Tutorial createState() => _Tutorial();
}

class _Tutorial extends State<TutorialScreen> {
  late YoutubePlayerController _controller;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/shorts/8060FZiT5TA';
    const url2 = 'https://www.youtube.com/shorts/9SdwTIG6hJY';
    const url3 = 'https://www.youtube.com/shorts/PKsWnUXcYSQ';

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: YoutubePlayerFlags(autoPlay: false));

    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url2)!,
        flags: YoutubePlayerFlags(autoPlay: false));

    _controller3 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url3)!,
        flags: YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Tutorial Page",
            key: Key('tutcheck'),
            style: TextStyle(
                color: Colors.black, fontFamily: 'Open', fontSize: 30),
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.red,
            iconSize: 35,
            key: Key('back-cups'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homeScreen()));
            },
          ),
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'Squat Tutorial',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.red, fontFamily: 'Open'),
                )),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'How to Squat Properly (STEP BY STEP)',
                      style: TextStyle(
                          fontFamily: 'open',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Author: Squat University',
                      style: TextStyle(
                          fontFamily: 'open',
                          color: Colors.white,
                          fontSize: 13),
                    ),
                    SizedBox(height:20)

                  ],
                )),
                Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'Bench Tutorial',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.red, fontFamily: 'Open'),
                )),
                YoutubePlayer(
              controller: _controller2,
              showVideoProgressIndicator: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'How to: Bench Press',
                      style: TextStyle(
                          fontFamily: 'open',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Author: Squat University',
                      style: TextStyle(
                          fontFamily: 'open',
                          color: Colors.white,
                          fontSize: 13),
                    ),
                    SizedBox(height:10)

                  ],
                )),
                Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  'Deadlift Tutorial',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.red, fontFamily: 'Open'),
                )),
                YoutubePlayer(
              controller: _controller3,
              showVideoProgressIndicator: true,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'How To Deadlift: 3 STEPS!',
                      style: TextStyle(
                          fontFamily: 'open',
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Text(
                      'Author: Squat University',
                      style: TextStyle(
                          fontFamily: 'open',
                          color: Colors.white,
                          fontSize: 13),
                    ),
                    SizedBox(height:10)

                  ],
                )),

          ],

          
        ));
  }
}
